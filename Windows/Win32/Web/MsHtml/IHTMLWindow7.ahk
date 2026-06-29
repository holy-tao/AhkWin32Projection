#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLSelection.ahk" { IHTMLSelection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyleMedia.ahk" { IHTMLStyleMedia }
#Import ".\IHTMLCSSStyleDeclaration.ahk" { IHTMLCSSStyleDeclaration }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLWindow7 extends IDispatch {
    /**
     * The interface identifier for IHTMLWindow7
     * @type {Guid}
     */
    static IID := Guid("{305104b7-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLWindow7 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getSelection           : IntPtr
        getComputedStyle       : IntPtr
        get_styleMedia         : IntPtr
        put_performance        : IntPtr
        get_performance        : IntPtr
        get_innerWidth         : IntPtr
        get_innerHeight        : IntPtr
        get_pageXOffset        : IntPtr
        get_pageYOffset        : IntPtr
        get_screenX            : IntPtr
        get_screenY            : IntPtr
        get_outerWidth         : IntPtr
        get_outerHeight        : IntPtr
        put_onabort            : IntPtr
        get_onabort            : IntPtr
        put_oncanplay          : IntPtr
        get_oncanplay          : IntPtr
        put_oncanplaythrough   : IntPtr
        get_oncanplaythrough   : IntPtr
        put_onchange           : IntPtr
        get_onchange           : IntPtr
        put_onclick            : IntPtr
        get_onclick            : IntPtr
        put_oncontextmenu      : IntPtr
        get_oncontextmenu      : IntPtr
        put_ondblclick         : IntPtr
        get_ondblclick         : IntPtr
        put_ondrag             : IntPtr
        get_ondrag             : IntPtr
        put_ondragend          : IntPtr
        get_ondragend          : IntPtr
        put_ondragenter        : IntPtr
        get_ondragenter        : IntPtr
        put_ondragleave        : IntPtr
        get_ondragleave        : IntPtr
        put_ondragover         : IntPtr
        get_ondragover         : IntPtr
        put_ondragstart        : IntPtr
        get_ondragstart        : IntPtr
        put_ondrop             : IntPtr
        get_ondrop             : IntPtr
        put_ondurationchange   : IntPtr
        get_ondurationchange   : IntPtr
        put_onfocusin          : IntPtr
        get_onfocusin          : IntPtr
        put_onfocusout         : IntPtr
        get_onfocusout         : IntPtr
        put_oninput            : IntPtr
        get_oninput            : IntPtr
        put_onemptied          : IntPtr
        get_onemptied          : IntPtr
        put_onended            : IntPtr
        get_onended            : IntPtr
        put_onkeydown          : IntPtr
        get_onkeydown          : IntPtr
        put_onkeypress         : IntPtr
        get_onkeypress         : IntPtr
        put_onkeyup            : IntPtr
        get_onkeyup            : IntPtr
        put_onloadeddata       : IntPtr
        get_onloadeddata       : IntPtr
        put_onloadedmetadata   : IntPtr
        get_onloadedmetadata   : IntPtr
        put_onloadstart        : IntPtr
        get_onloadstart        : IntPtr
        put_onmousedown        : IntPtr
        get_onmousedown        : IntPtr
        put_onmouseenter       : IntPtr
        get_onmouseenter       : IntPtr
        put_onmouseleave       : IntPtr
        get_onmouseleave       : IntPtr
        put_onmousemove        : IntPtr
        get_onmousemove        : IntPtr
        put_onmouseout         : IntPtr
        get_onmouseout         : IntPtr
        put_onmouseover        : IntPtr
        get_onmouseover        : IntPtr
        put_onmouseup          : IntPtr
        get_onmouseup          : IntPtr
        put_onmousewheel       : IntPtr
        get_onmousewheel       : IntPtr
        put_onoffline          : IntPtr
        get_onoffline          : IntPtr
        put_ononline           : IntPtr
        get_ononline           : IntPtr
        put_onprogress         : IntPtr
        get_onprogress         : IntPtr
        put_onratechange       : IntPtr
        get_onratechange       : IntPtr
        put_onreadystatechange : IntPtr
        get_onreadystatechange : IntPtr
        put_onreset            : IntPtr
        get_onreset            : IntPtr
        put_onseeked           : IntPtr
        get_onseeked           : IntPtr
        put_onseeking          : IntPtr
        get_onseeking          : IntPtr
        put_onselect           : IntPtr
        get_onselect           : IntPtr
        put_onstalled          : IntPtr
        get_onstalled          : IntPtr
        put_onstorage          : IntPtr
        get_onstorage          : IntPtr
        put_onsubmit           : IntPtr
        get_onsubmit           : IntPtr
        put_onsuspend          : IntPtr
        get_onsuspend          : IntPtr
        put_ontimeupdate       : IntPtr
        get_ontimeupdate       : IntPtr
        put_onpause            : IntPtr
        get_onpause            : IntPtr
        put_onplay             : IntPtr
        get_onplay             : IntPtr
        put_onplaying          : IntPtr
        get_onplaying          : IntPtr
        put_onvolumechange     : IntPtr
        get_onvolumechange     : IntPtr
        put_onwaiting          : IntPtr
        get_onwaiting          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLWindow7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLStyleMedia} 
     */
    styleMedia {
        get => this.get_styleMedia()
    }

    /**
     * @type {VARIANT} 
     */
    performance {
        get => this.get_performance()
        set => this.put_performance(value)
    }

    /**
     * @type {Integer} 
     */
    innerWidth {
        get => this.get_innerWidth()
    }

    /**
     * @type {Integer} 
     */
    innerHeight {
        get => this.get_innerHeight()
    }

    /**
     * @type {Integer} 
     */
    pageXOffset {
        get => this.get_pageXOffset()
    }

    /**
     * @type {Integer} 
     */
    pageYOffset {
        get => this.get_pageYOffset()
    }

    /**
     * @type {Integer} 
     */
    screenX {
        get => this.get_screenX()
    }

    /**
     * @type {Integer} 
     */
    screenY {
        get => this.get_screenY()
    }

    /**
     * @type {Integer} 
     */
    outerWidth {
        get => this.get_outerWidth()
    }

    /**
     * @type {Integer} 
     */
    outerHeight {
        get => this.get_outerHeight()
    }

    /**
     * @type {VARIANT} 
     */
    onabort {
        get => this.get_onabort()
        set => this.put_onabort(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncanplay {
        get => this.get_oncanplay()
        set => this.put_oncanplay(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncanplaythrough {
        get => this.get_oncanplaythrough()
        set => this.put_oncanplaythrough(value)
    }

    /**
     * @type {VARIANT} 
     */
    onchange {
        get => this.get_onchange()
        set => this.put_onchange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onclick {
        get => this.get_onclick()
        set => this.put_onclick(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncontextmenu {
        get => this.get_oncontextmenu()
        set => this.put_oncontextmenu(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondblclick {
        get => this.get_ondblclick()
        set => this.put_ondblclick(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondrag {
        get => this.get_ondrag()
        set => this.put_ondrag(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondragend {
        get => this.get_ondragend()
        set => this.put_ondragend(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondragenter {
        get => this.get_ondragenter()
        set => this.put_ondragenter(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondragleave {
        get => this.get_ondragleave()
        set => this.put_ondragleave(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondragover {
        get => this.get_ondragover()
        set => this.put_ondragover(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondragstart {
        get => this.get_ondragstart()
        set => this.put_ondragstart(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondrop {
        get => this.get_ondrop()
        set => this.put_ondrop(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondurationchange {
        get => this.get_ondurationchange()
        set => this.put_ondurationchange(value)
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
    oninput {
        get => this.get_oninput()
        set => this.put_oninput(value)
    }

    /**
     * @type {VARIANT} 
     */
    onemptied {
        get => this.get_onemptied()
        set => this.put_onemptied(value)
    }

    /**
     * @type {VARIANT} 
     */
    onended {
        get => this.get_onended()
        set => this.put_onended(value)
    }

    /**
     * @type {VARIANT} 
     */
    onkeydown {
        get => this.get_onkeydown()
        set => this.put_onkeydown(value)
    }

    /**
     * @type {VARIANT} 
     */
    onkeypress {
        get => this.get_onkeypress()
        set => this.put_onkeypress(value)
    }

    /**
     * @type {VARIANT} 
     */
    onkeyup {
        get => this.get_onkeyup()
        set => this.put_onkeyup(value)
    }

    /**
     * @type {VARIANT} 
     */
    onloadeddata {
        get => this.get_onloadeddata()
        set => this.put_onloadeddata(value)
    }

    /**
     * @type {VARIANT} 
     */
    onloadedmetadata {
        get => this.get_onloadedmetadata()
        set => this.put_onloadedmetadata(value)
    }

    /**
     * @type {VARIANT} 
     */
    onloadstart {
        get => this.get_onloadstart()
        set => this.put_onloadstart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmousedown {
        get => this.get_onmousedown()
        set => this.put_onmousedown(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseenter {
        get => this.get_onmouseenter()
        set => this.put_onmouseenter(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseleave {
        get => this.get_onmouseleave()
        set => this.put_onmouseleave(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmousemove {
        get => this.get_onmousemove()
        set => this.put_onmousemove(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseout {
        get => this.get_onmouseout()
        set => this.put_onmouseout(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseover {
        get => this.get_onmouseover()
        set => this.put_onmouseover(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseup {
        get => this.get_onmouseup()
        set => this.put_onmouseup(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmousewheel {
        get => this.get_onmousewheel()
        set => this.put_onmousewheel(value)
    }

    /**
     * @type {VARIANT} 
     */
    onoffline {
        get => this.get_onoffline()
        set => this.put_onoffline(value)
    }

    /**
     * @type {VARIANT} 
     */
    ononline {
        get => this.get_ononline()
        set => this.put_ononline(value)
    }

    /**
     * @type {VARIANT} 
     */
    onprogress {
        get => this.get_onprogress()
        set => this.put_onprogress(value)
    }

    /**
     * @type {VARIANT} 
     */
    onratechange {
        get => this.get_onratechange()
        set => this.put_onratechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onreset {
        get => this.get_onreset()
        set => this.put_onreset(value)
    }

    /**
     * @type {VARIANT} 
     */
    onseeked {
        get => this.get_onseeked()
        set => this.put_onseeked(value)
    }

    /**
     * @type {VARIANT} 
     */
    onseeking {
        get => this.get_onseeking()
        set => this.put_onseeking(value)
    }

    /**
     * @type {VARIANT} 
     */
    onselect {
        get => this.get_onselect()
        set => this.put_onselect(value)
    }

    /**
     * @type {VARIANT} 
     */
    onstalled {
        get => this.get_onstalled()
        set => this.put_onstalled(value)
    }

    /**
     * @type {VARIANT} 
     */
    onstorage {
        get => this.get_onstorage()
        set => this.put_onstorage(value)
    }

    /**
     * @type {VARIANT} 
     */
    onsubmit {
        get => this.get_onsubmit()
        set => this.put_onsubmit(value)
    }

    /**
     * @type {VARIANT} 
     */
    onsuspend {
        get => this.get_onsuspend()
        set => this.put_onsuspend(value)
    }

    /**
     * @type {VARIANT} 
     */
    ontimeupdate {
        get => this.get_ontimeupdate()
        set => this.put_ontimeupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onpause {
        get => this.get_onpause()
        set => this.put_onpause(value)
    }

    /**
     * @type {VARIANT} 
     */
    onplay {
        get => this.get_onplay()
        set => this.put_onplay(value)
    }

    /**
     * @type {VARIANT} 
     */
    onplaying {
        get => this.get_onplaying()
        set => this.put_onplaying(value)
    }

    /**
     * @type {VARIANT} 
     */
    onvolumechange {
        get => this.get_onvolumechange()
        set => this.put_onvolumechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onwaiting {
        get => this.get_onwaiting()
        set => this.put_onwaiting(value)
    }

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

        result := ComCall(8, this, "ptr", varArgIn, BSTR, bstrPseudoElt, "ptr*", &ppComputedStyle := 0, "HRESULT")
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
        result := ComCall(10, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_performance() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
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
        result := ComCall(20, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(21, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplay(v) {
        result := ComCall(22, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplay() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplaythrough(v) {
        result := ComCall(24, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplaythrough() {
        p := VARIANT()
        result := ComCall(25, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(26, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(28, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontextmenu(v) {
        result := ComCall(30, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncontextmenu() {
        p := VARIANT()
        result := ComCall(31, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(32, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrag(v) {
        result := ComCall(34, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrag() {
        p := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragend(v) {
        result := ComCall(36, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragend() {
        p := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragenter(v) {
        result := ComCall(38, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragenter() {
        p := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragleave(v) {
        result := ComCall(40, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragleave() {
        p := VARIANT()
        result := ComCall(41, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragover(v) {
        result := ComCall(42, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragover() {
        p := VARIANT()
        result := ComCall(43, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragstart(v) {
        result := ComCall(44, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(45, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrop(v) {
        result := ComCall(46, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrop() {
        p := VARIANT()
        result := ComCall(47, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondurationchange(v) {
        result := ComCall(48, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondurationchange() {
        p := VARIANT()
        result := ComCall(49, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusin(v) {
        result := ComCall(50, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusin() {
        p := VARIANT()
        result := ComCall(51, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusout(v) {
        result := ComCall(52, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusout() {
        p := VARIANT()
        result := ComCall(53, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninput(v) {
        result := ComCall(54, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninput() {
        p := VARIANT()
        result := ComCall(55, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onemptied(v) {
        result := ComCall(56, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onemptied() {
        p := VARIANT()
        result := ComCall(57, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onended(v) {
        result := ComCall(58, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onended() {
        p := VARIANT()
        result := ComCall(59, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(60, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(61, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(62, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(63, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(64, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(65, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadeddata(v) {
        result := ComCall(66, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadeddata() {
        p := VARIANT()
        result := ComCall(67, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadedmetadata(v) {
        result := ComCall(68, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadedmetadata() {
        p := VARIANT()
        result := ComCall(69, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadstart(v) {
        result := ComCall(70, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadstart() {
        p := VARIANT()
        result := ComCall(71, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(72, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(73, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseenter(v) {
        result := ComCall(74, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseenter() {
        p := VARIANT()
        result := ComCall(75, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseleave(v) {
        result := ComCall(76, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseleave() {
        p := VARIANT()
        result := ComCall(77, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(78, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(79, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(80, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(81, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(82, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(83, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(84, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(85, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousewheel(v) {
        result := ComCall(86, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousewheel() {
        p := VARIANT()
        result := ComCall(87, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onoffline(v) {
        result := ComCall(88, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onoffline() {
        p := VARIANT()
        result := ComCall(89, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ononline(v) {
        result := ComCall(90, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ononline() {
        p := VARIANT()
        result := ComCall(91, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(92, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(93, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onratechange(v) {
        result := ComCall(94, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onratechange() {
        p := VARIANT()
        result := ComCall(95, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(96, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(97, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(98, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(99, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeked(v) {
        result := ComCall(100, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeked() {
        p := VARIANT()
        result := ComCall(101, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeking(v) {
        result := ComCall(102, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeking() {
        p := VARIANT()
        result := ComCall(103, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(104, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(105, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstalled(v) {
        result := ComCall(106, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstalled() {
        p := VARIANT()
        result := ComCall(107, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstorage(v) {
        result := ComCall(108, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstorage() {
        p := VARIANT()
        result := ComCall(109, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(110, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(111, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsuspend(v) {
        result := ComCall(112, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsuspend() {
        p := VARIANT()
        result := ComCall(113, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeupdate(v) {
        result := ComCall(114, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ontimeupdate() {
        p := VARIANT()
        result := ComCall(115, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpause(v) {
        result := ComCall(116, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpause() {
        p := VARIANT()
        result := ComCall(117, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplay(v) {
        result := ComCall(118, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplay() {
        p := VARIANT()
        result := ComCall(119, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplaying(v) {
        result := ComCall(120, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplaying() {
        p := VARIANT()
        result := ComCall(121, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvolumechange(v) {
        result := ComCall(122, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onvolumechange() {
        p := VARIANT()
        result := ComCall(123, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onwaiting(v) {
        result := ComCall(124, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onwaiting() {
        p := VARIANT()
        result := ComCall(125, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLWindow7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getSelection := CallbackCreate(GetMethod(implObj, "getSelection"), flags, 2)
        this.vtbl.getComputedStyle := CallbackCreate(GetMethod(implObj, "getComputedStyle"), flags, 4)
        this.vtbl.get_styleMedia := CallbackCreate(GetMethod(implObj, "get_styleMedia"), flags, 2)
        this.vtbl.put_performance := CallbackCreate(GetMethod(implObj, "put_performance"), flags, 2)
        this.vtbl.get_performance := CallbackCreate(GetMethod(implObj, "get_performance"), flags, 2)
        this.vtbl.get_innerWidth := CallbackCreate(GetMethod(implObj, "get_innerWidth"), flags, 2)
        this.vtbl.get_innerHeight := CallbackCreate(GetMethod(implObj, "get_innerHeight"), flags, 2)
        this.vtbl.get_pageXOffset := CallbackCreate(GetMethod(implObj, "get_pageXOffset"), flags, 2)
        this.vtbl.get_pageYOffset := CallbackCreate(GetMethod(implObj, "get_pageYOffset"), flags, 2)
        this.vtbl.get_screenX := CallbackCreate(GetMethod(implObj, "get_screenX"), flags, 2)
        this.vtbl.get_screenY := CallbackCreate(GetMethod(implObj, "get_screenY"), flags, 2)
        this.vtbl.get_outerWidth := CallbackCreate(GetMethod(implObj, "get_outerWidth"), flags, 2)
        this.vtbl.get_outerHeight := CallbackCreate(GetMethod(implObj, "get_outerHeight"), flags, 2)
        this.vtbl.put_onabort := CallbackCreate(GetMethod(implObj, "put_onabort"), flags, 2)
        this.vtbl.get_onabort := CallbackCreate(GetMethod(implObj, "get_onabort"), flags, 2)
        this.vtbl.put_oncanplay := CallbackCreate(GetMethod(implObj, "put_oncanplay"), flags, 2)
        this.vtbl.get_oncanplay := CallbackCreate(GetMethod(implObj, "get_oncanplay"), flags, 2)
        this.vtbl.put_oncanplaythrough := CallbackCreate(GetMethod(implObj, "put_oncanplaythrough"), flags, 2)
        this.vtbl.get_oncanplaythrough := CallbackCreate(GetMethod(implObj, "get_oncanplaythrough"), flags, 2)
        this.vtbl.put_onchange := CallbackCreate(GetMethod(implObj, "put_onchange"), flags, 2)
        this.vtbl.get_onchange := CallbackCreate(GetMethod(implObj, "get_onchange"), flags, 2)
        this.vtbl.put_onclick := CallbackCreate(GetMethod(implObj, "put_onclick"), flags, 2)
        this.vtbl.get_onclick := CallbackCreate(GetMethod(implObj, "get_onclick"), flags, 2)
        this.vtbl.put_oncontextmenu := CallbackCreate(GetMethod(implObj, "put_oncontextmenu"), flags, 2)
        this.vtbl.get_oncontextmenu := CallbackCreate(GetMethod(implObj, "get_oncontextmenu"), flags, 2)
        this.vtbl.put_ondblclick := CallbackCreate(GetMethod(implObj, "put_ondblclick"), flags, 2)
        this.vtbl.get_ondblclick := CallbackCreate(GetMethod(implObj, "get_ondblclick"), flags, 2)
        this.vtbl.put_ondrag := CallbackCreate(GetMethod(implObj, "put_ondrag"), flags, 2)
        this.vtbl.get_ondrag := CallbackCreate(GetMethod(implObj, "get_ondrag"), flags, 2)
        this.vtbl.put_ondragend := CallbackCreate(GetMethod(implObj, "put_ondragend"), flags, 2)
        this.vtbl.get_ondragend := CallbackCreate(GetMethod(implObj, "get_ondragend"), flags, 2)
        this.vtbl.put_ondragenter := CallbackCreate(GetMethod(implObj, "put_ondragenter"), flags, 2)
        this.vtbl.get_ondragenter := CallbackCreate(GetMethod(implObj, "get_ondragenter"), flags, 2)
        this.vtbl.put_ondragleave := CallbackCreate(GetMethod(implObj, "put_ondragleave"), flags, 2)
        this.vtbl.get_ondragleave := CallbackCreate(GetMethod(implObj, "get_ondragleave"), flags, 2)
        this.vtbl.put_ondragover := CallbackCreate(GetMethod(implObj, "put_ondragover"), flags, 2)
        this.vtbl.get_ondragover := CallbackCreate(GetMethod(implObj, "get_ondragover"), flags, 2)
        this.vtbl.put_ondragstart := CallbackCreate(GetMethod(implObj, "put_ondragstart"), flags, 2)
        this.vtbl.get_ondragstart := CallbackCreate(GetMethod(implObj, "get_ondragstart"), flags, 2)
        this.vtbl.put_ondrop := CallbackCreate(GetMethod(implObj, "put_ondrop"), flags, 2)
        this.vtbl.get_ondrop := CallbackCreate(GetMethod(implObj, "get_ondrop"), flags, 2)
        this.vtbl.put_ondurationchange := CallbackCreate(GetMethod(implObj, "put_ondurationchange"), flags, 2)
        this.vtbl.get_ondurationchange := CallbackCreate(GetMethod(implObj, "get_ondurationchange"), flags, 2)
        this.vtbl.put_onfocusin := CallbackCreate(GetMethod(implObj, "put_onfocusin"), flags, 2)
        this.vtbl.get_onfocusin := CallbackCreate(GetMethod(implObj, "get_onfocusin"), flags, 2)
        this.vtbl.put_onfocusout := CallbackCreate(GetMethod(implObj, "put_onfocusout"), flags, 2)
        this.vtbl.get_onfocusout := CallbackCreate(GetMethod(implObj, "get_onfocusout"), flags, 2)
        this.vtbl.put_oninput := CallbackCreate(GetMethod(implObj, "put_oninput"), flags, 2)
        this.vtbl.get_oninput := CallbackCreate(GetMethod(implObj, "get_oninput"), flags, 2)
        this.vtbl.put_onemptied := CallbackCreate(GetMethod(implObj, "put_onemptied"), flags, 2)
        this.vtbl.get_onemptied := CallbackCreate(GetMethod(implObj, "get_onemptied"), flags, 2)
        this.vtbl.put_onended := CallbackCreate(GetMethod(implObj, "put_onended"), flags, 2)
        this.vtbl.get_onended := CallbackCreate(GetMethod(implObj, "get_onended"), flags, 2)
        this.vtbl.put_onkeydown := CallbackCreate(GetMethod(implObj, "put_onkeydown"), flags, 2)
        this.vtbl.get_onkeydown := CallbackCreate(GetMethod(implObj, "get_onkeydown"), flags, 2)
        this.vtbl.put_onkeypress := CallbackCreate(GetMethod(implObj, "put_onkeypress"), flags, 2)
        this.vtbl.get_onkeypress := CallbackCreate(GetMethod(implObj, "get_onkeypress"), flags, 2)
        this.vtbl.put_onkeyup := CallbackCreate(GetMethod(implObj, "put_onkeyup"), flags, 2)
        this.vtbl.get_onkeyup := CallbackCreate(GetMethod(implObj, "get_onkeyup"), flags, 2)
        this.vtbl.put_onloadeddata := CallbackCreate(GetMethod(implObj, "put_onloadeddata"), flags, 2)
        this.vtbl.get_onloadeddata := CallbackCreate(GetMethod(implObj, "get_onloadeddata"), flags, 2)
        this.vtbl.put_onloadedmetadata := CallbackCreate(GetMethod(implObj, "put_onloadedmetadata"), flags, 2)
        this.vtbl.get_onloadedmetadata := CallbackCreate(GetMethod(implObj, "get_onloadedmetadata"), flags, 2)
        this.vtbl.put_onloadstart := CallbackCreate(GetMethod(implObj, "put_onloadstart"), flags, 2)
        this.vtbl.get_onloadstart := CallbackCreate(GetMethod(implObj, "get_onloadstart"), flags, 2)
        this.vtbl.put_onmousedown := CallbackCreate(GetMethod(implObj, "put_onmousedown"), flags, 2)
        this.vtbl.get_onmousedown := CallbackCreate(GetMethod(implObj, "get_onmousedown"), flags, 2)
        this.vtbl.put_onmouseenter := CallbackCreate(GetMethod(implObj, "put_onmouseenter"), flags, 2)
        this.vtbl.get_onmouseenter := CallbackCreate(GetMethod(implObj, "get_onmouseenter"), flags, 2)
        this.vtbl.put_onmouseleave := CallbackCreate(GetMethod(implObj, "put_onmouseleave"), flags, 2)
        this.vtbl.get_onmouseleave := CallbackCreate(GetMethod(implObj, "get_onmouseleave"), flags, 2)
        this.vtbl.put_onmousemove := CallbackCreate(GetMethod(implObj, "put_onmousemove"), flags, 2)
        this.vtbl.get_onmousemove := CallbackCreate(GetMethod(implObj, "get_onmousemove"), flags, 2)
        this.vtbl.put_onmouseout := CallbackCreate(GetMethod(implObj, "put_onmouseout"), flags, 2)
        this.vtbl.get_onmouseout := CallbackCreate(GetMethod(implObj, "get_onmouseout"), flags, 2)
        this.vtbl.put_onmouseover := CallbackCreate(GetMethod(implObj, "put_onmouseover"), flags, 2)
        this.vtbl.get_onmouseover := CallbackCreate(GetMethod(implObj, "get_onmouseover"), flags, 2)
        this.vtbl.put_onmouseup := CallbackCreate(GetMethod(implObj, "put_onmouseup"), flags, 2)
        this.vtbl.get_onmouseup := CallbackCreate(GetMethod(implObj, "get_onmouseup"), flags, 2)
        this.vtbl.put_onmousewheel := CallbackCreate(GetMethod(implObj, "put_onmousewheel"), flags, 2)
        this.vtbl.get_onmousewheel := CallbackCreate(GetMethod(implObj, "get_onmousewheel"), flags, 2)
        this.vtbl.put_onoffline := CallbackCreate(GetMethod(implObj, "put_onoffline"), flags, 2)
        this.vtbl.get_onoffline := CallbackCreate(GetMethod(implObj, "get_onoffline"), flags, 2)
        this.vtbl.put_ononline := CallbackCreate(GetMethod(implObj, "put_ononline"), flags, 2)
        this.vtbl.get_ononline := CallbackCreate(GetMethod(implObj, "get_ononline"), flags, 2)
        this.vtbl.put_onprogress := CallbackCreate(GetMethod(implObj, "put_onprogress"), flags, 2)
        this.vtbl.get_onprogress := CallbackCreate(GetMethod(implObj, "get_onprogress"), flags, 2)
        this.vtbl.put_onratechange := CallbackCreate(GetMethod(implObj, "put_onratechange"), flags, 2)
        this.vtbl.get_onratechange := CallbackCreate(GetMethod(implObj, "get_onratechange"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.get_onreadystatechange := CallbackCreate(GetMethod(implObj, "get_onreadystatechange"), flags, 2)
        this.vtbl.put_onreset := CallbackCreate(GetMethod(implObj, "put_onreset"), flags, 2)
        this.vtbl.get_onreset := CallbackCreate(GetMethod(implObj, "get_onreset"), flags, 2)
        this.vtbl.put_onseeked := CallbackCreate(GetMethod(implObj, "put_onseeked"), flags, 2)
        this.vtbl.get_onseeked := CallbackCreate(GetMethod(implObj, "get_onseeked"), flags, 2)
        this.vtbl.put_onseeking := CallbackCreate(GetMethod(implObj, "put_onseeking"), flags, 2)
        this.vtbl.get_onseeking := CallbackCreate(GetMethod(implObj, "get_onseeking"), flags, 2)
        this.vtbl.put_onselect := CallbackCreate(GetMethod(implObj, "put_onselect"), flags, 2)
        this.vtbl.get_onselect := CallbackCreate(GetMethod(implObj, "get_onselect"), flags, 2)
        this.vtbl.put_onstalled := CallbackCreate(GetMethod(implObj, "put_onstalled"), flags, 2)
        this.vtbl.get_onstalled := CallbackCreate(GetMethod(implObj, "get_onstalled"), flags, 2)
        this.vtbl.put_onstorage := CallbackCreate(GetMethod(implObj, "put_onstorage"), flags, 2)
        this.vtbl.get_onstorage := CallbackCreate(GetMethod(implObj, "get_onstorage"), flags, 2)
        this.vtbl.put_onsubmit := CallbackCreate(GetMethod(implObj, "put_onsubmit"), flags, 2)
        this.vtbl.get_onsubmit := CallbackCreate(GetMethod(implObj, "get_onsubmit"), flags, 2)
        this.vtbl.put_onsuspend := CallbackCreate(GetMethod(implObj, "put_onsuspend"), flags, 2)
        this.vtbl.get_onsuspend := CallbackCreate(GetMethod(implObj, "get_onsuspend"), flags, 2)
        this.vtbl.put_ontimeupdate := CallbackCreate(GetMethod(implObj, "put_ontimeupdate"), flags, 2)
        this.vtbl.get_ontimeupdate := CallbackCreate(GetMethod(implObj, "get_ontimeupdate"), flags, 2)
        this.vtbl.put_onpause := CallbackCreate(GetMethod(implObj, "put_onpause"), flags, 2)
        this.vtbl.get_onpause := CallbackCreate(GetMethod(implObj, "get_onpause"), flags, 2)
        this.vtbl.put_onplay := CallbackCreate(GetMethod(implObj, "put_onplay"), flags, 2)
        this.vtbl.get_onplay := CallbackCreate(GetMethod(implObj, "get_onplay"), flags, 2)
        this.vtbl.put_onplaying := CallbackCreate(GetMethod(implObj, "put_onplaying"), flags, 2)
        this.vtbl.get_onplaying := CallbackCreate(GetMethod(implObj, "get_onplaying"), flags, 2)
        this.vtbl.put_onvolumechange := CallbackCreate(GetMethod(implObj, "put_onvolumechange"), flags, 2)
        this.vtbl.get_onvolumechange := CallbackCreate(GetMethod(implObj, "get_onvolumechange"), flags, 2)
        this.vtbl.put_onwaiting := CallbackCreate(GetMethod(implObj, "put_onwaiting"), flags, 2)
        this.vtbl.get_onwaiting := CallbackCreate(GetMethod(implObj, "get_onwaiting"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getSelection)
        CallbackFree(this.vtbl.getComputedStyle)
        CallbackFree(this.vtbl.get_styleMedia)
        CallbackFree(this.vtbl.put_performance)
        CallbackFree(this.vtbl.get_performance)
        CallbackFree(this.vtbl.get_innerWidth)
        CallbackFree(this.vtbl.get_innerHeight)
        CallbackFree(this.vtbl.get_pageXOffset)
        CallbackFree(this.vtbl.get_pageYOffset)
        CallbackFree(this.vtbl.get_screenX)
        CallbackFree(this.vtbl.get_screenY)
        CallbackFree(this.vtbl.get_outerWidth)
        CallbackFree(this.vtbl.get_outerHeight)
        CallbackFree(this.vtbl.put_onabort)
        CallbackFree(this.vtbl.get_onabort)
        CallbackFree(this.vtbl.put_oncanplay)
        CallbackFree(this.vtbl.get_oncanplay)
        CallbackFree(this.vtbl.put_oncanplaythrough)
        CallbackFree(this.vtbl.get_oncanplaythrough)
        CallbackFree(this.vtbl.put_onchange)
        CallbackFree(this.vtbl.get_onchange)
        CallbackFree(this.vtbl.put_onclick)
        CallbackFree(this.vtbl.get_onclick)
        CallbackFree(this.vtbl.put_oncontextmenu)
        CallbackFree(this.vtbl.get_oncontextmenu)
        CallbackFree(this.vtbl.put_ondblclick)
        CallbackFree(this.vtbl.get_ondblclick)
        CallbackFree(this.vtbl.put_ondrag)
        CallbackFree(this.vtbl.get_ondrag)
        CallbackFree(this.vtbl.put_ondragend)
        CallbackFree(this.vtbl.get_ondragend)
        CallbackFree(this.vtbl.put_ondragenter)
        CallbackFree(this.vtbl.get_ondragenter)
        CallbackFree(this.vtbl.put_ondragleave)
        CallbackFree(this.vtbl.get_ondragleave)
        CallbackFree(this.vtbl.put_ondragover)
        CallbackFree(this.vtbl.get_ondragover)
        CallbackFree(this.vtbl.put_ondragstart)
        CallbackFree(this.vtbl.get_ondragstart)
        CallbackFree(this.vtbl.put_ondrop)
        CallbackFree(this.vtbl.get_ondrop)
        CallbackFree(this.vtbl.put_ondurationchange)
        CallbackFree(this.vtbl.get_ondurationchange)
        CallbackFree(this.vtbl.put_onfocusin)
        CallbackFree(this.vtbl.get_onfocusin)
        CallbackFree(this.vtbl.put_onfocusout)
        CallbackFree(this.vtbl.get_onfocusout)
        CallbackFree(this.vtbl.put_oninput)
        CallbackFree(this.vtbl.get_oninput)
        CallbackFree(this.vtbl.put_onemptied)
        CallbackFree(this.vtbl.get_onemptied)
        CallbackFree(this.vtbl.put_onended)
        CallbackFree(this.vtbl.get_onended)
        CallbackFree(this.vtbl.put_onkeydown)
        CallbackFree(this.vtbl.get_onkeydown)
        CallbackFree(this.vtbl.put_onkeypress)
        CallbackFree(this.vtbl.get_onkeypress)
        CallbackFree(this.vtbl.put_onkeyup)
        CallbackFree(this.vtbl.get_onkeyup)
        CallbackFree(this.vtbl.put_onloadeddata)
        CallbackFree(this.vtbl.get_onloadeddata)
        CallbackFree(this.vtbl.put_onloadedmetadata)
        CallbackFree(this.vtbl.get_onloadedmetadata)
        CallbackFree(this.vtbl.put_onloadstart)
        CallbackFree(this.vtbl.get_onloadstart)
        CallbackFree(this.vtbl.put_onmousedown)
        CallbackFree(this.vtbl.get_onmousedown)
        CallbackFree(this.vtbl.put_onmouseenter)
        CallbackFree(this.vtbl.get_onmouseenter)
        CallbackFree(this.vtbl.put_onmouseleave)
        CallbackFree(this.vtbl.get_onmouseleave)
        CallbackFree(this.vtbl.put_onmousemove)
        CallbackFree(this.vtbl.get_onmousemove)
        CallbackFree(this.vtbl.put_onmouseout)
        CallbackFree(this.vtbl.get_onmouseout)
        CallbackFree(this.vtbl.put_onmouseover)
        CallbackFree(this.vtbl.get_onmouseover)
        CallbackFree(this.vtbl.put_onmouseup)
        CallbackFree(this.vtbl.get_onmouseup)
        CallbackFree(this.vtbl.put_onmousewheel)
        CallbackFree(this.vtbl.get_onmousewheel)
        CallbackFree(this.vtbl.put_onoffline)
        CallbackFree(this.vtbl.get_onoffline)
        CallbackFree(this.vtbl.put_ononline)
        CallbackFree(this.vtbl.get_ononline)
        CallbackFree(this.vtbl.put_onprogress)
        CallbackFree(this.vtbl.get_onprogress)
        CallbackFree(this.vtbl.put_onratechange)
        CallbackFree(this.vtbl.get_onratechange)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.get_onreadystatechange)
        CallbackFree(this.vtbl.put_onreset)
        CallbackFree(this.vtbl.get_onreset)
        CallbackFree(this.vtbl.put_onseeked)
        CallbackFree(this.vtbl.get_onseeked)
        CallbackFree(this.vtbl.put_onseeking)
        CallbackFree(this.vtbl.get_onseeking)
        CallbackFree(this.vtbl.put_onselect)
        CallbackFree(this.vtbl.get_onselect)
        CallbackFree(this.vtbl.put_onstalled)
        CallbackFree(this.vtbl.get_onstalled)
        CallbackFree(this.vtbl.put_onstorage)
        CallbackFree(this.vtbl.get_onstorage)
        CallbackFree(this.vtbl.put_onsubmit)
        CallbackFree(this.vtbl.get_onsubmit)
        CallbackFree(this.vtbl.put_onsuspend)
        CallbackFree(this.vtbl.get_onsuspend)
        CallbackFree(this.vtbl.put_ontimeupdate)
        CallbackFree(this.vtbl.get_ontimeupdate)
        CallbackFree(this.vtbl.put_onpause)
        CallbackFree(this.vtbl.get_onpause)
        CallbackFree(this.vtbl.put_onplay)
        CallbackFree(this.vtbl.get_onplay)
        CallbackFree(this.vtbl.put_onplaying)
        CallbackFree(this.vtbl.get_onplaying)
        CallbackFree(this.vtbl.put_onvolumechange)
        CallbackFree(this.vtbl.get_onvolumechange)
        CallbackFree(this.vtbl.put_onwaiting)
        CallbackFree(this.vtbl.get_onwaiting)
    }
}
