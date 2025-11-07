#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLStyleSheet.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleElement2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleElement2
     * @type {Guid}
     */
    static IID => Guid("{3051072a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_sheet"]

    /**
     * 
     * @returns {IHTMLStyleSheet} 
     */
    get_sheet() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheet(p)
    }
}
