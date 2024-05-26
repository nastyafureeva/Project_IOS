// MARK: - Фуреева Анастасия
import UIKit
import FirebaseAuth
import Combine
import SwiftUI

final class ConversationsViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private let noConversationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Нет диалогов"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.isHidden = true
        return label
    }()

    private let toBooksButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Автоликбез", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let viewModel: ConversationsViewModel

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.viewModel = ConversationsViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self,
                                                            action: #selector(didTapComposeButton))
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(noConversationsLabel)
        view.addSubview(toBooksButton)

        toBooksButton.addTarget(self, action: #selector(didTapToBooksButton), for: .touchUpInside)
        setupTableView()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.validateAuth()
    }


    @objc private func didTapToBooksButton() {
        viewModel.navigateToBooksFunc()
        print("didTapToBooksButton")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds


        toBooksButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toBooksButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        toBooksButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        toBooksButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc private func didTapComposeButton() {
        let vc = NewConversationViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }

    private func bindViewModel() {

        viewModel.$isHidden
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isHidden in
                self?.tableView.isHidden = isHidden
            }
            .store(in: &cancellables)


        viewModel.$noConversationsLabelHidden
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isHidden in
                self?.noConversationsLabel.isHidden = isHidden
            }
            .store(in: &cancellables)

        viewModel.$navigateToBooks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] nav in
                if nav == true {
                    let vc = BookReaderView()
                    let hostingController = UIHostingController(rootView: vc)
                    self?.navigationController?.pushViewController(hostingController, animated: nav)
                }}
            .store(in: &cancellables)
    }

}

extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Настя Ф"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ChatViewController()
        vc.title = "Настя Ф"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

