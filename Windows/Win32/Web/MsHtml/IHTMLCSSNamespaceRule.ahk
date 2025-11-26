#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSNamespaceRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSNamespaceRule
     * @type {Guid}
     */
    static IID => Guid("{305106ee-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSNamespaceRule
     * @type {Guid}
     */
    static CLSID => Guid("{305106f2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_namespaceURI", "get_prefix"]

    /**
     * @type {BSTR} 
     */
    namespaceURI {
        get => this.get_namespaceURI()
    }

    /**
     * @type {BSTR} 
     */
    prefix {
        get => this.get_prefix()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_namespaceURI() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prefix() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
