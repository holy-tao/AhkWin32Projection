#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_SERVER_EVENTS_TYPE_ENUM enumeration defines the types of events the fax service sends to client applications that are listening for events. The members of this enumeration are bit values and can be used in combination.
 * @remarks
 * 
 * The following table lists the <a href="https://docs.microsoft.com/windows/desktop/api/faxcomex/nn-faxcomex-ifaxservernotify2">IFaxServerNotify</a> methods called by each member.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Name</th>
 * <th>
 * <a href="https://docs.microsoft.com/windows/desktop/api/faxcomex/nn-faxcomex-ifaxservernotify2">IFaxServerNotify</a> method called</th>
 * </tr>
 * <tr>
 * <td>
 * fsetNONE
 * 
 * </td>
 * <td>
 * None
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetIN_QUEUE
 * 
 * </td>
 * <td>
 * <b>OnIncomingJobAdded</b>
 * 
 * <b>OnIncomingJobRemoved</b>
 * 
 * <b>OnIncomingJobChanged</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetOUT_QUEUE
 * 
 * </td>
 * <td>
 * <b>OnOutgoingJobAdded</b>
 * 
 * <b>OnOutgoingJobRemoved</b>
 * 
 * <b>OnOutgoingJobChanged</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetCONFIG
 * 
 * </td>
 * <td>
 * <b>OnReceiptOptionsChange</b>
 * 
 * <b>OnActivityLoggingConfigChange</b>
 * 
 * <b>OnSecurityConfigChange</b>
 * 
 * <b>OnEventLoggingConfigChange</b>
 * 
 * <b>OnOutgoingQueueConfigChange</b>
 * 
 * <b>OnOutgoingArchiveConfigChange</b>
 * 
 * <b>OnIncomingArchiveConfigChange</b>
 * 
 * <b>OnDevicesConfigChange</b>
 * 
 * <b>OnOutboundRoutingGroupsConfigChange</b>
 * 
 * <b>OnOutboundRoutingRulesConfigChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetACTIVITY
 * 
 * </td>
 * <td>
 * <b>OnServerActivityChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetQUEUE_STATE
 * 
 * </td>
 * <td>
 * <b>OnQueuesStatusChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetIN_ARCHIVE
 * 
 * </td>
 * <td>
 * <b>OnIncomingMessageAdded</b>
 * 
 * <b>OnIncomingMessageRemoved</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetOUT_ARCHIVE
 * 
 * </td>
 * <td>
 * <b>OnOutgoingMessageAdded</b>
 * 
 * <b>OnOutgoingMessageRemoved</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetFXSSVC_ENDED
 * 
 * </td>
 * <td>
 * <b>OnServerShutDown</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetDEVICE_STATUS
 * 
 * </td>
 * <td>
 * <b>OnDeviceStatusChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetINCOMING_CALL
 * 
 * </td>
 * <td>
 * <b>OnNewCall</b>
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following table lists the <a href="https://docs.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-_ifaxservernotify2">IFaxServerNotify2</a> methods called by each member.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Name</th>
 * <th>
 * <a href="https://docs.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-_ifaxservernotify2">IFaxServerNotify2</a> method called</th>
 * </tr>
 * <tr>
 * <td>
 * fsetNONE
 * 
 * </td>
 * <td>
 * None
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetIN_QUEUE
 * 
 * </td>
 * <td>
 * <b>OnIncomingJobAdded</b>
 * 
 * <b>OnIncomingJobRemoved</b>
 * 
 * <b>OnIncomingJobChanged</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetOUT_QUEUE
 * 
 * </td>
 * <td>
 * <b>OnOutgoingJobAdded</b>
 * 
 * <b>OnOutgoingJobRemoved</b>
 * 
 * <b>OnOutgoingJobChanged</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetCONFIG
 * 
 * </td>
 * <td>
 * <b>OnReceiptOptionsChange</b>
 * 
 * <b>OnActivityLoggingConfigChange</b>
 * 
 * <b>OnSecurityConfigChange</b>
 * 
 * <b>OnEventLoggingConfigChange</b>
 * 
 * <b>OnOutgoingQueueConfigChange</b>
 * 
 * <b>OnOutgoingArchiveConfigChange</b>
 * 
 * <b>OnIncomingArchiveConfigChange</b>
 * 
 * <b>OnDevicesConfigChange</b>
 * 
 * <b>OnOutboundRoutingGroupsConfigChange</b>
 * 
 * <b>OnOutboundRoutingRulesConfigChange</b>
 * 
 * <b>OnGeneralServerConfigChanged</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetACTIVITY
 * 
 * </td>
 * <td>
 * <b>OnServerActivityChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetQUEUE_STATE
 * 
 * </td>
 * <td>
 * <b>OnQueuesStatusChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetIN_ARCHIVE
 * 
 * </td>
 * <td>
 * <b>OnIncomingMessageAdded</b>
 * 
 * <b>OnIncomingMessageRemoved</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetOUT_ARCHIVE
 * 
 * </td>
 * <td>
 * <b>OnOutgoingMessageAdded</b>
 * 
 * <b>OnOutgoingMessageRemoved</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetFXSSVC_ENDED
 * 
 * </td>
 * <td>
 * <b>OnServerShutDown</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetDEVICE_STATUS
 * 
 * </td>
 * <td>
 * <b>OnDeviceStatusChange</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * fsetINCOMING_CALL
 * 
 * </td>
 * <td>
 * <b>OnNewCall</b>
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_server_events_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_SERVER_EVENTS_TYPE_ENUM{

    /**
     * No events are sent.
     * @type {Integer (Int32)}
     */
    static fsetNONE => 0

    /**
     * The client requests notifications about fax jobs in the incoming queue. When the status of an incoming fax job changes, the fax service issues a notification of this type.
     * @type {Integer (Int32)}
     */
    static fsetIN_QUEUE => 1

    /**
     * The client requests notification about fax jobs in the outgoing queue. When the status of an outgoing fax job changes, the fax service issues a notification of this type.
     * @type {Integer (Int32)}
     */
    static fsetOUT_QUEUE => 2

    /**
     * The client requests notifications about changes to the fax server configuration. When the configuration data changes, the fax service issues a notification of this type.
     * @type {Integer (Int32)}
     */
    static fsetCONFIG => 4

    /**
     * The client requests notifications about the fax server activity. When the activity status of the fax server changes, the fax service issues a notification of this type.
     * @type {Integer (Int32)}
     */
    static fsetACTIVITY => 8

    /**
     * The client requests notifications about changes in the status of the fax job queue. When the status of the queue changes, the fax service issues a notification.
     * @type {Integer (Int32)}
     */
    static fsetQUEUE_STATE => 16

    /**
     * The client requests notifications about the addition or removal of fax messages from the incoming archive. When a message is removed from the archive, the fax service issues a notification. The notification includes the archive type (inbound) and the unique ID of the fax message.
     * @type {Integer (Int32)}
     */
    static fsetIN_ARCHIVE => 32

    /**
     * The client requests notifications about the addition or removal of fax messages from the outgoing archive. When a message is removed from the archive, the fax service issues a notification. The notification includes the archive type (outbound) and the unique ID of the fax message.
     * @type {Integer (Int32)}
     */
    static fsetOUT_ARCHIVE => 64

    /**
     * The client requests notifications when the fax service stops executing.
     * @type {Integer (Int32)}
     */
    static fsetFXSSVC_ENDED => 128

    /**
     * The client requests notifications when a device status changes.
     * @type {Integer (Int32)}
     */
    static fsetDEVICE_STATUS => 256

    /**
     * The client requests notifications when there is an incoming call.
     * @type {Integer (Int32)}
     */
    static fsetINCOMING_CALL => 512
}
