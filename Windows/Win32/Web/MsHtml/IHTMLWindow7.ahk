#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLSelection.ahk
#Include .\IHTMLCSSStyleDeclaration.ahk
#Include .\IHTMLStyleMedia.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow7 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow7
     * @type {Guid}
     */
    static IID => Guid("{305104b7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getSelection", "getComputedStyle", "get_styleMedia", "put_performance", "get_performance", "get_innerWidth", "get_innerHeight", "get_pageXOffset", "get_pageYOffset", "get_screenX", "get_screenY", "get_outerWidth", "get_outerHeight", "put_onabort", "get_onabort", "put_oncanplay", "get_oncanplay", "put_oncanplaythrough", "get_oncanplaythrough", "put_onchange", "get_onchange", "put_onclick", "get_onclick", "put_oncontextmenu", "get_oncontextmenu", "put_ondblclick", "get_ondblclick", "put_ondrag", "get_ondrag", "put_ondragend", "get_ondragend", "put_ondragenter", "get_ondragenter", "put_ondragleave", "get_ondragleave", "put_ondragover", "get_ondragover", "put_ondragstart", "get_ondragstart", "put_ondrop", "get_ondrop", "put_ondurationchange", "get_ondurationchange", "put_onfocusin", "get_onfocusin", "put_onfocusout", "get_onfocusout", "put_oninput", "get_oninput", "put_onemptied", "get_onemptied", "put_onended", "get_onended", "put_onkeydown", "get_onkeydown", "put_onkeypress", "get_onkeypress", "put_onkeyup", "get_onkeyup", "put_onloadeddata", "get_onloadeddata", "put_onloadedmetadata", "get_onloadedmetadata", "put_onloadstart", "get_onloadstart", "put_onmousedown", "get_onmousedown", "put_onmouseenter", "get_onmouseenter", "put_onmouseleave", "get_onmouseleave", "put_onmousemove", "get_onmousemove", "put_onmouseout", "get_onmouseout", "put_onmouseover", "get_onmouseover", "put_onmouseup", "get_onmouseup", "put_onmousewheel", "get_onmousewheel", "put_onoffline", "get_onoffline", "put_ononline", "get_ononline", "put_onprogress", "get_onprogress", "put_onratechange", "get_onratechange", "put_onreadystatechange", "get_onreadystatechange", "put_onreset", "get_onreset", "put_onseeked", "get_onseeked", "put_onseeking", "get_onseeking", "put_onselect", "get_onselect", "put_onstalled", "get_onstalled", "put_onstorage", "get_onstorage", "put_onsubmit", "get_onsubmit", "put_onsuspend", "get_onsuspend", "put_ontimeupdate", "get_ontimeupdate", "put_onpause", "get_onpause", "put_onplay", "get_onplay", "put_onplaying", "get_onplaying", "put_onvolumechange", "get_onvolumechange", "put_onwaiting", "get_onwaiting"]

    /**
     * 
     * @returns {IHTMLSelection} 
     */
    getSelection() {
        result := ComCall(7, this, "ptr*", &ppIHTMLSelection := 0, "HRESULT")
        return IHTMLSelection(ppIHTMLSelection)
    }

    /**
     * 
     * @param {IHTMLDOMNode} varArgIn 
     * @param {BSTR} bstrPseudoElt 
     * @returns {IHTMLCSSStyleDeclaration} 
     */
    getComputedStyle(varArgIn, bstrPseudoElt) {
        bstrPseudoElt := bstrPseudoElt is String ? BSTR.Alloc(bstrPseudoElt).Value : bstrPseudoElt

        result := ComCall(8, this, "ptr", varArgIn, "ptr", bstrPseudoElt, "ptr*", &ppComputedStyle := 0, "HRESULT")
        return IHTMLCSSStyleDeclaration(ppComputedStyle)
    }

    /**
     * 
     * @returns {IHTMLStyleMedia} 
     */
    get_styleMedia() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleMedia(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_performance(v) {
        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_performance() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_innerWidth() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_innerHeight() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageXOffset() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageYOffset() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenX() {
        result := ComCall(16, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenY() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_outerWidth() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_outerHeight() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplay(v) {
        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplay() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplaythrough(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplaythrough() {
        p := VARIANT()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontextmenu(v) {
        result := ComCall(30, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncontextmenu() {
        p := VARIANT()
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrag(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrag() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragend(v) {
        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragend() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragenter(v) {
        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragenter() {
        p := VARIANT()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragleave(v) {
        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragleave() {
        p := VARIANT()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragover(v) {
        result := ComCall(42, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragover() {
        p := VARIANT()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragstart(v) {
        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrop(v) {
        result := ComCall(46, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrop() {
        p := VARIANT()
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondurationchange(v) {
        result := ComCall(48, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondurationchange() {
        p := VARIANT()
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusin(v) {
        result := ComCall(50, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusin() {
        p := VARIANT()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusout(v) {
        result := ComCall(52, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusout() {
        p := VARIANT()
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninput(v) {
        result := ComCall(54, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninput() {
        p := VARIANT()
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onemptied(v) {
        result := ComCall(56, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onemptied() {
        p := VARIANT()
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onended(v) {
        result := ComCall(58, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onended() {
        p := VARIANT()
        result := ComCall(59, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(60, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(61, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(62, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(64, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(65, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadeddata(v) {
        result := ComCall(66, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadeddata() {
        p := VARIANT()
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadedmetadata(v) {
        result := ComCall(68, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadedmetadata() {
        p := VARIANT()
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadstart(v) {
        result := ComCall(70, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadstart() {
        p := VARIANT()
        result := ComCall(71, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(72, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(73, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseenter(v) {
        result := ComCall(74, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseenter() {
        p := VARIANT()
        result := ComCall(75, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseleave(v) {
        result := ComCall(76, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseleave() {
        p := VARIANT()
        result := ComCall(77, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(78, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(79, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(80, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(81, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(82, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(83, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(84, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(85, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousewheel(v) {
        result := ComCall(86, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousewheel() {
        p := VARIANT()
        result := ComCall(87, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onoffline(v) {
        result := ComCall(88, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onoffline() {
        p := VARIANT()
        result := ComCall(89, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ononline(v) {
        result := ComCall(90, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ononline() {
        p := VARIANT()
        result := ComCall(91, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(92, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(93, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onratechange(v) {
        result := ComCall(94, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onratechange() {
        p := VARIANT()
        result := ComCall(95, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(96, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(97, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(98, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(99, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeked(v) {
        result := ComCall(100, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeked() {
        p := VARIANT()
        result := ComCall(101, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeking(v) {
        result := ComCall(102, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeking() {
        p := VARIANT()
        result := ComCall(103, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(104, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(105, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstalled(v) {
        result := ComCall(106, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstalled() {
        p := VARIANT()
        result := ComCall(107, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstorage(v) {
        result := ComCall(108, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstorage() {
        p := VARIANT()
        result := ComCall(109, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(110, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(111, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsuspend(v) {
        result := ComCall(112, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsuspend() {
        p := VARIANT()
        result := ComCall(113, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeupdate(v) {
        result := ComCall(114, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ontimeupdate() {
        p := VARIANT()
        result := ComCall(115, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpause(v) {
        result := ComCall(116, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpause() {
        p := VARIANT()
        result := ComCall(117, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplay(v) {
        result := ComCall(118, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplay() {
        p := VARIANT()
        result := ComCall(119, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplaying(v) {
        result := ComCall(120, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplaying() {
        p := VARIANT()
        result := ComCall(121, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvolumechange(v) {
        result := ComCall(122, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onvolumechange() {
        p := VARIANT()
        result := ComCall(123, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onwaiting(v) {
        result := ComCall(124, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onwaiting() {
        p := VARIANT()
        result := ComCall(125, this, "ptr", p, "HRESULT")
        return p
    }
}
