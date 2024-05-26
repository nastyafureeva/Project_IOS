// MARK: - Фуреева Анастасия
import UIKit
import MessageKit

struct Message:MessageType{
    var sender: any MessageKit.SenderType

    var messageId: String

    var sentDate: Date

    var kind: MessageKit.MessageKind


}
struct Sender: SenderType{
    var senderId: String

    var displayName: String


}
final class ChatViewController: MessagesViewController {

private var messages = [Message]()
    private let selfSender = Sender(senderId: "1", displayName: "Nastya ")
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: selfSender, messageId:  "1", sentDate: Date(), kind: .text("Привет! Прочитай Автоликбез, если хочешь хорошо разбираться в автомобилях!")))
        messages.append(Message(sender: selfSender, messageId:  "1", sentDate: Date(), kind: .text("Автоликбез можно найти во вкладке Чаты")))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.reloadData()
        print(messages)
    }
}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate{
    var currentSender: any MessageKit.SenderType {
        return selfSender
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }


}
