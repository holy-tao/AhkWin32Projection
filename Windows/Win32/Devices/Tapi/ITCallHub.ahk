#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumCall.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallHub interface provides methods to retrieve information concerning a CallHub object. The IEnumCallHub::Next and ITTapi::get_CallHubs methods create the ITCallHub interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallhub
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallHub extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallHub
     * @type {Guid}
     */
    static IID => Guid("{a3c1544e-5b92-11d1-8f4e-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clear", "EnumerateCalls", "get_Calls", "get_NumCalls", "get_State"]

    /**
     * @type {VARIANT} 
     */
    Calls {
        get => this.get_Calls()
    }

    /**
     * @type {Integer} 
     */
    NumCalls {
        get => this.get_NumCalls()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * The Clear method attempts to remove all calls and participants from CallHub. The application may not have the privileges required to disconnect every call.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhub-clear
     */
    Clear() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The EnumerateCalls method enumerates calls currently associated with the call hub. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Calls method.
     * @returns {IEnumCall} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcall">IEnumCall</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhub-enumeratecalls
     */
    EnumerateCalls() {
        result := ComCall(8, this, "ptr*", &ppEnumCall := 0, "HRESULT")
        return IEnumCall(ppEnumCall)
    }

    /**
     * The get_Calls method creates a collection of calls associated with the current call hub. This method is provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateCalls method.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface pointers (call objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhub-get_calls
     */
    get_Calls() {
        pCalls := VARIANT()
        result := ComCall(9, this, "ptr", pCalls, "HRESULT")
        return pCalls
    }

    /**
     * The get_NumCalls method gets the number of calls currently in the CallHub.
     * @returns {Integer} Total number of calls in the CallHub.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhub-get_numcalls
     */
    get_NumCalls() {
        result := ComCall(10, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * The get_State method gets the current state of the CallHub.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callhub_state">CALLHUB_STATE</a> indicator of state.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallhub-get_state
     */
    get_State() {
        result := ComCall(11, this, "int*", &pState := 0, "HRESULT")
        return pState
    }
}
