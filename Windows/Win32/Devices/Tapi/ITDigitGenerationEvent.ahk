#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitGenerationEvent interface contains methods that describe digit generation events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitgenerationevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitGenerationEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDigitGenerationEvent
     * @type {Guid}
     */
    static IID => Guid("{80d3bfad-57d9-11d2-a04a-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_GenerationTermination", "get_TickCount", "get_CallbackInstance"]

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_generationtermination
     */
    get_GenerationTermination() {
        result := ComCall(8, this, "int*", &plGenerationTermination := 0, "HRESULT")
        return plGenerationTermination
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitgenerationevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
