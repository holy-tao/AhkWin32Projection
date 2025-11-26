#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxActivity interface defines a read-only configuration object.
 * @remarks
 * 
 * A default implementation of <b>IFaxActivity</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivity">FaxActivity</a> object.
 * 
 * You can configure whether the fax service logs information about incoming and outgoing fax jobs in an activity log database. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivitylogging">FaxActivityLogging</a> configuration object permits configuration of the activity logging options that the fax service uses.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxactivity
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxActivity extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxActivity
     * @type {Guid}
     */
    static IID => Guid("{4b106f97-3df5-40f2-bc3c-44cb8115ebdf}")

    /**
     * The class identifier for FaxActivity
     * @type {Guid}
     */
    static CLSID => Guid("{cfef5d0e-e84d-462e-aabb-87d31eb04fef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncomingMessages", "get_RoutingMessages", "get_OutgoingMessages", "get_QueuedMessages", "Refresh"]

    /**
     * @type {Integer} 
     */
    IncomingMessages {
        get => this.get_IncomingMessages()
    }

    /**
     * @type {Integer} 
     */
    RoutingMessages {
        get => this.get_RoutingMessages()
    }

    /**
     * @type {Integer} 
     */
    OutgoingMessages {
        get => this.get_OutgoingMessages()
    }

    /**
     * @type {Integer} 
     */
    QueuedMessages {
        get => this.get_QueuedMessages()
    }

    /**
     * The IFaxActivity::get_IncomingMessages property is a number that represents the total number of incoming fax jobs that the fax service is currently in the process of receiving.
     * @remarks
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivity-get_incomingmessages
     */
    get_IncomingMessages() {
        result := ComCall(7, this, "int*", &plIncomingMessages := 0, "HRESULT")
        return plIncomingMessages
    }

    /**
     * The IFaxActivity::get_RoutingMessages property is a number that represents the total number of incoming fax jobs that the fax service is currently routing.
     * @remarks
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivity-get_routingmessages
     */
    get_RoutingMessages() {
        result := ComCall(8, this, "int*", &plRoutingMessages := 0, "HRESULT")
        return plRoutingMessages
    }

    /**
     * The IFaxActivity::get_OutgoingMessages property is a number that represents the total number of outgoing fax jobs that the fax service is in the process of sending.
     * @remarks
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivity-get_outgoingmessages
     */
    get_OutgoingMessages() {
        result := ComCall(9, this, "int*", &plOutgoingMessages := 0, "HRESULT")
        return plOutgoingMessages
    }

    /**
     * The IFaxActivity::get_QueuedMessages property is a number that represents the total number of fax jobs in the fax job queue that are pending processing. This does not include jobs for which the number of retries has been exceeded.
     * @remarks
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivity-get_queuedmessages
     */
    get_QueuedMessages() {
        result := ComCall(10, this, "int*", &plQueuedMessages := 0, "HRESULT")
        return plQueuedMessages
    }

    /**
     * The IFaxActivity::Refresh method refreshes FaxActivity information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxactivity-refresh
     */
    Refresh() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
