#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Phone_Event a callback function implemented by TAPI and supplied to the service provider as a parameter to TSPI_phoneOpen. The service provider calls this function to report events that occur on the phone.
 * @remarks
 * The call state when calling this function can be any state.
 * 
 * The service provider passes the 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/htapiphone">HTAPIPHONE</a> value supplied to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_phoneopen">TSPI_phoneOpen</a> as the <i>htPhone</i> parameter. It includes the message identifier and parameters specific to the event.
 * 
 * The sets of messages that can be passed to this procedure differ slightly from the messages to the corresponding callback at the TAPI level. In particular, completion of asynchronously executing requests is reported through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-async_completion">Completion_Proc</a> callback instead of this one.
 * @see https://learn.microsoft.com/windows/win32/api//content/tspi/nc-tspi-phoneevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONEEVENT extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HTAPIPHONE} htPhone 
     * @param {Integer} dwMsg 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(htPhone, dwMsg, dwParam1, dwParam2, dwParam3) {
        ComCall(3, this, "ptr", htPhone, "uint", dwMsg, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3)
    }
}
