#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument7 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument7
     * @type {Guid}
     */
    static IID => Guid("{305104b8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_defaultView", "createCDATASection", "getSelection", "getElementsByTagNameNS", "createElementNS", "createAttributeNS", "put_onmsthumbnailclick", "get_onmsthumbnailclick", "get_characterSet", "createElement", "createAttribute", "getElementsByClassName", "createProcessingInstruction", "adoptNode", "put_onmssitemodejumplistitemremoved", "get_onmssitemodejumplistitemremoved", "get_all", "get_inputEncoding", "get_xmlEncoding", "put_xmlStandalone", "get_xmlStandalone", "put_xmlVersion", "get_xmlVersion", "hasAttributes", "put_onabort", "get_onabort", "put_onblur", "get_onblur", "put_oncanplay", "get_oncanplay", "put_oncanplaythrough", "get_oncanplaythrough", "put_onchange", "get_onchange", "put_ondrag", "get_ondrag", "put_ondragend", "get_ondragend", "put_ondragenter", "get_ondragenter", "put_ondragleave", "get_ondragleave", "put_ondragover", "get_ondragover", "put_ondrop", "get_ondrop", "put_ondurationchange", "get_ondurationchange", "put_onemptied", "get_onemptied", "put_onended", "get_onended", "put_onerror", "get_onerror", "put_onfocus", "get_onfocus", "put_oninput", "get_oninput", "put_onload", "get_onload", "put_onloadeddata", "get_onloadeddata", "put_onloadedmetadata", "get_onloadedmetadata", "put_onloadstart", "get_onloadstart", "put_onpause", "get_onpause", "put_onplay", "get_onplay", "put_onplaying", "get_onplaying", "put_onprogress", "get_onprogress", "put_onratechange", "get_onratechange", "put_onreset", "get_onreset", "put_onscroll", "get_onscroll", "put_onseeked", "get_onseeked", "put_onseeking", "get_onseeking", "put_onselect", "get_onselect", "put_onstalled", "get_onstalled", "put_onsubmit", "get_onsubmit", "put_onsuspend", "get_onsuspend", "put_ontimeupdate", "get_ontimeupdate", "put_onvolumechange", "get_onvolumechange", "put_onwaiting", "get_onwaiting", "normalize", "importNode", "get_parentWindow", "putref_body", "get_body", "get_head"]

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} p 
     * @returns {HRESULT} 
     */
    get_defaultView(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {Pointer<IHTMLDOMNode>} newCDATASectionNode 
     * @returns {HRESULT} 
     */
    createCDATASection(text, newCDATASectionNode) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "ptr*", newCDATASectionNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLSelection>} ppIHTMLSelection 
     * @returns {HRESULT} 
     */
    getSelection(ppIHTMLSelection) {
        result := ComCall(9, this, "ptr*", ppIHTMLSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrLocalName 
     * @param {Pointer<IHTMLElementCollection>} pelColl 
     * @returns {HRESULT} 
     */
    getElementsByTagNameNS(pvarNS, bstrLocalName, pelColl) {
        bstrLocalName := bstrLocalName is String ? BSTR.Alloc(bstrLocalName).Value : bstrLocalName

        result := ComCall(10, this, "ptr", pvarNS, "ptr", bstrLocalName, "ptr*", pelColl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrTag 
     * @param {Pointer<IHTMLElement>} newElem 
     * @returns {HRESULT} 
     */
    createElementNS(pvarNS, bstrTag, newElem) {
        bstrTag := bstrTag is String ? BSTR.Alloc(bstrTag).Value : bstrTag

        result := ComCall(11, this, "ptr", pvarNS, "ptr", bstrTag, "ptr*", newElem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrAttrName 
     * @param {Pointer<IHTMLDOMAttribute>} ppAttribute 
     * @returns {HRESULT} 
     */
    createAttributeNS(pvarNS, bstrAttrName, ppAttribute) {
        bstrAttrName := bstrAttrName is String ? BSTR.Alloc(bstrAttrName).Value : bstrAttrName

        result := ComCall(12, this, "ptr", pvarNS, "ptr", bstrAttrName, "ptr*", ppAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsthumbnailclick(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmsthumbnailclick(p) {
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_characterSet(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTag 
     * @param {Pointer<IHTMLElement>} newElem 
     * @returns {HRESULT} 
     */
    createElement(bstrTag, newElem) {
        bstrTag := bstrTag is String ? BSTR.Alloc(bstrTag).Value : bstrTag

        result := ComCall(16, this, "ptr", bstrTag, "ptr*", newElem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttrName 
     * @param {Pointer<IHTMLDOMAttribute>} ppAttribute 
     * @returns {HRESULT} 
     */
    createAttribute(bstrAttrName, ppAttribute) {
        bstrAttrName := bstrAttrName is String ? BSTR.Alloc(bstrAttrName).Value : bstrAttrName

        result := ComCall(17, this, "ptr", bstrAttrName, "ptr*", ppAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @param {Pointer<IHTMLElementCollection>} pel 
     * @returns {HRESULT} 
     */
    getElementsByClassName(v, pel) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "ptr*", pel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTarget 
     * @param {BSTR} bstrData 
     * @param {Pointer<IDOMProcessingInstruction>} newProcessingInstruction 
     * @returns {HRESULT} 
     */
    createProcessingInstruction(bstrTarget, bstrData, newProcessingInstruction) {
        bstrTarget := bstrTarget is String ? BSTR.Alloc(bstrTarget).Value : bstrTarget
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(19, this, "ptr", bstrTarget, "ptr", bstrData, "ptr*", newProcessingInstruction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} pNodeSource 
     * @param {Pointer<IHTMLDOMNode3>} ppNodeDest 
     * @returns {HRESULT} 
     */
    adoptNode(pNodeSource, ppNodeDest) {
        result := ComCall(20, this, "ptr", pNodeSource, "ptr*", ppNodeDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmssitemodejumplistitemremoved(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmssitemodejumplistitemremoved(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_all(p) {
        result := ComCall(23, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_inputEncoding(p) {
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_xmlEncoding(p) {
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_xmlStandalone(v) {
        result := ComCall(26, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_xmlStandalone(p) {
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmlVersion(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_xmlVersion(p) {
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfHasAttributes 
     * @returns {HRESULT} 
     */
    hasAttributes(pfHasAttributes) {
        result := ComCall(30, this, "ptr", pfHasAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onabort(p) {
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onblur(p) {
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplay(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncanplay(p) {
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplaythrough(v) {
        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oncanplaythrough(p) {
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onchange(p) {
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrag(v) {
        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondrag(p) {
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragend(v) {
        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragend(p) {
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragenter(v) {
        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragenter(p) {
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragleave(v) {
        result := ComCall(47, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragleave(p) {
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragover(v) {
        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragover(p) {
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrop(v) {
        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondrop(p) {
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondurationchange(v) {
        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondurationchange(p) {
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onemptied(v) {
        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onemptied(p) {
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onended(v) {
        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onended(p) {
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onerror(p) {
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onfocus(p) {
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninput(v) {
        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_oninput(p) {
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onload(p) {
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadeddata(v) {
        result := ComCall(67, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onloadeddata(p) {
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadedmetadata(v) {
        result := ComCall(69, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onloadedmetadata(p) {
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadstart(v) {
        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onloadstart(p) {
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpause(v) {
        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onpause(p) {
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplay(v) {
        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onplay(p) {
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplaying(v) {
        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onplaying(p) {
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(79, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onprogress(p) {
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onratechange(v) {
        result := ComCall(81, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onratechange(p) {
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(83, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onreset(p) {
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(85, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onscroll(p) {
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeked(v) {
        result := ComCall(87, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onseeked(p) {
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeking(v) {
        result := ComCall(89, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onseeking(p) {
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(91, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onselect(p) {
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstalled(v) {
        result := ComCall(93, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onstalled(p) {
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(95, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onsubmit(p) {
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsuspend(v) {
        result := ComCall(97, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onsuspend(p) {
        result := ComCall(98, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeupdate(v) {
        result := ComCall(99, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ontimeupdate(p) {
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvolumechange(v) {
        result := ComCall(101, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onvolumechange(p) {
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onwaiting(v) {
        result := ComCall(103, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onwaiting(p) {
        result := ComCall(104, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    normalize() {
        result := ComCall(105, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMNode} pNodeSource 
     * @param {VARIANT_BOOL} fDeep 
     * @param {Pointer<IHTMLDOMNode3>} ppNodeDest 
     * @returns {HRESULT} 
     */
    importNode(pNodeSource, fDeep, ppNodeDest) {
        result := ComCall(106, this, "ptr", pNodeSource, "short", fDeep, "ptr*", ppNodeDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} p 
     * @returns {HRESULT} 
     */
    get_parentWindow(p) {
        result := ComCall(107, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} v 
     * @returns {HRESULT} 
     */
    putref_body(v) {
        result := ComCall(108, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_body(p) {
        result := ComCall(109, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_head(p) {
        result := ComCall(110, this, "ptr*", p, "HRESULT")
        return result
    }
}
