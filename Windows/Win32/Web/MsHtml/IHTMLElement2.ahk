#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyle.ahk" { IHTMLStyle }
#Import ".\IHTMLRect.ahk" { IHTMLRect }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IHTMLRectCollection.ahk" { IHTMLRectCollection }
#Import ".\IHTMLCurrentStyle.ahk" { IHTMLCurrentStyle }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f434-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_scopeName          : IntPtr
        setCapture             : IntPtr
        releaseCapture         : IntPtr
        put_onlosecapture      : IntPtr
        get_onlosecapture      : IntPtr
        componentFromPoint     : IntPtr
        doScroll               : IntPtr
        put_onscroll           : IntPtr
        get_onscroll           : IntPtr
        put_ondrag             : IntPtr
        get_ondrag             : IntPtr
        put_ondragend          : IntPtr
        get_ondragend          : IntPtr
        put_ondragenter        : IntPtr
        get_ondragenter        : IntPtr
        put_ondragover         : IntPtr
        get_ondragover         : IntPtr
        put_ondragleave        : IntPtr
        get_ondragleave        : IntPtr
        put_ondrop             : IntPtr
        get_ondrop             : IntPtr
        put_onbeforecut        : IntPtr
        get_onbeforecut        : IntPtr
        put_oncut              : IntPtr
        get_oncut              : IntPtr
        put_onbeforecopy       : IntPtr
        get_onbeforecopy       : IntPtr
        put_oncopy             : IntPtr
        get_oncopy             : IntPtr
        put_onbeforepaste      : IntPtr
        get_onbeforepaste      : IntPtr
        put_onpaste            : IntPtr
        get_onpaste            : IntPtr
        get_currentStyle       : IntPtr
        put_onpropertychange   : IntPtr
        get_onpropertychange   : IntPtr
        getClientRects         : IntPtr
        getBoundingClientRect  : IntPtr
        setExpression          : IntPtr
        getExpression          : IntPtr
        removeExpression       : IntPtr
        put_tabIndex           : IntPtr
        get_tabIndex           : IntPtr
        focus                  : IntPtr
        put_accessKey          : IntPtr
        get_accessKey          : IntPtr
        put_onblur             : IntPtr
        get_onblur             : IntPtr
        put_onfocus            : IntPtr
        get_onfocus            : IntPtr
        put_onresize           : IntPtr
        get_onresize           : IntPtr
        blur                   : IntPtr
        addFilter              : IntPtr
        removeFilter           : IntPtr
        get_clientHeight       : IntPtr
        get_clientWidth        : IntPtr
        get_clientTop          : IntPtr
        get_clientLeft         : IntPtr
        attachEvent            : IntPtr
        detachEvent            : IntPtr
        get_readyState         : IntPtr
        put_onreadystatechange : IntPtr
        get_onreadystatechange : IntPtr
        put_onrowsdelete       : IntPtr
        get_onrowsdelete       : IntPtr
        put_onrowsinserted     : IntPtr
        get_onrowsinserted     : IntPtr
        put_oncellchange       : IntPtr
        get_oncellchange       : IntPtr
        put_dir                : IntPtr
        get_dir                : IntPtr
        createControlRange     : IntPtr
        get_scrollHeight       : IntPtr
        get_scrollWidth        : IntPtr
        put_scrollTop          : IntPtr
        get_scrollTop          : IntPtr
        put_scrollLeft         : IntPtr
        get_scrollLeft         : IntPtr
        clearAttributes        : IntPtr
        mergeAttributes        : IntPtr
        put_oncontextmenu      : IntPtr
        get_oncontextmenu      : IntPtr
        insertAdjacentElement  : IntPtr
        applyElement           : IntPtr
        getAdjacentText        : IntPtr
        replaceAdjacentText    : IntPtr
        get_canHaveChildren    : IntPtr
        addBehavior            : IntPtr
        removeBehavior         : IntPtr
        get_runtimeStyle       : IntPtr
        get_behaviorUrns       : IntPtr
        put_tagUrn             : IntPtr
        get_tagUrn             : IntPtr
        put_onbeforeeditfocus  : IntPtr
        get_onbeforeeditfocus  : IntPtr
        get_readyStateValue    : IntPtr
        getElementsByTagName   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    scopeName {
        get => this.get_scopeName()
    }

    /**
     * @type {VARIANT} 
     */
    onlosecapture {
        get => this.get_onlosecapture()
        set => this.put_onlosecapture(value)
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
    ondragover {
        get => this.get_ondragover()
        set => this.put_ondragover(value)
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
    ondrop {
        get => this.get_ondrop()
        set => this.put_ondrop(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforecut {
        get => this.get_onbeforecut()
        set => this.put_onbeforecut(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncut {
        get => this.get_oncut()
        set => this.put_oncut(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforecopy {
        get => this.get_onbeforecopy()
        set => this.put_onbeforecopy(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncopy {
        get => this.get_oncopy()
        set => this.put_oncopy(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforepaste {
        get => this.get_onbeforepaste()
        set => this.put_onbeforepaste(value)
    }

    /**
     * @type {VARIANT} 
     */
    onpaste {
        get => this.get_onpaste()
        set => this.put_onpaste(value)
    }

    /**
     * @type {IHTMLCurrentStyle} 
     */
    currentStyle {
        get => this.get_currentStyle()
    }

    /**
     * @type {VARIANT} 
     */
    onpropertychange {
        get => this.get_onpropertychange()
        set => this.put_onpropertychange(value)
    }

    /**
     * @type {Integer} 
     */
    tabIndex {
        get => this.get_tabIndex()
        set => this.put_tabIndex(value)
    }

    /**
     * @type {BSTR} 
     */
    accessKey {
        get => this.get_accessKey()
        set => this.put_accessKey(value)
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
    onfocus {
        get => this.get_onfocus()
        set => this.put_onfocus(value)
    }

    /**
     * @type {VARIANT} 
     */
    onresize {
        get => this.get_onresize()
        set => this.put_onresize(value)
    }

    /**
     * @type {Integer} 
     */
    clientHeight {
        get => this.get_clientHeight()
    }

    /**
     * @type {Integer} 
     */
    clientWidth {
        get => this.get_clientWidth()
    }

    /**
     * @type {Integer} 
     */
    clientTop {
        get => this.get_clientTop()
    }

    /**
     * @type {Integer} 
     */
    clientLeft {
        get => this.get_clientLeft()
    }

    /**
     * @type {VARIANT} 
     */
    readyState {
        get => this.get_readyState()
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
    onrowsdelete {
        get => this.get_onrowsdelete()
        set => this.put_onrowsdelete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onrowsinserted {
        get => this.get_onrowsinserted()
        set => this.put_onrowsinserted(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncellchange {
        get => this.get_oncellchange()
        set => this.put_oncellchange(value)
    }

    /**
     * @type {BSTR} 
     */
    dir {
        get => this.get_dir()
        set => this.put_dir(value)
    }

    /**
     * @type {Integer} 
     */
    scrollHeight {
        get => this.get_scrollHeight()
    }

    /**
     * @type {Integer} 
     */
    scrollWidth {
        get => this.get_scrollWidth()
    }

    /**
     * @type {Integer} 
     */
    scrollTop {
        get => this.get_scrollTop()
        set => this.put_scrollTop(value)
    }

    /**
     * @type {Integer} 
     */
    scrollLeft {
        get => this.get_scrollLeft()
        set => this.put_scrollLeft(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncontextmenu {
        get => this.get_oncontextmenu()
        set => this.put_oncontextmenu(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    canHaveChildren {
        get => this.get_canHaveChildren()
    }

    /**
     * @type {IHTMLStyle} 
     */
    runtimeStyle {
        get => this.get_runtimeStyle()
    }

    /**
     * @type {IDispatch} 
     */
    behaviorUrns {
        get => this.get_behaviorUrns()
    }

    /**
     * @type {BSTR} 
     */
    tagUrn {
        get => this.get_tagUrn()
        set => this.put_tagUrn(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeeditfocus {
        get => this.get_onbeforeeditfocus()
        set => this.put_onbeforeeditfocus(value)
    }

    /**
     * @type {Integer} 
     */
    readyStateValue {
        get => this.get_readyStateValue()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_scopeName() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} containerCapture 
     * @returns {HRESULT} 
     */
    setCapture(containerCapture) {
        result := ComCall(8, this, VARIANT_BOOL, containerCapture, "HRESULT")
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
        result := ComCall(10, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onlosecapture() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {BSTR} 
     */
    componentFromPoint(x, y) {
        _component := BSTR.Owned()
        result := ComCall(12, this, "int", x, "int", y, BSTR.Ptr, _component, "HRESULT")
        return _component
    }

    /**
     * 
     * @param {VARIANT} _component 
     * @returns {HRESULT} 
     */
    doScroll(_component) {
        result := ComCall(13, this, VARIANT, _component, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrag(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrag() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragend(v) {
        result := ComCall(18, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragend() {
        p := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragenter(v) {
        result := ComCall(20, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragenter() {
        p := VARIANT()
        result := ComCall(21, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragover(v) {
        result := ComCall(22, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragover() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragleave(v) {
        result := ComCall(24, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragleave() {
        p := VARIANT()
        result := ComCall(25, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondrop(v) {
        result := ComCall(26, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondrop() {
        p := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforecut(v) {
        result := ComCall(28, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforecut() {
        p := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncut(v) {
        result := ComCall(30, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncut() {
        p := VARIANT()
        result := ComCall(31, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforecopy(v) {
        result := ComCall(32, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforecopy() {
        p := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncopy(v) {
        result := ComCall(34, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncopy() {
        p := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforepaste(v) {
        result := ComCall(36, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforepaste() {
        p := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpaste(v) {
        result := ComCall(38, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpaste() {
        p := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLCurrentStyle} 
     */
    get_currentStyle() {
        result := ComCall(40, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLCurrentStyle(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpropertychange(v) {
        result := ComCall(41, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpropertychange() {
        p := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLRectCollection} 
     */
    getClientRects() {
        result := ComCall(43, this, "ptr*", &pRectCol := 0, "HRESULT")
        return IHTMLRectCollection(pRectCol)
    }

    /**
     * 
     * @returns {IHTMLRect} 
     */
    getBoundingClientRect() {
        result := ComCall(44, this, "ptr*", &pRect := 0, "HRESULT")
        return IHTMLRect(pRect)
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

        result := ComCall(45, this, BSTR, propname, BSTR, expression, BSTR, language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT} 
     */
    getExpression(propname) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        expression := VARIANT()
        result := ComCall(46, this, BSTR, propname, VARIANT.Ptr, expression, "HRESULT")
        return expression
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT_BOOL} 
     */
    removeExpression(propname) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(47, this, BSTR, propname, VARIANT_BOOL.Ptr, &pfSuccess := 0, "HRESULT")
        return pfSuccess
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
     * @returns {Integer} 
     */
    get_tabIndex() {
        result := ComCall(49, this, "short*", &p := 0, "HRESULT")
        return p
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

        result := ComCall(51, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accessKey() {
        p := BSTR.Owned()
        result := ComCall(52, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(53, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(54, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(55, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(56, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresize(v) {
        result := ComCall(57, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresize() {
        p := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, p, "HRESULT")
        return p
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
     * @returns {Integer} 
     */
    get_clientHeight() {
        result := ComCall(62, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientWidth() {
        result := ComCall(63, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientTop() {
        result := ComCall(64, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientLeft() {
        result := ComCall(65, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {VARIANT_BOOL} 
     */
    attachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(66, this, BSTR, event, "ptr", pDisp, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {HRESULT} 
     */
    detachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(67, this, BSTR, event, "ptr", pDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_readyState() {
        p := VARIANT()
        result := ComCall(68, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(69, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(70, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsdelete(v) {
        result := ComCall(71, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowsdelete() {
        p := VARIANT()
        result := ComCall(72, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsinserted(v) {
        result := ComCall(73, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowsinserted() {
        p := VARIANT()
        result := ComCall(74, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncellchange(v) {
        result := ComCall(75, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncellchange() {
        p := VARIANT()
        result := ComCall(76, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dir(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(77, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dir() {
        p := BSTR.Owned()
        result := ComCall(78, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createControlRange() {
        result := ComCall(79, this, "ptr*", &range := 0, "HRESULT")
        return IDispatch(range)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollHeight() {
        result := ComCall(80, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollWidth() {
        result := ComCall(81, this, "int*", &p := 0, "HRESULT")
        return p
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
     * @returns {Integer} 
     */
    get_scrollTop() {
        result := ComCall(83, this, "int*", &p := 0, "HRESULT")
        return p
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
     * @returns {Integer} 
     */
    get_scrollLeft() {
        result := ComCall(85, this, "int*", &p := 0, "HRESULT")
        return p
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
        result := ComCall(88, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncontextmenu() {
        p := VARIANT()
        result := ComCall(89, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {IHTMLElement} insertedElement 
     * @returns {IHTMLElement} 
     */
    insertAdjacentElement(where, insertedElement) {
        where := where is String ? BSTR.Alloc(where).Value : where

        result := ComCall(90, this, BSTR, where, "ptr", insertedElement, "ptr*", &inserted := 0, "HRESULT")
        return IHTMLElement(inserted)
    }

    /**
     * 
     * @param {IHTMLElement} apply 
     * @param {BSTR} where 
     * @returns {IHTMLElement} 
     */
    applyElement(apply, where) {
        where := where is String ? BSTR.Alloc(where).Value : where

        result := ComCall(91, this, "ptr", apply, BSTR, where, "ptr*", &applied := 0, "HRESULT")
        return IHTMLElement(applied)
    }

    /**
     * 
     * @param {BSTR} where 
     * @returns {BSTR} 
     */
    getAdjacentText(where) {
        where := where is String ? BSTR.Alloc(where).Value : where

        text := BSTR.Owned()
        result := ComCall(92, this, BSTR, where, BSTR.Ptr, text, "HRESULT")
        return text
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {BSTR} newText 
     * @returns {BSTR} 
     */
    replaceAdjacentText(where, newText) {
        where := where is String ? BSTR.Alloc(where).Value : where
        newText := newText is String ? BSTR.Alloc(newText).Value : newText

        oldText := BSTR.Owned()
        result := ComCall(93, this, BSTR, where, BSTR, newText, BSTR.Ptr, oldText, "HRESULT")
        return oldText
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_canHaveChildren() {
        result := ComCall(94, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<VARIANT>} pvarFactory 
     * @returns {Integer} 
     */
    addBehavior(bstrUrl, pvarFactory) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(95, this, BSTR, bstrUrl, VARIANT.Ptr, pvarFactory, "int*", &pCookie := 0, "HRESULT")
        return pCookie
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {VARIANT_BOOL} 
     */
    removeBehavior(cookie) {
        result := ComCall(96, this, "int", cookie, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @returns {IHTMLStyle} 
     */
    get_runtimeStyle() {
        result := ComCall(97, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyle(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_behaviorUrns() {
        result := ComCall(98, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_tagUrn(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(99, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagUrn() {
        p := BSTR.Owned()
        result := ComCall(100, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeeditfocus(v) {
        result := ComCall(101, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeeditfocus() {
        p := VARIANT()
        result := ComCall(102, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyStateValue() {
        result := ComCall(103, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByTagName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(104, this, BSTR, v, "ptr*", &pelColl := 0, "HRESULT")
        return IHTMLElementCollection(pelColl)
    }

    Query(iid) {
        if (IHTMLElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_scopeName := CallbackCreate(GetMethod(implObj, "get_scopeName"), flags, 2)
        this.vtbl.setCapture := CallbackCreate(GetMethod(implObj, "setCapture"), flags, 2)
        this.vtbl.releaseCapture := CallbackCreate(GetMethod(implObj, "releaseCapture"), flags, 1)
        this.vtbl.put_onlosecapture := CallbackCreate(GetMethod(implObj, "put_onlosecapture"), flags, 2)
        this.vtbl.get_onlosecapture := CallbackCreate(GetMethod(implObj, "get_onlosecapture"), flags, 2)
        this.vtbl.componentFromPoint := CallbackCreate(GetMethod(implObj, "componentFromPoint"), flags, 4)
        this.vtbl.doScroll := CallbackCreate(GetMethod(implObj, "doScroll"), flags, 2)
        this.vtbl.put_onscroll := CallbackCreate(GetMethod(implObj, "put_onscroll"), flags, 2)
        this.vtbl.get_onscroll := CallbackCreate(GetMethod(implObj, "get_onscroll"), flags, 2)
        this.vtbl.put_ondrag := CallbackCreate(GetMethod(implObj, "put_ondrag"), flags, 2)
        this.vtbl.get_ondrag := CallbackCreate(GetMethod(implObj, "get_ondrag"), flags, 2)
        this.vtbl.put_ondragend := CallbackCreate(GetMethod(implObj, "put_ondragend"), flags, 2)
        this.vtbl.get_ondragend := CallbackCreate(GetMethod(implObj, "get_ondragend"), flags, 2)
        this.vtbl.put_ondragenter := CallbackCreate(GetMethod(implObj, "put_ondragenter"), flags, 2)
        this.vtbl.get_ondragenter := CallbackCreate(GetMethod(implObj, "get_ondragenter"), flags, 2)
        this.vtbl.put_ondragover := CallbackCreate(GetMethod(implObj, "put_ondragover"), flags, 2)
        this.vtbl.get_ondragover := CallbackCreate(GetMethod(implObj, "get_ondragover"), flags, 2)
        this.vtbl.put_ondragleave := CallbackCreate(GetMethod(implObj, "put_ondragleave"), flags, 2)
        this.vtbl.get_ondragleave := CallbackCreate(GetMethod(implObj, "get_ondragleave"), flags, 2)
        this.vtbl.put_ondrop := CallbackCreate(GetMethod(implObj, "put_ondrop"), flags, 2)
        this.vtbl.get_ondrop := CallbackCreate(GetMethod(implObj, "get_ondrop"), flags, 2)
        this.vtbl.put_onbeforecut := CallbackCreate(GetMethod(implObj, "put_onbeforecut"), flags, 2)
        this.vtbl.get_onbeforecut := CallbackCreate(GetMethod(implObj, "get_onbeforecut"), flags, 2)
        this.vtbl.put_oncut := CallbackCreate(GetMethod(implObj, "put_oncut"), flags, 2)
        this.vtbl.get_oncut := CallbackCreate(GetMethod(implObj, "get_oncut"), flags, 2)
        this.vtbl.put_onbeforecopy := CallbackCreate(GetMethod(implObj, "put_onbeforecopy"), flags, 2)
        this.vtbl.get_onbeforecopy := CallbackCreate(GetMethod(implObj, "get_onbeforecopy"), flags, 2)
        this.vtbl.put_oncopy := CallbackCreate(GetMethod(implObj, "put_oncopy"), flags, 2)
        this.vtbl.get_oncopy := CallbackCreate(GetMethod(implObj, "get_oncopy"), flags, 2)
        this.vtbl.put_onbeforepaste := CallbackCreate(GetMethod(implObj, "put_onbeforepaste"), flags, 2)
        this.vtbl.get_onbeforepaste := CallbackCreate(GetMethod(implObj, "get_onbeforepaste"), flags, 2)
        this.vtbl.put_onpaste := CallbackCreate(GetMethod(implObj, "put_onpaste"), flags, 2)
        this.vtbl.get_onpaste := CallbackCreate(GetMethod(implObj, "get_onpaste"), flags, 2)
        this.vtbl.get_currentStyle := CallbackCreate(GetMethod(implObj, "get_currentStyle"), flags, 2)
        this.vtbl.put_onpropertychange := CallbackCreate(GetMethod(implObj, "put_onpropertychange"), flags, 2)
        this.vtbl.get_onpropertychange := CallbackCreate(GetMethod(implObj, "get_onpropertychange"), flags, 2)
        this.vtbl.getClientRects := CallbackCreate(GetMethod(implObj, "getClientRects"), flags, 2)
        this.vtbl.getBoundingClientRect := CallbackCreate(GetMethod(implObj, "getBoundingClientRect"), flags, 2)
        this.vtbl.setExpression := CallbackCreate(GetMethod(implObj, "setExpression"), flags, 4)
        this.vtbl.getExpression := CallbackCreate(GetMethod(implObj, "getExpression"), flags, 3)
        this.vtbl.removeExpression := CallbackCreate(GetMethod(implObj, "removeExpression"), flags, 3)
        this.vtbl.put_tabIndex := CallbackCreate(GetMethod(implObj, "put_tabIndex"), flags, 2)
        this.vtbl.get_tabIndex := CallbackCreate(GetMethod(implObj, "get_tabIndex"), flags, 2)
        this.vtbl.focus := CallbackCreate(GetMethod(implObj, "focus"), flags, 1)
        this.vtbl.put_accessKey := CallbackCreate(GetMethod(implObj, "put_accessKey"), flags, 2)
        this.vtbl.get_accessKey := CallbackCreate(GetMethod(implObj, "get_accessKey"), flags, 2)
        this.vtbl.put_onblur := CallbackCreate(GetMethod(implObj, "put_onblur"), flags, 2)
        this.vtbl.get_onblur := CallbackCreate(GetMethod(implObj, "get_onblur"), flags, 2)
        this.vtbl.put_onfocus := CallbackCreate(GetMethod(implObj, "put_onfocus"), flags, 2)
        this.vtbl.get_onfocus := CallbackCreate(GetMethod(implObj, "get_onfocus"), flags, 2)
        this.vtbl.put_onresize := CallbackCreate(GetMethod(implObj, "put_onresize"), flags, 2)
        this.vtbl.get_onresize := CallbackCreate(GetMethod(implObj, "get_onresize"), flags, 2)
        this.vtbl.blur := CallbackCreate(GetMethod(implObj, "blur"), flags, 1)
        this.vtbl.addFilter := CallbackCreate(GetMethod(implObj, "addFilter"), flags, 2)
        this.vtbl.removeFilter := CallbackCreate(GetMethod(implObj, "removeFilter"), flags, 2)
        this.vtbl.get_clientHeight := CallbackCreate(GetMethod(implObj, "get_clientHeight"), flags, 2)
        this.vtbl.get_clientWidth := CallbackCreate(GetMethod(implObj, "get_clientWidth"), flags, 2)
        this.vtbl.get_clientTop := CallbackCreate(GetMethod(implObj, "get_clientTop"), flags, 2)
        this.vtbl.get_clientLeft := CallbackCreate(GetMethod(implObj, "get_clientLeft"), flags, 2)
        this.vtbl.attachEvent := CallbackCreate(GetMethod(implObj, "attachEvent"), flags, 4)
        this.vtbl.detachEvent := CallbackCreate(GetMethod(implObj, "detachEvent"), flags, 3)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.get_onreadystatechange := CallbackCreate(GetMethod(implObj, "get_onreadystatechange"), flags, 2)
        this.vtbl.put_onrowsdelete := CallbackCreate(GetMethod(implObj, "put_onrowsdelete"), flags, 2)
        this.vtbl.get_onrowsdelete := CallbackCreate(GetMethod(implObj, "get_onrowsdelete"), flags, 2)
        this.vtbl.put_onrowsinserted := CallbackCreate(GetMethod(implObj, "put_onrowsinserted"), flags, 2)
        this.vtbl.get_onrowsinserted := CallbackCreate(GetMethod(implObj, "get_onrowsinserted"), flags, 2)
        this.vtbl.put_oncellchange := CallbackCreate(GetMethod(implObj, "put_oncellchange"), flags, 2)
        this.vtbl.get_oncellchange := CallbackCreate(GetMethod(implObj, "get_oncellchange"), flags, 2)
        this.vtbl.put_dir := CallbackCreate(GetMethod(implObj, "put_dir"), flags, 2)
        this.vtbl.get_dir := CallbackCreate(GetMethod(implObj, "get_dir"), flags, 2)
        this.vtbl.createControlRange := CallbackCreate(GetMethod(implObj, "createControlRange"), flags, 2)
        this.vtbl.get_scrollHeight := CallbackCreate(GetMethod(implObj, "get_scrollHeight"), flags, 2)
        this.vtbl.get_scrollWidth := CallbackCreate(GetMethod(implObj, "get_scrollWidth"), flags, 2)
        this.vtbl.put_scrollTop := CallbackCreate(GetMethod(implObj, "put_scrollTop"), flags, 2)
        this.vtbl.get_scrollTop := CallbackCreate(GetMethod(implObj, "get_scrollTop"), flags, 2)
        this.vtbl.put_scrollLeft := CallbackCreate(GetMethod(implObj, "put_scrollLeft"), flags, 2)
        this.vtbl.get_scrollLeft := CallbackCreate(GetMethod(implObj, "get_scrollLeft"), flags, 2)
        this.vtbl.clearAttributes := CallbackCreate(GetMethod(implObj, "clearAttributes"), flags, 1)
        this.vtbl.mergeAttributes := CallbackCreate(GetMethod(implObj, "mergeAttributes"), flags, 2)
        this.vtbl.put_oncontextmenu := CallbackCreate(GetMethod(implObj, "put_oncontextmenu"), flags, 2)
        this.vtbl.get_oncontextmenu := CallbackCreate(GetMethod(implObj, "get_oncontextmenu"), flags, 2)
        this.vtbl.insertAdjacentElement := CallbackCreate(GetMethod(implObj, "insertAdjacentElement"), flags, 4)
        this.vtbl.applyElement := CallbackCreate(GetMethod(implObj, "applyElement"), flags, 4)
        this.vtbl.getAdjacentText := CallbackCreate(GetMethod(implObj, "getAdjacentText"), flags, 3)
        this.vtbl.replaceAdjacentText := CallbackCreate(GetMethod(implObj, "replaceAdjacentText"), flags, 4)
        this.vtbl.get_canHaveChildren := CallbackCreate(GetMethod(implObj, "get_canHaveChildren"), flags, 2)
        this.vtbl.addBehavior := CallbackCreate(GetMethod(implObj, "addBehavior"), flags, 4)
        this.vtbl.removeBehavior := CallbackCreate(GetMethod(implObj, "removeBehavior"), flags, 3)
        this.vtbl.get_runtimeStyle := CallbackCreate(GetMethod(implObj, "get_runtimeStyle"), flags, 2)
        this.vtbl.get_behaviorUrns := CallbackCreate(GetMethod(implObj, "get_behaviorUrns"), flags, 2)
        this.vtbl.put_tagUrn := CallbackCreate(GetMethod(implObj, "put_tagUrn"), flags, 2)
        this.vtbl.get_tagUrn := CallbackCreate(GetMethod(implObj, "get_tagUrn"), flags, 2)
        this.vtbl.put_onbeforeeditfocus := CallbackCreate(GetMethod(implObj, "put_onbeforeeditfocus"), flags, 2)
        this.vtbl.get_onbeforeeditfocus := CallbackCreate(GetMethod(implObj, "get_onbeforeeditfocus"), flags, 2)
        this.vtbl.get_readyStateValue := CallbackCreate(GetMethod(implObj, "get_readyStateValue"), flags, 2)
        this.vtbl.getElementsByTagName := CallbackCreate(GetMethod(implObj, "getElementsByTagName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_scopeName)
        CallbackFree(this.vtbl.setCapture)
        CallbackFree(this.vtbl.releaseCapture)
        CallbackFree(this.vtbl.put_onlosecapture)
        CallbackFree(this.vtbl.get_onlosecapture)
        CallbackFree(this.vtbl.componentFromPoint)
        CallbackFree(this.vtbl.doScroll)
        CallbackFree(this.vtbl.put_onscroll)
        CallbackFree(this.vtbl.get_onscroll)
        CallbackFree(this.vtbl.put_ondrag)
        CallbackFree(this.vtbl.get_ondrag)
        CallbackFree(this.vtbl.put_ondragend)
        CallbackFree(this.vtbl.get_ondragend)
        CallbackFree(this.vtbl.put_ondragenter)
        CallbackFree(this.vtbl.get_ondragenter)
        CallbackFree(this.vtbl.put_ondragover)
        CallbackFree(this.vtbl.get_ondragover)
        CallbackFree(this.vtbl.put_ondragleave)
        CallbackFree(this.vtbl.get_ondragleave)
        CallbackFree(this.vtbl.put_ondrop)
        CallbackFree(this.vtbl.get_ondrop)
        CallbackFree(this.vtbl.put_onbeforecut)
        CallbackFree(this.vtbl.get_onbeforecut)
        CallbackFree(this.vtbl.put_oncut)
        CallbackFree(this.vtbl.get_oncut)
        CallbackFree(this.vtbl.put_onbeforecopy)
        CallbackFree(this.vtbl.get_onbeforecopy)
        CallbackFree(this.vtbl.put_oncopy)
        CallbackFree(this.vtbl.get_oncopy)
        CallbackFree(this.vtbl.put_onbeforepaste)
        CallbackFree(this.vtbl.get_onbeforepaste)
        CallbackFree(this.vtbl.put_onpaste)
        CallbackFree(this.vtbl.get_onpaste)
        CallbackFree(this.vtbl.get_currentStyle)
        CallbackFree(this.vtbl.put_onpropertychange)
        CallbackFree(this.vtbl.get_onpropertychange)
        CallbackFree(this.vtbl.getClientRects)
        CallbackFree(this.vtbl.getBoundingClientRect)
        CallbackFree(this.vtbl.setExpression)
        CallbackFree(this.vtbl.getExpression)
        CallbackFree(this.vtbl.removeExpression)
        CallbackFree(this.vtbl.put_tabIndex)
        CallbackFree(this.vtbl.get_tabIndex)
        CallbackFree(this.vtbl.focus)
        CallbackFree(this.vtbl.put_accessKey)
        CallbackFree(this.vtbl.get_accessKey)
        CallbackFree(this.vtbl.put_onblur)
        CallbackFree(this.vtbl.get_onblur)
        CallbackFree(this.vtbl.put_onfocus)
        CallbackFree(this.vtbl.get_onfocus)
        CallbackFree(this.vtbl.put_onresize)
        CallbackFree(this.vtbl.get_onresize)
        CallbackFree(this.vtbl.blur)
        CallbackFree(this.vtbl.addFilter)
        CallbackFree(this.vtbl.removeFilter)
        CallbackFree(this.vtbl.get_clientHeight)
        CallbackFree(this.vtbl.get_clientWidth)
        CallbackFree(this.vtbl.get_clientTop)
        CallbackFree(this.vtbl.get_clientLeft)
        CallbackFree(this.vtbl.attachEvent)
        CallbackFree(this.vtbl.detachEvent)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.get_onreadystatechange)
        CallbackFree(this.vtbl.put_onrowsdelete)
        CallbackFree(this.vtbl.get_onrowsdelete)
        CallbackFree(this.vtbl.put_onrowsinserted)
        CallbackFree(this.vtbl.get_onrowsinserted)
        CallbackFree(this.vtbl.put_oncellchange)
        CallbackFree(this.vtbl.get_oncellchange)
        CallbackFree(this.vtbl.put_dir)
        CallbackFree(this.vtbl.get_dir)
        CallbackFree(this.vtbl.createControlRange)
        CallbackFree(this.vtbl.get_scrollHeight)
        CallbackFree(this.vtbl.get_scrollWidth)
        CallbackFree(this.vtbl.put_scrollTop)
        CallbackFree(this.vtbl.get_scrollTop)
        CallbackFree(this.vtbl.put_scrollLeft)
        CallbackFree(this.vtbl.get_scrollLeft)
        CallbackFree(this.vtbl.clearAttributes)
        CallbackFree(this.vtbl.mergeAttributes)
        CallbackFree(this.vtbl.put_oncontextmenu)
        CallbackFree(this.vtbl.get_oncontextmenu)
        CallbackFree(this.vtbl.insertAdjacentElement)
        CallbackFree(this.vtbl.applyElement)
        CallbackFree(this.vtbl.getAdjacentText)
        CallbackFree(this.vtbl.replaceAdjacentText)
        CallbackFree(this.vtbl.get_canHaveChildren)
        CallbackFree(this.vtbl.addBehavior)
        CallbackFree(this.vtbl.removeBehavior)
        CallbackFree(this.vtbl.get_runtimeStyle)
        CallbackFree(this.vtbl.get_behaviorUrns)
        CallbackFree(this.vtbl.put_tagUrn)
        CallbackFree(this.vtbl.get_tagUrn)
        CallbackFree(this.vtbl.put_onbeforeeditfocus)
        CallbackFree(this.vtbl.get_onbeforeeditfocus)
        CallbackFree(this.vtbl.get_readyStateValue)
        CallbackFree(this.vtbl.getElementsByTagName)
    }
}
