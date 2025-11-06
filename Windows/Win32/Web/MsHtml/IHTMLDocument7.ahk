#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLWindow2.ahk
#Include .\IHTMLDOMNode.ahk
#Include .\IHTMLSelection.ahk
#Include .\IHTMLElementCollection.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLDOMAttribute.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IDOMProcessingInstruction.ahk
#Include .\IHTMLDOMNode3.ahk
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
     * @returns {IHTMLWindow2} 
     */
    get_defaultView() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {IHTMLDOMNode} 
     */
    createCDATASection(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "ptr*", &newCDATASectionNode := 0, "HRESULT")
        return IHTMLDOMNode(newCDATASectionNode)
    }

    /**
     * 
     * @returns {IHTMLSelection} 
     */
    getSelection() {
        result := ComCall(9, this, "ptr*", &ppIHTMLSelection := 0, "HRESULT")
        return IHTMLSelection(ppIHTMLSelection)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrLocalName 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByTagNameNS(pvarNS, bstrLocalName) {
        bstrLocalName := bstrLocalName is String ? BSTR.Alloc(bstrLocalName).Value : bstrLocalName

        result := ComCall(10, this, "ptr", pvarNS, "ptr", bstrLocalName, "ptr*", &pelColl := 0, "HRESULT")
        return IHTMLElementCollection(pelColl)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrTag 
     * @returns {IHTMLElement} 
     */
    createElementNS(pvarNS, bstrTag) {
        bstrTag := bstrTag is String ? BSTR.Alloc(bstrTag).Value : bstrTag

        result := ComCall(11, this, "ptr", pvarNS, "ptr", bstrTag, "ptr*", &newElem := 0, "HRESULT")
        return IHTMLElement(newElem)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrAttrName 
     * @returns {IHTMLDOMAttribute} 
     */
    createAttributeNS(pvarNS, bstrAttrName) {
        bstrAttrName := bstrAttrName is String ? BSTR.Alloc(bstrAttrName).Value : bstrAttrName

        result := ComCall(12, this, "ptr", pvarNS, "ptr", bstrAttrName, "ptr*", &ppAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppAttribute)
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
     * @returns {VARIANT} 
     */
    get_onmsthumbnailclick() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_characterSet() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrTag 
     * @returns {IHTMLElement} 
     */
    createElement(bstrTag) {
        bstrTag := bstrTag is String ? BSTR.Alloc(bstrTag).Value : bstrTag

        result := ComCall(16, this, "ptr", bstrTag, "ptr*", &newElem := 0, "HRESULT")
        return IHTMLElement(newElem)
    }

    /**
     * 
     * @param {BSTR} bstrAttrName 
     * @returns {IHTMLDOMAttribute} 
     */
    createAttribute(bstrAttrName) {
        bstrAttrName := bstrAttrName is String ? BSTR.Alloc(bstrAttrName).Value : bstrAttrName

        result := ComCall(17, this, "ptr", bstrAttrName, "ptr*", &ppAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppAttribute)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByClassName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "ptr*", &pel := 0, "HRESULT")
        return IHTMLElementCollection(pel)
    }

    /**
     * 
     * @param {BSTR} bstrTarget 
     * @param {BSTR} bstrData 
     * @returns {IDOMProcessingInstruction} 
     */
    createProcessingInstruction(bstrTarget, bstrData) {
        bstrTarget := bstrTarget is String ? BSTR.Alloc(bstrTarget).Value : bstrTarget
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(19, this, "ptr", bstrTarget, "ptr", bstrData, "ptr*", &newProcessingInstruction := 0, "HRESULT")
        return IDOMProcessingInstruction(newProcessingInstruction)
    }

    /**
     * 
     * @param {IHTMLDOMNode} pNodeSource 
     * @returns {IHTMLDOMNode3} 
     */
    adoptNode(pNodeSource) {
        result := ComCall(20, this, "ptr", pNodeSource, "ptr*", &ppNodeDest := 0, "HRESULT")
        return IHTMLDOMNode3(ppNodeDest)
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
     * @returns {VARIANT} 
     */
    get_onmssitemodejumplistitemremoved() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_all() {
        result := ComCall(23, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_inputEncoding() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmlEncoding() {
        p := BSTR()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT_BOOL} 
     */
    get_xmlStandalone() {
        result := ComCall(27, this, "short*", &p := 0, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_xmlVersion() {
        p := BSTR()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(30, this, "short*", &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
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
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_oncanplay() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_oncanplaythrough() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondrag() {
        p := VARIANT()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondragend() {
        p := VARIANT()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondragenter() {
        p := VARIANT()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondragleave() {
        p := VARIANT()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondragover() {
        p := VARIANT()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondrop() {
        p := VARIANT()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ondurationchange() {
        p := VARIANT()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onemptied() {
        p := VARIANT()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onended() {
        p := VARIANT()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_oninput() {
        p := VARIANT()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onloadeddata() {
        p := VARIANT()
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onloadedmetadata() {
        p := VARIANT()
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onloadstart() {
        p := VARIANT()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onpause() {
        p := VARIANT()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onplay() {
        p := VARIANT()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onplaying() {
        p := VARIANT()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onratechange() {
        p := VARIANT()
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onseeked() {
        p := VARIANT()
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onseeking() {
        p := VARIANT()
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onstalled() {
        p := VARIANT()
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onsuspend() {
        p := VARIANT()
        result := ComCall(98, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_ontimeupdate() {
        p := VARIANT()
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onvolumechange() {
        p := VARIANT()
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_onwaiting() {
        p := VARIANT()
        result := ComCall(104, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {IHTMLDOMNode3} 
     */
    importNode(pNodeSource, fDeep) {
        result := ComCall(106, this, "ptr", pNodeSource, "short", fDeep, "ptr*", &ppNodeDest := 0, "HRESULT")
        return IHTMLDOMNode3(ppNodeDest)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_parentWindow() {
        result := ComCall(107, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
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
     * @returns {IHTMLElement} 
     */
    get_body() {
        result := ComCall(109, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_head() {
        result := ComCall(110, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }
}
