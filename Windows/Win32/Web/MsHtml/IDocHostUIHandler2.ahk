#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDocHostUIHandler.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocHostUIHandler2 extends IDocHostUIHandler{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOverrideKeyPath"]

    /**
     * 
     * @param {Integer} dw 
     * @returns {PWSTR} 
     */
    GetOverrideKeyPath(dw) {
        result := ComCall(18, this, "ptr*", &pchKey := 0, "uint", dw, "HRESULT")
        return pchKey
    }
}
