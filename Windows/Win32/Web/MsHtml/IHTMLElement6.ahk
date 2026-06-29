#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMAttribute2.ahk" { IHTMLDOMAttribute2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement6 extends IDispatch {
    /**
     * The interface identifier for IHTMLElement6
     * @type {Guid}
     */
    static IID := Guid("{305106f8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement6 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getAttributeNS         : IntPtr
        setAttributeNS         : IntPtr
        removeAttributeNS      : IntPtr
        getAttributeNodeNS     : IntPtr
        setAttributeNodeNS     : IntPtr
        hasAttributeNS         : IntPtr
        getAttribute           : IntPtr
        setAttribute           : IntPtr
        removeAttribute        : IntPtr
        getAttributeNode       : IntPtr
        setAttributeNode       : IntPtr
        removeAttributeNode    : IntPtr
        hasAttribute           : IntPtr
        getElementsByTagNameNS : IntPtr
        get_tagName            : IntPtr
        get_nodeName           : IntPtr
        getElementsByClassName : IntPtr
        msMatchesSelector      : IntPtr
        put_onabort            : IntPtr
        get_onabort            : IntPtr
        put_oncanplay          : IntPtr
        get_oncanplay          : IntPtr
        put_oncanplaythrough   : IntPtr
        get_oncanplaythrough   : IntPtr
        put_onchange           : IntPtr
        get_onchange           : IntPtr
        put_ondurationchange   : IntPtr
        get_ondurationchange   : IntPtr
        put_onemptied          : IntPtr
        get_onemptied          : IntPtr
        put_onended            : IntPtr
        get_onended            : IntPtr
        put_onerror            : IntPtr
        get_onerror            : IntPtr
        put_oninput            : IntPtr
        get_oninput            : IntPtr
        put_onload             : IntPtr
        get_onload             : IntPtr
        put_onloadeddata       : IntPtr
        get_onloadeddata       : IntPtr
        put_onloadedmetadata   : IntPtr
        get_onloadedmetadata   : IntPtr
        put_onloadstart        : IntPtr
        get_onloadstart        : IntPtr
        put_onpause            : IntPtr
        get_onpause            : IntPtr
        put_onplay             : IntPtr
        get_onplay             : IntPtr
        put_onplaying          : IntPtr
        get_onplaying          : IntPtr
        put_onprogress         : IntPtr
        get_onprogress         : IntPtr
        put_onratechange       : IntPtr
        get_onratechange       : IntPtr
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
        put_onsubmit           : IntPtr
        get_onsubmit           : IntPtr
        put_onsuspend          : IntPtr
        get_onsuspend          : IntPtr
        put_ontimeupdate       : IntPtr
        get_ontimeupdate       : IntPtr
        put_onvolumechange     : IntPtr
        get_onvolumechange     : IntPtr
        put_onwaiting          : IntPtr
        get_onwaiting          : IntPtr
        hasAttributes          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    tagName {
        get => this.get_tagName()
    }

    /**
     * @type {BSTR} 
     */
    nodeName {
        get => this.get_nodeName()
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
    ondurationchange {
        get => this.get_ondurationchange()
        set => this.put_ondurationchange(value)
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
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
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
    onload {
        get => this.get_onload()
        set => this.put_onload(value)
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
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT} 
     */
    getAttributeNS(pvarNS, strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pvarNS, BSTR, strAttributeName, VARIANT.Ptr, AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<VARIANT>} pvarAttributeValue 
     * @returns {HRESULT} 
     */
    setAttributeNS(pvarNS, strAttributeName, pvarAttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(8, this, VARIANT.Ptr, pvarNS, BSTR, strAttributeName, VARIANT.Ptr, pvarAttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} strAttributeName 
     * @returns {HRESULT} 
     */
    removeAttributeNS(pvarNS, strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(9, this, VARIANT.Ptr, pvarNS, BSTR, strAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrname 
     * @returns {IHTMLDOMAttribute2} 
     */
    getAttributeNodeNS(pvarNS, bstrname) {
        bstrname := bstrname is String ? BSTR.Alloc(bstrname).Value : bstrname

        result := ComCall(10, this, VARIANT.Ptr, pvarNS, BSTR, bstrname, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    setAttributeNodeNS(pattr) {
        result := ComCall(11, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributeNS(pvarNS, name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(12, this, VARIANT.Ptr, pvarNS, BSTR, name, VARIANT_BOOL.Ptr, &pfHasAttribute := 0, "HRESULT")
        return pfHasAttribute
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT} 
     */
    getAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(13, this, BSTR, strAttributeName, VARIANT.Ptr, AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Pointer<VARIANT>} pvarAttributeValue 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, pvarAttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(14, this, BSTR, strAttributeName, VARIANT.Ptr, pvarAttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {HRESULT} 
     */
    removeAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(15, this, BSTR, strAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {IHTMLDOMAttribute2} 
     */
    getAttributeNode(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(16, this, BSTR, strAttributeName, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    setAttributeNode(pattr) {
        result := ComCall(17, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeAttributeNode(pattr) {
        result := ComCall(18, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    hasAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(19, this, BSTR, name, VARIANT_BOOL.Ptr, &pfHasAttribute := 0, "HRESULT")
        return pfHasAttribute
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varNS 
     * @param {BSTR} bstrLocalName 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByTagNameNS(varNS, bstrLocalName) {
        bstrLocalName := bstrLocalName is String ? BSTR.Alloc(bstrLocalName).Value : bstrLocalName

        result := ComCall(20, this, VARIANT.Ptr, varNS, BSTR, bstrLocalName, "ptr*", &pelColl := 0, "HRESULT")
        return IHTMLElementCollection(pelColl)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeName() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByClassName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "ptr*", &pel := 0, "HRESULT")
        return IHTMLElementCollection(pel)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {VARIANT_BOOL} 
     */
    msMatchesSelector(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(24, this, BSTR, v, VARIANT_BOOL.Ptr, &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplay(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplay() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplaythrough(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplaythrough() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondurationchange(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondurationchange() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onemptied(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onemptied() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onended(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onended() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(39, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(40, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninput(v) {
        result := ComCall(41, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninput() {
        p := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(43, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadeddata(v) {
        result := ComCall(45, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadeddata() {
        p := VARIANT()
        result := ComCall(46, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadedmetadata(v) {
        result := ComCall(47, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadedmetadata() {
        p := VARIANT()
        result := ComCall(48, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadstart(v) {
        result := ComCall(49, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadstart() {
        p := VARIANT()
        result := ComCall(50, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpause(v) {
        result := ComCall(51, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpause() {
        p := VARIANT()
        result := ComCall(52, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplay(v) {
        result := ComCall(53, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplay() {
        p := VARIANT()
        result := ComCall(54, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplaying(v) {
        result := ComCall(55, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplaying() {
        p := VARIANT()
        result := ComCall(56, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(57, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onratechange(v) {
        result := ComCall(59, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onratechange() {
        p := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(61, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(62, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeked(v) {
        result := ComCall(63, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeked() {
        p := VARIANT()
        result := ComCall(64, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeking(v) {
        result := ComCall(65, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeking() {
        p := VARIANT()
        result := ComCall(66, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(67, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(68, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstalled(v) {
        result := ComCall(69, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstalled() {
        p := VARIANT()
        result := ComCall(70, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(71, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(72, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsuspend(v) {
        result := ComCall(73, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsuspend() {
        p := VARIANT()
        result := ComCall(74, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeupdate(v) {
        result := ComCall(75, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ontimeupdate() {
        p := VARIANT()
        result := ComCall(76, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvolumechange(v) {
        result := ComCall(77, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onvolumechange() {
        p := VARIANT()
        result := ComCall(78, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onwaiting(v) {
        result := ComCall(79, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onwaiting() {
        p := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(81, this, VARIANT_BOOL.Ptr, &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
    }

    Query(iid) {
        if (IHTMLElement6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getAttributeNS := CallbackCreate(GetMethod(implObj, "getAttributeNS"), flags, 4)
        this.vtbl.setAttributeNS := CallbackCreate(GetMethod(implObj, "setAttributeNS"), flags, 4)
        this.vtbl.removeAttributeNS := CallbackCreate(GetMethod(implObj, "removeAttributeNS"), flags, 3)
        this.vtbl.getAttributeNodeNS := CallbackCreate(GetMethod(implObj, "getAttributeNodeNS"), flags, 4)
        this.vtbl.setAttributeNodeNS := CallbackCreate(GetMethod(implObj, "setAttributeNodeNS"), flags, 3)
        this.vtbl.hasAttributeNS := CallbackCreate(GetMethod(implObj, "hasAttributeNS"), flags, 4)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 3)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 3)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 2)
        this.vtbl.getAttributeNode := CallbackCreate(GetMethod(implObj, "getAttributeNode"), flags, 3)
        this.vtbl.setAttributeNode := CallbackCreate(GetMethod(implObj, "setAttributeNode"), flags, 3)
        this.vtbl.removeAttributeNode := CallbackCreate(GetMethod(implObj, "removeAttributeNode"), flags, 3)
        this.vtbl.hasAttribute := CallbackCreate(GetMethod(implObj, "hasAttribute"), flags, 3)
        this.vtbl.getElementsByTagNameNS := CallbackCreate(GetMethod(implObj, "getElementsByTagNameNS"), flags, 4)
        this.vtbl.get_tagName := CallbackCreate(GetMethod(implObj, "get_tagName"), flags, 2)
        this.vtbl.get_nodeName := CallbackCreate(GetMethod(implObj, "get_nodeName"), flags, 2)
        this.vtbl.getElementsByClassName := CallbackCreate(GetMethod(implObj, "getElementsByClassName"), flags, 3)
        this.vtbl.msMatchesSelector := CallbackCreate(GetMethod(implObj, "msMatchesSelector"), flags, 3)
        this.vtbl.put_onabort := CallbackCreate(GetMethod(implObj, "put_onabort"), flags, 2)
        this.vtbl.get_onabort := CallbackCreate(GetMethod(implObj, "get_onabort"), flags, 2)
        this.vtbl.put_oncanplay := CallbackCreate(GetMethod(implObj, "put_oncanplay"), flags, 2)
        this.vtbl.get_oncanplay := CallbackCreate(GetMethod(implObj, "get_oncanplay"), flags, 2)
        this.vtbl.put_oncanplaythrough := CallbackCreate(GetMethod(implObj, "put_oncanplaythrough"), flags, 2)
        this.vtbl.get_oncanplaythrough := CallbackCreate(GetMethod(implObj, "get_oncanplaythrough"), flags, 2)
        this.vtbl.put_onchange := CallbackCreate(GetMethod(implObj, "put_onchange"), flags, 2)
        this.vtbl.get_onchange := CallbackCreate(GetMethod(implObj, "get_onchange"), flags, 2)
        this.vtbl.put_ondurationchange := CallbackCreate(GetMethod(implObj, "put_ondurationchange"), flags, 2)
        this.vtbl.get_ondurationchange := CallbackCreate(GetMethod(implObj, "get_ondurationchange"), flags, 2)
        this.vtbl.put_onemptied := CallbackCreate(GetMethod(implObj, "put_onemptied"), flags, 2)
        this.vtbl.get_onemptied := CallbackCreate(GetMethod(implObj, "get_onemptied"), flags, 2)
        this.vtbl.put_onended := CallbackCreate(GetMethod(implObj, "put_onended"), flags, 2)
        this.vtbl.get_onended := CallbackCreate(GetMethod(implObj, "get_onended"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_oninput := CallbackCreate(GetMethod(implObj, "put_oninput"), flags, 2)
        this.vtbl.get_oninput := CallbackCreate(GetMethod(implObj, "get_oninput"), flags, 2)
        this.vtbl.put_onload := CallbackCreate(GetMethod(implObj, "put_onload"), flags, 2)
        this.vtbl.get_onload := CallbackCreate(GetMethod(implObj, "get_onload"), flags, 2)
        this.vtbl.put_onloadeddata := CallbackCreate(GetMethod(implObj, "put_onloadeddata"), flags, 2)
        this.vtbl.get_onloadeddata := CallbackCreate(GetMethod(implObj, "get_onloadeddata"), flags, 2)
        this.vtbl.put_onloadedmetadata := CallbackCreate(GetMethod(implObj, "put_onloadedmetadata"), flags, 2)
        this.vtbl.get_onloadedmetadata := CallbackCreate(GetMethod(implObj, "get_onloadedmetadata"), flags, 2)
        this.vtbl.put_onloadstart := CallbackCreate(GetMethod(implObj, "put_onloadstart"), flags, 2)
        this.vtbl.get_onloadstart := CallbackCreate(GetMethod(implObj, "get_onloadstart"), flags, 2)
        this.vtbl.put_onpause := CallbackCreate(GetMethod(implObj, "put_onpause"), flags, 2)
        this.vtbl.get_onpause := CallbackCreate(GetMethod(implObj, "get_onpause"), flags, 2)
        this.vtbl.put_onplay := CallbackCreate(GetMethod(implObj, "put_onplay"), flags, 2)
        this.vtbl.get_onplay := CallbackCreate(GetMethod(implObj, "get_onplay"), flags, 2)
        this.vtbl.put_onplaying := CallbackCreate(GetMethod(implObj, "put_onplaying"), flags, 2)
        this.vtbl.get_onplaying := CallbackCreate(GetMethod(implObj, "get_onplaying"), flags, 2)
        this.vtbl.put_onprogress := CallbackCreate(GetMethod(implObj, "put_onprogress"), flags, 2)
        this.vtbl.get_onprogress := CallbackCreate(GetMethod(implObj, "get_onprogress"), flags, 2)
        this.vtbl.put_onratechange := CallbackCreate(GetMethod(implObj, "put_onratechange"), flags, 2)
        this.vtbl.get_onratechange := CallbackCreate(GetMethod(implObj, "get_onratechange"), flags, 2)
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
        this.vtbl.put_onsubmit := CallbackCreate(GetMethod(implObj, "put_onsubmit"), flags, 2)
        this.vtbl.get_onsubmit := CallbackCreate(GetMethod(implObj, "get_onsubmit"), flags, 2)
        this.vtbl.put_onsuspend := CallbackCreate(GetMethod(implObj, "put_onsuspend"), flags, 2)
        this.vtbl.get_onsuspend := CallbackCreate(GetMethod(implObj, "get_onsuspend"), flags, 2)
        this.vtbl.put_ontimeupdate := CallbackCreate(GetMethod(implObj, "put_ontimeupdate"), flags, 2)
        this.vtbl.get_ontimeupdate := CallbackCreate(GetMethod(implObj, "get_ontimeupdate"), flags, 2)
        this.vtbl.put_onvolumechange := CallbackCreate(GetMethod(implObj, "put_onvolumechange"), flags, 2)
        this.vtbl.get_onvolumechange := CallbackCreate(GetMethod(implObj, "get_onvolumechange"), flags, 2)
        this.vtbl.put_onwaiting := CallbackCreate(GetMethod(implObj, "put_onwaiting"), flags, 2)
        this.vtbl.get_onwaiting := CallbackCreate(GetMethod(implObj, "get_onwaiting"), flags, 2)
        this.vtbl.hasAttributes := CallbackCreate(GetMethod(implObj, "hasAttributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getAttributeNS)
        CallbackFree(this.vtbl.setAttributeNS)
        CallbackFree(this.vtbl.removeAttributeNS)
        CallbackFree(this.vtbl.getAttributeNodeNS)
        CallbackFree(this.vtbl.setAttributeNodeNS)
        CallbackFree(this.vtbl.hasAttributeNS)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.getAttributeNode)
        CallbackFree(this.vtbl.setAttributeNode)
        CallbackFree(this.vtbl.removeAttributeNode)
        CallbackFree(this.vtbl.hasAttribute)
        CallbackFree(this.vtbl.getElementsByTagNameNS)
        CallbackFree(this.vtbl.get_tagName)
        CallbackFree(this.vtbl.get_nodeName)
        CallbackFree(this.vtbl.getElementsByClassName)
        CallbackFree(this.vtbl.msMatchesSelector)
        CallbackFree(this.vtbl.put_onabort)
        CallbackFree(this.vtbl.get_onabort)
        CallbackFree(this.vtbl.put_oncanplay)
        CallbackFree(this.vtbl.get_oncanplay)
        CallbackFree(this.vtbl.put_oncanplaythrough)
        CallbackFree(this.vtbl.get_oncanplaythrough)
        CallbackFree(this.vtbl.put_onchange)
        CallbackFree(this.vtbl.get_onchange)
        CallbackFree(this.vtbl.put_ondurationchange)
        CallbackFree(this.vtbl.get_ondurationchange)
        CallbackFree(this.vtbl.put_onemptied)
        CallbackFree(this.vtbl.get_onemptied)
        CallbackFree(this.vtbl.put_onended)
        CallbackFree(this.vtbl.get_onended)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_oninput)
        CallbackFree(this.vtbl.get_oninput)
        CallbackFree(this.vtbl.put_onload)
        CallbackFree(this.vtbl.get_onload)
        CallbackFree(this.vtbl.put_onloadeddata)
        CallbackFree(this.vtbl.get_onloadeddata)
        CallbackFree(this.vtbl.put_onloadedmetadata)
        CallbackFree(this.vtbl.get_onloadedmetadata)
        CallbackFree(this.vtbl.put_onloadstart)
        CallbackFree(this.vtbl.get_onloadstart)
        CallbackFree(this.vtbl.put_onpause)
        CallbackFree(this.vtbl.get_onpause)
        CallbackFree(this.vtbl.put_onplay)
        CallbackFree(this.vtbl.get_onplay)
        CallbackFree(this.vtbl.put_onplaying)
        CallbackFree(this.vtbl.get_onplaying)
        CallbackFree(this.vtbl.put_onprogress)
        CallbackFree(this.vtbl.get_onprogress)
        CallbackFree(this.vtbl.put_onratechange)
        CallbackFree(this.vtbl.get_onratechange)
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
        CallbackFree(this.vtbl.put_onsubmit)
        CallbackFree(this.vtbl.get_onsubmit)
        CallbackFree(this.vtbl.put_onsuspend)
        CallbackFree(this.vtbl.get_onsuspend)
        CallbackFree(this.vtbl.put_ontimeupdate)
        CallbackFree(this.vtbl.get_ontimeupdate)
        CallbackFree(this.vtbl.put_onvolumechange)
        CallbackFree(this.vtbl.get_onvolumechange)
        CallbackFree(this.vtbl.put_onwaiting)
        CallbackFree(this.vtbl.get_onwaiting)
        CallbackFree(this.vtbl.hasAttributes)
    }
}
