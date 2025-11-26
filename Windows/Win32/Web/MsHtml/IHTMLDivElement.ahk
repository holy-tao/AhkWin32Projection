#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDivElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDivElement
     * @type {Guid}
     */
    static IID => Guid("{3050f200-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDivElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f27e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_align", "get_align", "put_noWrap", "get_noWrap"]

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    noWrap {
        get => this.get_noWrap()
        set => this.put_noWrap(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noWrap(v) {
        result := ComCall(9, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_noWrap() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }
}
