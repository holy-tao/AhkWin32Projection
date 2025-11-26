#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTextContainer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTextContainer
     * @type {Guid}
     */
    static IID => Guid("{3050f230-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createControlRange", "get_scrollHeight", "get_scrollWidth", "put_scrollTop", "get_scrollTop", "put_scrollLeft", "get_scrollLeft", "put_onscroll", "get_onscroll"]

    /**
     * @type {Integer} 
     */
    scrollHeight {
        get => this.get_scrollHeight()
    }

    /**
     * @type {Integer} 
     */
    scrollWidth {
        get => this.get_scrollWidth()
    }

    /**
     * @type {Integer} 
     */
    scrollTop {
        get => this.get_scrollTop()
        set => this.put_scrollTop(value)
    }

    /**
     * @type {Integer} 
     */
    scrollLeft {
        get => this.get_scrollLeft()
        set => this.put_scrollLeft(value)
    }

    /**
     * @type {VARIANT} 
     */
    onscroll {
        get => this.get_onscroll()
        set => this.put_onscroll(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createControlRange() {
        result := ComCall(7, this, "ptr*", &range := 0, "HRESULT")
        return IDispatch(range)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollHeight() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollWidth() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollTop(v) {
        result := ComCall(10, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollTop() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollLeft(v) {
        result := ComCall(12, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollLeft() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(14, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }
}
