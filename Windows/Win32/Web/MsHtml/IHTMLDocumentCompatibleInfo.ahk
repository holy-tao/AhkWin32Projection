#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocumentCompatibleInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocumentCompatibleInfo
     * @type {Guid}
     */
    static IID => Guid("{3051041a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDocumentCompatibleInfo
     * @type {Guid}
     */
    static CLSID => Guid("{3051041b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_userAgent", "get_version"]

    /**
     * @type {BSTR} 
     */
    userAgent {
        get => this.get_userAgent()
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_userAgent() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
