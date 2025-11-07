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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-clear
     */
    Clear() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumCall} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-enumeratecalls
     */
    EnumerateCalls() {
        result := ComCall(8, this, "ptr*", &ppEnumCall := 0, "HRESULT")
        return IEnumCall(ppEnumCall)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-get_calls
     */
    get_Calls() {
        pCalls := VARIANT()
        result := ComCall(9, this, "ptr", pCalls, "HRESULT")
        return pCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-get_numcalls
     */
    get_NumCalls() {
        result := ComCall(10, this, "int*", &plCalls := 0, "HRESULT")
        return plCalls
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhub-get_state
     */
    get_State() {
        result := ComCall(11, this, "int*", &pState := 0, "HRESULT")
        return pState
    }
}
