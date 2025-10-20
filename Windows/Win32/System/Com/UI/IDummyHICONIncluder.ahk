#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.UI
 * @version v4.0.30319
 */
class IDummyHICONIncluder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDummyHICONIncluder
     * @type {Guid}
     */
    static IID => Guid("{947990de-cc28-11d2-a0f7-00805f858fb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Dummy"]

    /**
     * 
     * @param {HICON} h1 
     * @param {HDC} h2 
     * @returns {HRESULT} 
     */
    Dummy(h1, h2) {
        h1 := h1 is Win32Handle ? NumGet(h1, "ptr") : h1
        h2 := h2 is Win32Handle ? NumGet(h2, "ptr") : h2

        result := ComCall(3, this, "ptr", h1, "ptr", h2, "HRESULT")
        return result
    }
}
