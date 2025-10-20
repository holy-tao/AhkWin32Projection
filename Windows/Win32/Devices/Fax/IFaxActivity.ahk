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
     * 
     * @param {Pointer<Int32>} plIncomingMessages 
     * @returns {HRESULT} 
     */
    get_IncomingMessages(plIncomingMessages) {
        result := ComCall(7, this, "int*", plIncomingMessages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRoutingMessages 
     * @returns {HRESULT} 
     */
    get_RoutingMessages(plRoutingMessages) {
        result := ComCall(8, this, "int*", plRoutingMessages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOutgoingMessages 
     * @returns {HRESULT} 
     */
    get_OutgoingMessages(plOutgoingMessages) {
        result := ComCall(9, this, "int*", plOutgoingMessages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plQueuedMessages 
     * @returns {HRESULT} 
     */
    get_QueuedMessages(plQueuedMessages) {
        result := ComCall(10, this, "int*", plQueuedMessages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
