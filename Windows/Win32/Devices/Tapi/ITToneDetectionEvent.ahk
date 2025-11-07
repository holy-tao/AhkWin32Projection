#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITToneDetectionEvent interface exposes methods that allow an application to retrieve information about a tone detection event.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittonedetectionevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITToneDetectionEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITToneDetectionEvent
     * @type {Guid}
     */
    static IID => Guid("{407e0faf-d047-4753-b0c6-8e060373fecd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_AppSpecific", "get_TickCount", "get_CallbackInstance"]

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_appspecific
     */
    get_AppSpecific() {
        result := ComCall(8, this, "int*", &plAppSpecific := 0, "HRESULT")
        return plAppSpecific
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
