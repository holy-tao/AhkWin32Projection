#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLHeadElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLHeadElement
     * @type {Guid}
     */
    static IID => Guid("{3050f81d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLHeadElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f493-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_profile", "get_profile"]

    /**
     * @type {BSTR} 
     */
    profile {
        get => this.get_profile()
        set => this.put_profile(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_profile(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_profile() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }
}
