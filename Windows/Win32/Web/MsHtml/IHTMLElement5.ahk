#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement5 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement5
     * @type {Guid}
     */
    static IID => Guid("{3051045d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getAttributeNode", "setAttributeNode", "removeAttributeNode", "hasAttribute", "put_role", "get_role", "put_ariaBusy", "get_ariaBusy", "put_ariaChecked", "get_ariaChecked", "put_ariaDisabled", "get_ariaDisabled", "put_ariaExpanded", "get_ariaExpanded", "put_ariaHaspopup", "get_ariaHaspopup", "put_ariaHidden", "get_ariaHidden", "put_ariaInvalid", "get_ariaInvalid", "put_ariaMultiselectable", "get_ariaMultiselectable", "put_ariaPressed", "get_ariaPressed", "put_ariaReadonly", "get_ariaReadonly", "put_ariaRequired", "get_ariaRequired", "put_ariaSecret", "get_ariaSecret", "put_ariaSelected", "get_ariaSelected", "getAttribute", "setAttribute", "removeAttribute", "get_attributes", "put_ariaValuenow", "get_ariaValuenow", "put_ariaPosinset", "get_ariaPosinset", "put_ariaSetsize", "get_ariaSetsize", "put_ariaLevel", "get_ariaLevel", "put_ariaValuemin", "get_ariaValuemin", "put_ariaValuemax", "get_ariaValuemax", "put_ariaControls", "get_ariaControls", "put_ariaDescribedby", "get_ariaDescribedby", "put_ariaFlowto", "get_ariaFlowto", "put_ariaLabelledby", "get_ariaLabelledby", "put_ariaActivedescendant", "get_ariaActivedescendant", "put_ariaOwns", "get_ariaOwns", "hasAttributes", "put_ariaLive", "get_ariaLive", "put_ariaRelevant", "get_ariaRelevant"]

    /**
     * 
     * @param {BSTR} bstrname 
     * @param {Pointer<IHTMLDOMAttribute2>} ppretAttribute 
     * @returns {HRESULT} 
     */
    getAttributeNode(bstrname, ppretAttribute) {
        bstrname := bstrname is String ? BSTR.Alloc(bstrname).Value : bstrname

        result := ComCall(7, this, "ptr", bstrname, "ptr*", ppretAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @param {Pointer<IHTMLDOMAttribute2>} ppretAttribute 
     * @returns {HRESULT} 
     */
    setAttributeNode(pattr, ppretAttribute) {
        result := ComCall(8, this, "ptr", pattr, "ptr*", ppretAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @param {Pointer<IHTMLDOMAttribute2>} ppretAttribute 
     * @returns {HRESULT} 
     */
    removeAttributeNode(pattr, ppretAttribute) {
        result := ComCall(9, this, "ptr", pattr, "ptr*", ppretAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT_BOOL>} pfHasAttribute 
     * @returns {HRESULT} 
     */
    hasAttribute(name, pfHasAttribute) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr", pfHasAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_role(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_role(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaBusy(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaBusy(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaChecked(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaChecked(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaDisabled(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaDisabled(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaExpanded(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaExpanded(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaHaspopup(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaHaspopup(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaHidden(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaHidden(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaInvalid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaInvalid(p) {
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaMultiselectable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaMultiselectable(p) {
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaPressed(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaPressed(p) {
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaReadonly(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaReadonly(p) {
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaRequired(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaRequired(p) {
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaSecret(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaSecret(p) {
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaSelected(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaSelected(p) {
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<VARIANT>} AttributeValue 
     * @returns {HRESULT} 
     */
    getAttribute(strAttributeName, AttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(39, this, "ptr", strAttributeName, "ptr", AttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {VARIANT} AttributeValue 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, AttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(40, this, "ptr", strAttributeName, "ptr", AttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<VARIANT_BOOL>} pfSuccess 
     * @returns {HRESULT} 
     */
    removeAttribute(strAttributeName, pfSuccess) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(41, this, "ptr", strAttributeName, "ptr", pfSuccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLAttributeCollection3>} p 
     * @returns {HRESULT} 
     */
    get_attributes(p) {
        result := ComCall(42, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuenow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaValuenow(p) {
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_ariaPosinset(v) {
        result := ComCall(45, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_ariaPosinset(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(46, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_ariaSetsize(v) {
        result := ComCall(47, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_ariaSetsize(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(48, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_ariaLevel(v) {
        result := ComCall(49, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_ariaLevel(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(50, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuemin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaValuemin(p) {
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuemax(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaValuemax(p) {
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaControls(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaControls(p) {
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaDescribedby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaDescribedby(p) {
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaFlowto(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaFlowto(p) {
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaLabelledby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaLabelledby(p) {
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaActivedescendant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaActivedescendant(p) {
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaOwns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaOwns(p) {
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfHasAttributes 
     * @returns {HRESULT} 
     */
    hasAttributes(pfHasAttributes) {
        result := ComCall(67, this, "ptr", pfHasAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaLive(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(68, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaLive(p) {
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaRelevant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(70, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_ariaRelevant(p) {
        result := ComCall(71, this, "ptr", p, "HRESULT")
        return result
    }
}
