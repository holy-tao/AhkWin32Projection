#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDocHostUIHandler.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocHostUIHandler2 extends IDocHostUIHandler{
    /**
     * The interface identifier for IDocHostUIHandler2
     * @type {Guid}
     */
    static IID => Guid("{3050f6d0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<PWSTR>} pchKey 
     * @param {Integer} dw 
     * @returns {HRESULT} 
     */
    GetOverrideKeyPath(pchKey, dw) {
        result := ComCall(18, this, "ptr", pchKey, "uint", dw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
