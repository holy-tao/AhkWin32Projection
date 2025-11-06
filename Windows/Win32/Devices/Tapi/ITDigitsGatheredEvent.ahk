#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitsGatheredEvent interface exposes methods that allow an application to retrieve data when the TAPI Server sends an event indicating that the Server has gathered digits required by the application.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitsgatheredevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitsGatheredEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDigitsGatheredEvent
     * @type {Guid}
     */
    static IID => Guid("{e52ec4c1-cba3-441a-9e6a-93cb909e9724}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Digits", "get_GatherTermination", "get_TickCount", "get_CallbackInstance"]

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_digits
     */
    get_Digits() {
        ppDigits := BSTR()
        result := ComCall(8, this, "ptr", ppDigits, "HRESULT")
        return ppDigits
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_gathertermination
     */
    get_GatherTermination() {
        result := ComCall(9, this, "int*", &pGatherTermination := 0, "HRESULT")
        return pGatherTermination
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(10, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(11, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
