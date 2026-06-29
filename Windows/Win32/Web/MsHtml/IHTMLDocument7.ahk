#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDOMProcessingInstruction.ahk" { IDOMProcessingInstruction }
#Import ".\IHTMLDOMAttribute.ahk" { IHTMLDOMAttribute }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLSelection.ahk" { IHTMLSelection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMNode3.ahk" { IHTMLDOMNode3 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocument7 extends IDispatch {
    /**
     * The interface identifier for IHTMLDocument7
     * @type {Guid}
     */
    static IID := Guid("{305104b8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocument7 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_defaultView                     : IntPtr
        createCDATASection                  : IntPtr
        getSelection                        : IntPtr
        getElementsByTagNameNS              : IntPtr
        createElementNS                     : IntPtr
        createAttributeNS                   : IntPtr
        put_onmsthumbnailclick              : IntPtr
        get_onmsthumbnailclick              : IntPtr
        get_characterSet                    : IntPtr
        createElement                       : IntPtr
        createAttribute                     : IntPtr
        getElementsByClassName              : IntPtr
        createProcessingInstruction         : IntPtr
        adoptNode                           : IntPtr
        put_onmssitemodejumplistitemremoved : IntPtr
        get_onmssitemodejumplistitemremoved : IntPtr
        get_all                             : IntPtr
        get_inputEncoding                   : IntPtr
        get_xmlEncoding                     : IntPtr
        put_xmlStandalone                   : IntPtr
        get_xmlStandalone                   : IntPtr
        put_xmlVersion                      : IntPtr
        get_xmlVersion                      : IntPtr
        hasAttributes                       : IntPtr
        put_onabort                         : IntPtr
        get_onabort                         : IntPtr
        put_onblur                          : IntPtr
        get_onblur                          : IntPtr
        put_oncanplay                       : IntPtr
        get_oncanplay                       : IntPtr
        put_oncanplaythrough                : IntPtr
        get_oncanplaythrough                : IntPtr
        put_onchange                        : IntPtr
        get_onchange                        : IntPtr
        put_ondrag                          : IntPtr
        get_ondrag                          : IntPtr
        put_ondragend                       : IntPtr
        get_ondragend                       : IntPtr
        put_ondragenter                     : IntPtr
        get_ondragenter                     : IntPtr
        put_ondragleave                     : IntPtr
        get_ondragleave                     : IntPtr
        put_ondragover                      : IntPtr
        get_ondragover                      : IntPtr
        put_ondrop                          : IntPtr
        get_ondrop                          : IntPtr
        put_ondurationchange                : IntPtr
        get_ondurationchange                : IntPtr
        put_onemptied                       : IntPtr
        get_onemptied                       : IntPtr
        put_onended                         : IntPtr
        get_onended                         : IntPtr
        put_onerror                         : IntPtr
        get_onerror                         : IntPtr
        put_onfocus                         : IntPtr
        get_onfocus                         : IntPtr
        put_oninput                         : IntPtr
        get_oninput                         : IntPtr
        put_onload                          : IntPtr
        get_onload                          : IntPtr
        put_onloadeddata                    : IntPtr
        get_onloadeddata                    : IntPtr
        put_onloadedmetadata                : IntPtr
        get_onloadedmetadata                : IntPtr
        put_onloadstart                     : IntPtr
        get_onloadstart                     : IntPtr
        put_onpause                         : IntPtr
        get_onpause                         : IntPtr
        put_onplay                          : IntPtr
        get_onplay                          : IntPtr
        put_onplaying                       : IntPtr
        get_onplaying                       : IntPtr
        put_onprogress                      : IntPtr
        get_onprogress                      : IntPtr
        put_onratechange                    : IntPtr
        get_onratechange                    : IntPtr
        put_onreset                         : IntPtr
        get_onreset                         : IntPtr
        put_onscroll                        : IntPtr
        get_onscroll                        : IntPtr
        put_onseeked                        : IntPtr
        get_onseeked                        : IntPtr
        put_onseeking                       : IntPtr
        get_onseeking                       : IntPtr
        put_onselect                        : IntPtr
        get_onselect                        : IntPtr
        put_onstalled                       : IntPtr
        get_onstalled                       : IntPtr
        put_onsubmit                        : IntPtr
        get_onsubmit                        : IntPtr
        put_onsuspend                       : IntPtr
        get_onsuspend                       : IntPtr
        put_ontimeupdate                    : IntPtr
        get_ontimeupdate                    : IntPtr
        put_onvolumechange                  : IntPtr
        get_onvolumechange                  : IntPtr
        put_onwaiting                       : IntPtr
        get_onwaiting                       : IntPtr
        normalize                           : IntPtr
        importNode                          : IntPtr
        get_parentWindow                    : IntPtr
        putref_body                         : IntPtr
        get_body                            : IntPtr
        get_head                            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocument7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLWindow2} 
     */
    defaultView {
        get => this.get_defaultView()
    }

    /**
     * @type {VARIANT} 
     */
    onmsthumbnailclick {
        get => this.get_onmsthumbnailclick()
        set => this.put_onmsthumbnailclick(value)
    }

    /**
     * @type {BSTR} 
     */
    characterSet {
        get => this.get_characterSet()
    }

    /**
     * @type {VARIANT} 
     */
    onmssitemodejumplistitemremoved {
        get => this.get_onmssitemodejumplistitemremoved()
        set => this.put_onmssitemodejumplistitemremoved(value)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    all {
        get => this.get_all()
    }

    /**
     * @type {BSTR} 
     */
    inputEncoding {
        get => this.get_inputEncoding()
    }

    /**
     * @type {BSTR} 
     */
    xmlEncoding {
        get => this.get_xmlEncoding()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    xmlStandalone {
        get => this.get_xmlStandalone()
        set => this.put_xmlStandalone(value)
    }

    /**
     * @type {BSTR} 
     */
    xmlVersion {
        get => this.get_xmlVersion()
        set => this.put_xmlVersion(value)
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
    onblur {
        get => this.get_onblur()
        set => this.put_onblur(value)
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
    onfocus {
        get => this.get_onfocus()
        set => this.put_onfocus(value)
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
    onscroll {
        get => this.get_onscroll()
        set => this.put_onscroll(value)
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
     * @type {IHTMLWindow2} 
     */
    parentWindow {
        get => this.get_parentWindow()
    }

    /**
     * @type {IHTMLElement} 
     */
    body {
        get => this.get_body()
    }

    /**
     * @type {IHTMLElement} 
     */
    head {
        get => this.get_head()
    }

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

        result := ComCall(8, this, BSTR, text, "ptr*", &newCDATASectionNode := 0, "HRESULT")
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

        result := ComCall(10, this, VARIANT.Ptr, pvarNS, BSTR, bstrLocalName, "ptr*", &pelColl := 0, "HRESULT")
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

        result := ComCall(11, this, VARIANT.Ptr, pvarNS, BSTR, bstrTag, "ptr*", &newElem := 0, "HRESULT")
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

        result := ComCall(12, this, VARIANT.Ptr, pvarNS, BSTR, bstrAttrName, "ptr*", &ppAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppAttribute)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsthumbnailclick(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsthumbnailclick() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_characterSet() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrTag 
     * @returns {IHTMLElement} 
     */
    createElement(bstrTag) {
        bstrTag := bstrTag is String ? BSTR.Alloc(bstrTag).Value : bstrTag

        result := ComCall(16, this, BSTR, bstrTag, "ptr*", &newElem := 0, "HRESULT")
        return IHTMLElement(newElem)
    }

    /**
     * 
     * @param {BSTR} bstrAttrName 
     * @returns {IHTMLDOMAttribute} 
     */
    createAttribute(bstrAttrName) {
        bstrAttrName := bstrAttrName is String ? BSTR.Alloc(bstrAttrName).Value : bstrAttrName

        result := ComCall(17, this, BSTR, bstrAttrName, "ptr*", &ppAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppAttribute)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByClassName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, BSTR, v, "ptr*", &pel := 0, "HRESULT")
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

        result := ComCall(19, this, BSTR, bstrTarget, BSTR, bstrData, "ptr*", &newProcessingInstruction := 0, "HRESULT")
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
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmssitemodejumplistitemremoved() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
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
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmlEncoding() {
        p := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_xmlStandalone(v) {
        result := ComCall(26, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_xmlStandalone() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmlVersion(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmlVersion() {
        p := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(30, this, VARIANT_BOOL.Ptr, &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplay(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplay() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncanplaythrough(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncanplaythrough() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(39, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(40, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrag(v) {
        result := ComCall(41, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrag() {
        p := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragend(v) {
        result := ComCall(43, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragend() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragenter(v) {
        result := ComCall(45, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragenter() {
        p := VARIANT()
        result := ComCall(46, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragleave(v) {
        result := ComCall(47, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragleave() {
        p := VARIANT()
        result := ComCall(48, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragover(v) {
        result := ComCall(49, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragover() {
        p := VARIANT()
        result := ComCall(50, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrop(v) {
        result := ComCall(51, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrop() {
        p := VARIANT()
        result := ComCall(52, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondurationchange(v) {
        result := ComCall(53, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondurationchange() {
        p := VARIANT()
        result := ComCall(54, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onemptied(v) {
        result := ComCall(55, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onemptied() {
        p := VARIANT()
        result := ComCall(56, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onended(v) {
        result := ComCall(57, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onended() {
        p := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(59, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(61, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(62, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninput(v) {
        result := ComCall(63, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninput() {
        p := VARIANT()
        result := ComCall(64, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(65, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(66, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadeddata(v) {
        result := ComCall(67, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadeddata() {
        p := VARIANT()
        result := ComCall(68, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadedmetadata(v) {
        result := ComCall(69, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadedmetadata() {
        p := VARIANT()
        result := ComCall(70, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onloadstart(v) {
        result := ComCall(71, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onloadstart() {
        p := VARIANT()
        result := ComCall(72, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpause(v) {
        result := ComCall(73, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpause() {
        p := VARIANT()
        result := ComCall(74, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplay(v) {
        result := ComCall(75, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplay() {
        p := VARIANT()
        result := ComCall(76, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onplaying(v) {
        result := ComCall(77, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onplaying() {
        p := VARIANT()
        result := ComCall(78, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(79, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onratechange(v) {
        result := ComCall(81, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onratechange() {
        p := VARIANT()
        result := ComCall(82, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(83, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(84, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(85, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(86, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeked(v) {
        result := ComCall(87, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeked() {
        p := VARIANT()
        result := ComCall(88, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onseeking(v) {
        result := ComCall(89, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onseeking() {
        p := VARIANT()
        result := ComCall(90, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(91, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(92, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstalled(v) {
        result := ComCall(93, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstalled() {
        p := VARIANT()
        result := ComCall(94, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(95, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(96, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsuspend(v) {
        result := ComCall(97, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsuspend() {
        p := VARIANT()
        result := ComCall(98, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeupdate(v) {
        result := ComCall(99, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ontimeupdate() {
        p := VARIANT()
        result := ComCall(100, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onvolumechange(v) {
        result := ComCall(101, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onvolumechange() {
        p := VARIANT()
        result := ComCall(102, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onwaiting(v) {
        result := ComCall(103, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onwaiting() {
        p := VARIANT()
        result := ComCall(104, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * Normalizes the specified floating-point vector according to x / length(x).
     * @remarks
     * The **normalize** HLSL intrinsic function uses the following formula: *x* / [**length**](dx-graphics-hlsl-length.md)(*x*).
     * @returns {HRESULT} | Item                                                   | Description                                            |
     * |--------------------------------------------------------|--------------------------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified floating-point vector.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * The normalized *x* parameter. If the length of the *x* parameter is 0, the result is indefinite.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-normalize
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
        result := ComCall(106, this, "ptr", pNodeSource, VARIANT_BOOL, fDeep, "ptr*", &ppNodeDest := 0, "HRESULT")
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

    Query(iid) {
        if (IHTMLDocument7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_defaultView := CallbackCreate(GetMethod(implObj, "get_defaultView"), flags, 2)
        this.vtbl.createCDATASection := CallbackCreate(GetMethod(implObj, "createCDATASection"), flags, 3)
        this.vtbl.getSelection := CallbackCreate(GetMethod(implObj, "getSelection"), flags, 2)
        this.vtbl.getElementsByTagNameNS := CallbackCreate(GetMethod(implObj, "getElementsByTagNameNS"), flags, 4)
        this.vtbl.createElementNS := CallbackCreate(GetMethod(implObj, "createElementNS"), flags, 4)
        this.vtbl.createAttributeNS := CallbackCreate(GetMethod(implObj, "createAttributeNS"), flags, 4)
        this.vtbl.put_onmsthumbnailclick := CallbackCreate(GetMethod(implObj, "put_onmsthumbnailclick"), flags, 2)
        this.vtbl.get_onmsthumbnailclick := CallbackCreate(GetMethod(implObj, "get_onmsthumbnailclick"), flags, 2)
        this.vtbl.get_characterSet := CallbackCreate(GetMethod(implObj, "get_characterSet"), flags, 2)
        this.vtbl.createElement := CallbackCreate(GetMethod(implObj, "createElement"), flags, 3)
        this.vtbl.createAttribute := CallbackCreate(GetMethod(implObj, "createAttribute"), flags, 3)
        this.vtbl.getElementsByClassName := CallbackCreate(GetMethod(implObj, "getElementsByClassName"), flags, 3)
        this.vtbl.createProcessingInstruction := CallbackCreate(GetMethod(implObj, "createProcessingInstruction"), flags, 4)
        this.vtbl.adoptNode := CallbackCreate(GetMethod(implObj, "adoptNode"), flags, 3)
        this.vtbl.put_onmssitemodejumplistitemremoved := CallbackCreate(GetMethod(implObj, "put_onmssitemodejumplistitemremoved"), flags, 2)
        this.vtbl.get_onmssitemodejumplistitemremoved := CallbackCreate(GetMethod(implObj, "get_onmssitemodejumplistitemremoved"), flags, 2)
        this.vtbl.get_all := CallbackCreate(GetMethod(implObj, "get_all"), flags, 2)
        this.vtbl.get_inputEncoding := CallbackCreate(GetMethod(implObj, "get_inputEncoding"), flags, 2)
        this.vtbl.get_xmlEncoding := CallbackCreate(GetMethod(implObj, "get_xmlEncoding"), flags, 2)
        this.vtbl.put_xmlStandalone := CallbackCreate(GetMethod(implObj, "put_xmlStandalone"), flags, 2)
        this.vtbl.get_xmlStandalone := CallbackCreate(GetMethod(implObj, "get_xmlStandalone"), flags, 2)
        this.vtbl.put_xmlVersion := CallbackCreate(GetMethod(implObj, "put_xmlVersion"), flags, 2)
        this.vtbl.get_xmlVersion := CallbackCreate(GetMethod(implObj, "get_xmlVersion"), flags, 2)
        this.vtbl.hasAttributes := CallbackCreate(GetMethod(implObj, "hasAttributes"), flags, 2)
        this.vtbl.put_onabort := CallbackCreate(GetMethod(implObj, "put_onabort"), flags, 2)
        this.vtbl.get_onabort := CallbackCreate(GetMethod(implObj, "get_onabort"), flags, 2)
        this.vtbl.put_onblur := CallbackCreate(GetMethod(implObj, "put_onblur"), flags, 2)
        this.vtbl.get_onblur := CallbackCreate(GetMethod(implObj, "get_onblur"), flags, 2)
        this.vtbl.put_oncanplay := CallbackCreate(GetMethod(implObj, "put_oncanplay"), flags, 2)
        this.vtbl.get_oncanplay := CallbackCreate(GetMethod(implObj, "get_oncanplay"), flags, 2)
        this.vtbl.put_oncanplaythrough := CallbackCreate(GetMethod(implObj, "put_oncanplaythrough"), flags, 2)
        this.vtbl.get_oncanplaythrough := CallbackCreate(GetMethod(implObj, "get_oncanplaythrough"), flags, 2)
        this.vtbl.put_onchange := CallbackCreate(GetMethod(implObj, "put_onchange"), flags, 2)
        this.vtbl.get_onchange := CallbackCreate(GetMethod(implObj, "get_onchange"), flags, 2)
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
        this.vtbl.put_ondrop := CallbackCreate(GetMethod(implObj, "put_ondrop"), flags, 2)
        this.vtbl.get_ondrop := CallbackCreate(GetMethod(implObj, "get_ondrop"), flags, 2)
        this.vtbl.put_ondurationchange := CallbackCreate(GetMethod(implObj, "put_ondurationchange"), flags, 2)
        this.vtbl.get_ondurationchange := CallbackCreate(GetMethod(implObj, "get_ondurationchange"), flags, 2)
        this.vtbl.put_onemptied := CallbackCreate(GetMethod(implObj, "put_onemptied"), flags, 2)
        this.vtbl.get_onemptied := CallbackCreate(GetMethod(implObj, "get_onemptied"), flags, 2)
        this.vtbl.put_onended := CallbackCreate(GetMethod(implObj, "put_onended"), flags, 2)
        this.vtbl.get_onended := CallbackCreate(GetMethod(implObj, "get_onended"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_onfocus := CallbackCreate(GetMethod(implObj, "put_onfocus"), flags, 2)
        this.vtbl.get_onfocus := CallbackCreate(GetMethod(implObj, "get_onfocus"), flags, 2)
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
        this.vtbl.put_onscroll := CallbackCreate(GetMethod(implObj, "put_onscroll"), flags, 2)
        this.vtbl.get_onscroll := CallbackCreate(GetMethod(implObj, "get_onscroll"), flags, 2)
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
        this.vtbl.normalize := CallbackCreate(GetMethod(implObj, "normalize"), flags, 1)
        this.vtbl.importNode := CallbackCreate(GetMethod(implObj, "importNode"), flags, 4)
        this.vtbl.get_parentWindow := CallbackCreate(GetMethod(implObj, "get_parentWindow"), flags, 2)
        this.vtbl.putref_body := CallbackCreate(GetMethod(implObj, "putref_body"), flags, 2)
        this.vtbl.get_body := CallbackCreate(GetMethod(implObj, "get_body"), flags, 2)
        this.vtbl.get_head := CallbackCreate(GetMethod(implObj, "get_head"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_defaultView)
        CallbackFree(this.vtbl.createCDATASection)
        CallbackFree(this.vtbl.getSelection)
        CallbackFree(this.vtbl.getElementsByTagNameNS)
        CallbackFree(this.vtbl.createElementNS)
        CallbackFree(this.vtbl.createAttributeNS)
        CallbackFree(this.vtbl.put_onmsthumbnailclick)
        CallbackFree(this.vtbl.get_onmsthumbnailclick)
        CallbackFree(this.vtbl.get_characterSet)
        CallbackFree(this.vtbl.createElement)
        CallbackFree(this.vtbl.createAttribute)
        CallbackFree(this.vtbl.getElementsByClassName)
        CallbackFree(this.vtbl.createProcessingInstruction)
        CallbackFree(this.vtbl.adoptNode)
        CallbackFree(this.vtbl.put_onmssitemodejumplistitemremoved)
        CallbackFree(this.vtbl.get_onmssitemodejumplistitemremoved)
        CallbackFree(this.vtbl.get_all)
        CallbackFree(this.vtbl.get_inputEncoding)
        CallbackFree(this.vtbl.get_xmlEncoding)
        CallbackFree(this.vtbl.put_xmlStandalone)
        CallbackFree(this.vtbl.get_xmlStandalone)
        CallbackFree(this.vtbl.put_xmlVersion)
        CallbackFree(this.vtbl.get_xmlVersion)
        CallbackFree(this.vtbl.hasAttributes)
        CallbackFree(this.vtbl.put_onabort)
        CallbackFree(this.vtbl.get_onabort)
        CallbackFree(this.vtbl.put_onblur)
        CallbackFree(this.vtbl.get_onblur)
        CallbackFree(this.vtbl.put_oncanplay)
        CallbackFree(this.vtbl.get_oncanplay)
        CallbackFree(this.vtbl.put_oncanplaythrough)
        CallbackFree(this.vtbl.get_oncanplaythrough)
        CallbackFree(this.vtbl.put_onchange)
        CallbackFree(this.vtbl.get_onchange)
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
        CallbackFree(this.vtbl.put_ondrop)
        CallbackFree(this.vtbl.get_ondrop)
        CallbackFree(this.vtbl.put_ondurationchange)
        CallbackFree(this.vtbl.get_ondurationchange)
        CallbackFree(this.vtbl.put_onemptied)
        CallbackFree(this.vtbl.get_onemptied)
        CallbackFree(this.vtbl.put_onended)
        CallbackFree(this.vtbl.get_onended)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_onfocus)
        CallbackFree(this.vtbl.get_onfocus)
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
        CallbackFree(this.vtbl.put_onscroll)
        CallbackFree(this.vtbl.get_onscroll)
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
        CallbackFree(this.vtbl.normalize)
        CallbackFree(this.vtbl.importNode)
        CallbackFree(this.vtbl.get_parentWindow)
        CallbackFree(this.vtbl.putref_body)
        CallbackFree(this.vtbl.get_body)
        CallbackFree(this.vtbl.get_head)
    }
}
