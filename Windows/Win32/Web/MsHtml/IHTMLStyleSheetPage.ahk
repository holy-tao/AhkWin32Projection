#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheetPage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheetPage
     * @type {Guid}
     */
    static IID => Guid("{3050f7ee-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheetPage
     * @type {Guid}
     */
    static CLSID => Guid("{3050f7ef-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_selector", "get_pseudoClass"]

    /**
     * @type {BSTR} 
     */
    selector {
        get => this.get_selector()
    }

    /**
     * @type {BSTR} 
     */
    pseudoClass {
        get => this.get_pseudoClass()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_selector() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pseudoClass() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
