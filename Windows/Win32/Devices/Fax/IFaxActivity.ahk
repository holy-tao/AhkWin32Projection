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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_incomingmessages
     */
    get_IncomingMessages() {
        result := ComCall(7, this, "int*", &plIncomingMessages := 0, "HRESULT")
        return plIncomingMessages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_routingmessages
     */
    get_RoutingMessages() {
        result := ComCall(8, this, "int*", &plRoutingMessages := 0, "HRESULT")
        return plRoutingMessages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_outgoingmessages
     */
    get_OutgoingMessages() {
        result := ComCall(9, this, "int*", &plOutgoingMessages := 0, "HRESULT")
        return plOutgoingMessages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_queuedmessages
     */
    get_QueuedMessages() {
        result := ComCall(10, this, "int*", &plQueuedMessages := 0, "HRESULT")
        return plQueuedMessages
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-refresh
     */
    Refresh() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
