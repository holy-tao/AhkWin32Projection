#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmousewheel(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_doctype(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMImplementation>} p 
     * @returns {HRESULT} 
     */
    get_implementation(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrattrName 
     * @param {Pointer<IHTMLDOMAttribute>} ppattribute 
     * @returns {HRESULT} 
     */
    createAttribute(bstrattrName, ppattribute) {
        bstrattrName := bstrattrName is String ? BSTR.Alloc(bstrattrName).Value : bstrattrName

        result := ComCall(11, this, "ptr", bstrattrName, "ptr*", ppattribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrdata 
     * @param {Pointer<IHTMLDOMNode>} ppRetNode 
     * @returns {HRESULT} 
     */
    createComment(bstrdata, ppRetNode) {
        bstrdata := bstrdata is String ? BSTR.Alloc(bstrdata).Value : bstrdata

        result := ComCall(12, this, "ptr", bstrdata, "ptr*", ppRetNode, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onfocusin(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onfocusout(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onactivate(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondeactivate(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforeactivate(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforedeactivate(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_compatMode(p) {
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return result
    }
}
