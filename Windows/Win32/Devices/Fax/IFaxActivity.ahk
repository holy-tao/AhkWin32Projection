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
     * 
     * @param {Pointer<Integer>} plIncomingMessages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_incomingmessages
     */
    get_IncomingMessages(plIncomingMessages) {
        plIncomingMessagesMarshal := plIncomingMessages is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plIncomingMessagesMarshal, plIncomingMessages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRoutingMessages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_routingmessages
     */
    get_RoutingMessages(plRoutingMessages) {
        plRoutingMessagesMarshal := plRoutingMessages is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plRoutingMessagesMarshal, plRoutingMessages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOutgoingMessages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_outgoingmessages
     */
    get_OutgoingMessages(plOutgoingMessages) {
        plOutgoingMessagesMarshal := plOutgoingMessages is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plOutgoingMessagesMarshal, plOutgoingMessages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plQueuedMessages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_queuedmessages
     */
    get_QueuedMessages(plQueuedMessages) {
        plQueuedMessagesMarshal := plQueuedMessages is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plQueuedMessagesMarshal, plQueuedMessages, "HRESULT")
        return result
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
