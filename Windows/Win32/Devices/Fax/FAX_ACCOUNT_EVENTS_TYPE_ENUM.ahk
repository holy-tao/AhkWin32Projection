#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of event notifications, on a particular account, that the server sends to listening clients.
 * @remarks
 * The following table lists the <a href="https://docs.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-_ifaxaccountnotify">IFaxAccountNotify</a> methods called by each member of the enumeration:
  * 
  * 
  * <table class="clsStd">
  * <tr>
  * <th>Member</th>
  * <th>Methods Called</th>
  * </tr>
  * <tr>
  * <td>faetNONE</td>
  * <td>none</td>
  * </tr>
  * <tr>
  * <td>faetIN_QUEUE</td>
  * <td>OnIncomingJobAdded</p>OnIncomingJobRemoved</p>OnIncomingJobChanged</td>
  * </tr>
  * <tr>
  * <td>faetOUT_QUEUE</td>
  * <td>OnOutgoingJobAdded</p>OnOutgoingJobRemoved</p>OnOutgoingJobChanged</td>
  * </tr>
  * <tr>
  * <td>faetIN_ARCHIVE</td>
  * <td>OnIncomingMessageAdded</p>OnIncomingMessageRemoved</td>
  * </tr>
  * <tr>
  * <td>faetOUT_ARCHIVE</td>
  * <td>OnOutgoingMessageAdded</p>OnOutgoingMessageRemoved</td>
  * </tr>
  * <tr>
  * <td>faetFXSSVC_ENDED</td>
  * <td>OnServerShutDown</td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_account_events_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ACCOUNT_EVENTS_TYPE_ENUM{

    /**
     * No notifications are sent.
     * @type {Integer (Int32)}
     */
    static faetNONE => 0

    /**
     * Notifications of changes to the state of any fax in the incoming queue are sent.
     * @type {Integer (Int32)}
     */
    static faetIN_QUEUE => 1

    /**
     * Notifications of changes to the state of any fax in the outgoing queue are sent.
     * @type {Integer (Int32)}
     */
    static faetOUT_QUEUE => 2

    /**
     * A notification is sent whenever a message is removed from the incoming fax archive.
     * @type {Integer (Int32)}
     */
    static faetIN_ARCHIVE => 4

    /**
     * A notification is sent whenever a message is removed from the outgoing fax archive.
     * @type {Integer (Int32)}
     */
    static faetOUT_ARCHIVE => 8

    /**
     * A notification is sent whenever the fax service stops executing.
     * @type {Integer (Int32)}
     */
    static faetFXSSVC_ENDED => 16
}
