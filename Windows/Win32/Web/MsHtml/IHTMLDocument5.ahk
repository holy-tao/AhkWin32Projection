#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLDOMNode.ahk
#Include .\IHTMLDOMImplementation.ahk
#Include .\IHTMLDOMAttribute.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument5 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument5
     * @type {Guid}
     */
    static IID => Guid("{3050f80c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_onmousewheel", "get_onmousewheel", "get_doctype", "get_implementation", "createAttribute", "createComment", "put_onfocusin", "get_onfocusin", "put_onfocusout", "get_onfocusout", "put_onactivate", "get_onactivate", "put_ondeactivate", "get_ondeactivate", "put_onbeforeactivate", "get_onbeforeactivate", "put_onbeforedeactivate", "get_onbeforedeactivate", "get_compatMode"]

    /**
     * @type {VARIANT} 
     */
    onmousewheel {
        get => this.get_onmousewheel()
        set => this.put_onmousewheel(value)
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    doctype {
        get => this.get_doctype()
    }

    /**
     * @type {IHTMLDOMImplementation} 
     */
    implementation {
        get => this.get_implementation()
    }

    /**
     * @type {VARIANT} 
     */
    onfocusin {
        get => this.get_onfocusin()
        set => this.put_onfocusin(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfocusout {
        get => this.get_onfocusout()
        set => this.put_onfocusout(value)
    }

    /**
     * @type {VARIANT} 
     */
    onactivate {
        get => this.get_onactivate()
        set => this.put_onactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondeactivate {
        get => this.get_ondeactivate()
        set => this.put_ondeactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeactivate {
        get => this.get_onbeforeactivate()
        set => this.put_onbeforeactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforedeactivate {
        get => this.get_onbeforedeactivate()
        set => this.put_onbeforedeactivate(value)
    }

    /**
     * @type {BSTR} 
     */
    compatMode {
        get => this.get_compatMode()
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousewheel(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousewheel() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_doctype() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {IHTMLDOMImplementation} 
     */
    get_implementation() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMImplementation(p)
    }

    /**
     * 
     * @param {BSTR} bstrattrName 
     * @returns {IHTMLDOMAttribute} 
     */
    createAttribute(bstrattrName) {
        bstrattrName := bstrattrName is String ? BSTR.Alloc(bstrattrName).Value : bstrattrName

        result := ComCall(11, this, "ptr", bstrattrName, "ptr*", &ppattribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppattribute)
    }

    /**
     * 
     * @param {BSTR} bstrdata 
     * @returns {IHTMLDOMNode} 
     */
    createComment(bstrdata) {
        bstrdata := bstrdata is String ? BSTR.Alloc(bstrdata).Value : bstrdata

        result := ComCall(12, this, "ptr", bstrdata, "ptr*", &ppRetNode := 0, "HRESULT")
        return IHTMLDOMNode(ppRetNode)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusin(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusin() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusout(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusout() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onactivate(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onactivate() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondeactivate(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondeactivate() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeactivate(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeactivate() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforedeactivate(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforedeactivate() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_compatMode() {
        p := BSTR()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
    }
}
