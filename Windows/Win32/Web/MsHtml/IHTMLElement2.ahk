#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement2
     * @type {Guid}
     */
    static IID => Guid("{3050f434-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_scopeName", "setCapture", "releaseCapture", "put_onlosecapture", "get_onlosecapture", "componentFromPoint", "doScroll", "put_onscroll", "get_onscroll", "put_ondrag", "get_ondrag", "put_ondragend", "get_ondragend", "put_ondragenter", "get_ondragenter", "put_ondragover", "get_ondragover", "put_ondragleave", "get_ondragleave", "put_ondrop", "get_ondrop", "put_onbeforecut", "get_onbeforecut", "put_oncut", "get_oncut", "put_onbeforecopy", "get_onbeforecopy", "put_oncopy", "get_oncopy", "put_onbeforepaste", "get_onbeforepaste", "put_onpaste", "get_onpaste", "get_currentStyle", "put_onpropertychange", "get_onpropertychange", "getClientRects", "getBoundingClientRect", "setExpression", "getExpression", "removeExpression", "put_tabIndex", "get_tabIndex", "focus", "put_accessKey", "get_accessKey", "put_onblur", "get_onblur", "put_onfocus", "get_onfocus", "put_onresize", "get_onresize", "blur", "addFilter", "removeFilter", "get_clientHeight", "get_clientWidth", "get_clientTop", "get_clientLeft", "attachEvent", "detachEvent", "get_readyState", "put_onreadystatechange", "get_onreadystatechange", "put_onrowsdelete", "get_onrowsdelete", "put_onrowsinserted", "get_onrowsinserted", "put_oncellchange", "get_oncellchange", "put_dir", "get_dir", "createControlRange", "get_scrollHeight", "get_scrollWidth", "put_scrollTop", "get_scrollTop", "put_scrollLeft", "get_scrollLeft", "clearAttributes", "mergeAttributes", "put_oncontextmenu", "get_oncontextmenu", "insertAdjacentElement", "applyElement", "getAdjacentText", "replaceAdjacentText", "get_canHaveChildren", "addBehavior", "removeBehavior", "get_runtimeStyle", "get_behaviorUrns", "put_tagUrn", "get_tagUrn", "put_onbeforeeditfocus", "get_onbeforeeditfocus", "get_readyStateValue", "getElementsByTagName"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_scopeName(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} containerCapture 
     * @returns {HRESULT} 
     */
    setCapture(containerCapture) {
        result := ComCall(8, this, "short", containerCapture, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    releaseCapture() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onlosecapture(v) {
        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onlosecapture(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<BSTR>} component 
     * @returns {HRESULT} 
     */
    componentFromPoint(x, y, component) {
        result := ComCall(12, this, "int", x, "int", y, "ptr", component, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} component 
     * @returns {HRESULT} 
     */
    doScroll(component) {
        result := ComCall(13, this, "ptr", component, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onscroll(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrag(v) {
        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondrag(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragend(v) {
        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragend(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragenter(v) {
        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragenter(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragover(v) {
        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragover(p) {
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragleave(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragleave(p) {
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrop(v) {
        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondrop(p) {
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforecut(v) {
        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforecut(p) {
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncut(v) {
        result := ComCall(30, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncut(p) {
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforecopy(v) {
        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforecopy(p) {
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncopy(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncopy(p) {
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforepaste(v) {
        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforepaste(p) {
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpaste(v) {
        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onpaste(p) {
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLCurrentStyle>} p 
     * @returns {HRESULT} 
     */
    get_currentStyle(p) {
        result := ComCall(40, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpropertychange(v) {
        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onpropertychange(p) {
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRectCollection>} pRectCol 
     * @returns {HRESULT} 
     */
    getClientRects(pRectCol) {
        result := ComCall(43, this, "ptr*", pRectCol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRect>} pRect 
     * @returns {HRESULT} 
     */
    getBoundingClientRect(pRect) {
        result := ComCall(44, this, "ptr*", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {BSTR} expression 
     * @param {BSTR} language 
     * @returns {HRESULT} 
     */
    setExpression(propname, expression, language) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname
        expression := expression is String ? BSTR.Alloc(expression).Value : expression
        language := language is String ? BSTR.Alloc(language).Value : language

        result := ComCall(45, this, "ptr", propname, "ptr", expression, "ptr", language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} expression 
     * @returns {HRESULT} 
     */
    getExpression(propname, expression) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(46, this, "ptr", propname, "ptr", expression, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT_BOOL>} pfSuccess 
     * @returns {HRESULT} 
     */
    removeExpression(propname, pfSuccess) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(47, this, "ptr", propname, "ptr", pfSuccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_tabIndex(v) {
        result := ComCall(48, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_tabIndex(p) {
        result := ComCall(49, this, "short*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accessKey(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_accessKey(p) {
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onblur(p) {
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onfocus(p) {
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresize(v) {
        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onresize(p) {
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    addFilter(pUnk) {
        result := ComCall(60, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    removeFilter(pUnk) {
        result := ComCall(61, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientHeight(p) {
        result := ComCall(62, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientWidth(p) {
        result := ComCall(63, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientTop(p) {
        result := ComCall(64, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_clientLeft(p) {
        result := ComCall(65, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @param {Pointer<VARIANT_BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    attachEvent(event, pDisp, pfResult) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(66, this, "ptr", event, "ptr", pDisp, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {HRESULT} 
     */
    detachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(67, this, "ptr", event, "ptr", pDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_readyState(p) {
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(69, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onreadystatechange(p) {
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsdelete(v) {
        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onrowsdelete(p) {
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsinserted(v) {
        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onrowsinserted(p) {
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncellchange(v) {
        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncellchange(p) {
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dir(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dir(p) {
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} range 
     * @returns {HRESULT} 
     */
    createControlRange(range) {
        result := ComCall(79, this, "ptr*", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_scrollHeight(p) {
        result := ComCall(80, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_scrollWidth(p) {
        result := ComCall(81, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollTop(v) {
        result := ComCall(82, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_scrollTop(p) {
        result := ComCall(83, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollLeft(v) {
        result := ComCall(84, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_scrollLeft(p) {
        result := ComCall(85, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clearAttributes() {
        result := ComCall(86, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} mergeThis 
     * @returns {HRESULT} 
     */
    mergeAttributes(mergeThis) {
        result := ComCall(87, this, "ptr", mergeThis, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontextmenu(v) {
        result := ComCall(88, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncontextmenu(p) {
        result := ComCall(89, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {IHTMLElement} insertedElement 
     * @param {Pointer<IHTMLElement>} inserted 
     * @returns {HRESULT} 
     */
    insertAdjacentElement(where, insertedElement, inserted) {
        where := where is String ? BSTR.Alloc(where).Value : where

        result := ComCall(90, this, "ptr", where, "ptr", insertedElement, "ptr*", inserted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} apply 
     * @param {BSTR} where 
     * @param {Pointer<IHTMLElement>} applied 
     * @returns {HRESULT} 
     */
    applyElement(apply, where, applied) {
        where := where is String ? BSTR.Alloc(where).Value : where

        result := ComCall(91, this, "ptr", apply, "ptr", where, "ptr*", applied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {Pointer<BSTR>} text 
     * @returns {HRESULT} 
     */
    getAdjacentText(where, text) {
        where := where is String ? BSTR.Alloc(where).Value : where

        result := ComCall(92, this, "ptr", where, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {BSTR} newText 
     * @param {Pointer<BSTR>} oldText 
     * @returns {HRESULT} 
     */
    replaceAdjacentText(where, newText, oldText) {
        where := where is String ? BSTR.Alloc(where).Value : where
        newText := newText is String ? BSTR.Alloc(newText).Value : newText

        result := ComCall(93, this, "ptr", where, "ptr", newText, "ptr", oldText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_canHaveChildren(p) {
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<VARIANT>} pvarFactory 
     * @param {Pointer<Integer>} pCookie 
     * @returns {HRESULT} 
     */
    addBehavior(bstrUrl, pvarFactory, pCookie) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(95, this, "ptr", bstrUrl, "ptr", pvarFactory, "int*", pCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @param {Pointer<VARIANT_BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    removeBehavior(cookie, pfResult) {
        result := ComCall(96, this, "int", cookie, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyle>} p 
     * @returns {HRESULT} 
     */
    get_runtimeStyle(p) {
        result := ComCall(97, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_behaviorUrns(p) {
        result := ComCall(98, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_tagUrn(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(99, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_tagUrn(p) {
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeeditfocus(v) {
        result := ComCall(101, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforeeditfocus(p) {
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_readyStateValue(p) {
        result := ComCall(103, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @param {Pointer<IHTMLElementCollection>} pelColl 
     * @returns {HRESULT} 
     */
    getElementsByTagName(v, pelColl) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(104, this, "ptr", v, "ptr*", pelColl, "HRESULT")
        return result
    }
}
