#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLEditHost.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEditHost2 extends IHTMLEditHost{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEditHost2
     * @type {Guid}
     */
    static IID => Guid("{3050f848-98b5-11cf-bb82-00aa00bdce0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreDrag"]

    /**
     * 
     * @returns {HRESULT} 
     */
    PreDrag() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
