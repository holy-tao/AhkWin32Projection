#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAreasCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAreasCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f383-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAreasCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4ca-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_length", "get_length", "get__newEnum", "item", "tags", "add", "remove"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     */
    item(name, index) {
        result := ComCall(10, this, "ptr", name, "ptr", index, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @returns {IDispatch} 
     */
    tags(tagName) {
        result := ComCall(11, this, "ptr", tagName, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    /**
     * 
     * @param {IHTMLElement} element 
     * @param {VARIANT} before 
     * @returns {HRESULT} 
     */
    add(element, before) {
        result := ComCall(12, this, "ptr", element, "ptr", before, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    remove(index) {
        result := ComCall(13, this, "int", index, "HRESULT")
        return result
    }
}
