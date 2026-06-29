#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocument3 extends IDispatch {
    /**
     * The interface identifier for IHTMLDocument3
     * @type {Guid}
     */
    static IID := Guid("{3050f485-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocument3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        releaseCapture         : IntPtr
        recalc                 : IntPtr
        createTextNode         : IntPtr
        get_documentElement    : IntPtr
        get_uniqueID           : IntPtr
        attachEvent            : IntPtr
        detachEvent            : IntPtr
        put_onrowsdelete       : IntPtr
        get_onrowsdelete       : IntPtr
        put_onrowsinserted     : IntPtr
        get_onrowsinserted     : IntPtr
        put_oncellchange       : IntPtr
        get_oncellchange       : IntPtr
        put_ondatasetchanged   : IntPtr
        get_ondatasetchanged   : IntPtr
        put_ondataavailable    : IntPtr
        get_ondataavailable    : IntPtr
        put_ondatasetcomplete  : IntPtr
        get_ondatasetcomplete  : IntPtr
        put_onpropertychange   : IntPtr
        get_onpropertychange   : IntPtr
        put_dir                : IntPtr
        get_dir                : IntPtr
        put_oncontextmenu      : IntPtr
        get_oncontextmenu      : IntPtr
        put_onstop             : IntPtr
        get_onstop             : IntPtr
        createDocumentFragment : IntPtr
        get_parentDocument     : IntPtr
        put_enableDownload     : IntPtr
        get_enableDownload     : IntPtr
        put_baseUrl            : IntPtr
        get_baseUrl            : IntPtr
        get_childNodes         : IntPtr
        put_inheritStyleSheets : IntPtr
        get_inheritStyleSheets : IntPtr
        put_onbeforeeditfocus  : IntPtr
        get_onbeforeeditfocus  : IntPtr
        getElementsByName      : IntPtr
        getElementById         : IntPtr
        getElementsByTagName   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocument3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLElement} 
     */
    documentElement {
        get => this.get_documentElement()
    }

    /**
     * @type {BSTR} 
     */
    uniqueID {
        get => this.get_uniqueID()
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
     * @type {VARIANT} 
     */
    ondatasetchanged {
        get => this.get_ondatasetchanged()
        set => this.put_ondatasetchanged(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondataavailable {
        get => this.get_ondataavailable()
        set => this.put_ondataavailable(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondatasetcomplete {
        get => this.get_ondatasetcomplete()
        set => this.put_ondatasetcomplete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onpropertychange {
        get => this.get_onpropertychange()
        set => this.put_onpropertychange(value)
    }

    /**
     * @type {BSTR} 
     */
    dir {
        get => this.get_dir()
        set => this.put_dir(value)
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
    onstop {
        get => this.get_onstop()
        set => this.put_onstop(value)
    }

    /**
     * @type {IHTMLDocument2} 
     */
    parentDocument {
        get => this.get_parentDocument()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enableDownload {
        get => this.get_enableDownload()
        set => this.put_enableDownload(value)
    }

    /**
     * @type {BSTR} 
     */
    baseUrl {
        get => this.get_baseUrl()
        set => this.put_baseUrl(value)
    }

    /**
     * @type {IDispatch} 
     */
    childNodes {
        get => this.get_childNodes()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    inheritStyleSheets {
        get => this.get_inheritStyleSheets()
        set => this.put_inheritStyleSheets(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeeditfocus {
        get => this.get_onbeforeeditfocus()
        set => this.put_onbeforeeditfocus(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    releaseCapture() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fForce 
     * @returns {HRESULT} 
     */
    recalc(fForce) {
        result := ComCall(8, this, VARIANT_BOOL, fForce, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {IHTMLDOMNode} 
     */
    createTextNode(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(9, this, BSTR, text, "ptr*", &newTextNode := 0, "HRESULT")
        return IHTMLDOMNode(newTextNode)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_documentElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_uniqueID() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(12, this, BSTR, event, "ptr", pDisp, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
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

        result := ComCall(13, this, BSTR, event, "ptr", pDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsdelete(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowsdelete() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsinserted(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowsinserted() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncellchange(v) {
        result := ComCall(18, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncellchange() {
        p := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondatasetchanged(v) {
        result := ComCall(20, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetchanged() {
        p := VARIANT()
        result := ComCall(21, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondataavailable(v) {
        result := ComCall(22, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondataavailable() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondatasetcomplete(v) {
        result := ComCall(24, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetcomplete() {
        p := VARIANT()
        result := ComCall(25, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpropertychange(v) {
        result := ComCall(26, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpropertychange() {
        p := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dir(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dir() {
        p := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, p, "HRESULT")
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
    put_onstop(v) {
        result := ComCall(32, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstop() {
        p := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    createDocumentFragment() {
        result := ComCall(34, this, "ptr*", &pNewDoc := 0, "HRESULT")
        return IHTMLDocument2(pNewDoc)
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    get_parentDocument() {
        result := ComCall(35, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument2(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_enableDownload(v) {
        result := ComCall(36, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_enableDownload() {
        result := ComCall(37, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_baseUrl(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(38, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_baseUrl() {
        p := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_childNodes() {
        result := ComCall(40, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_inheritStyleSheets(v) {
        result := ComCall(41, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_inheritStyleSheets() {
        result := ComCall(42, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeeditfocus(v) {
        result := ComCall(43, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeeditfocus() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, BSTR, v, "ptr*", &pelColl := 0, "HRESULT")
        return IHTMLElementCollection(pelColl)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElement} 
     */
    getElementById(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(46, this, BSTR, v, "ptr*", &pel := 0, "HRESULT")
        return IHTMLElement(pel)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByTagName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, BSTR, v, "ptr*", &pelColl := 0, "HRESULT")
        return IHTMLElementCollection(pelColl)
    }

    Query(iid) {
        if (IHTMLDocument3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.releaseCapture := CallbackCreate(GetMethod(implObj, "releaseCapture"), flags, 1)
        this.vtbl.recalc := CallbackCreate(GetMethod(implObj, "recalc"), flags, 2)
        this.vtbl.createTextNode := CallbackCreate(GetMethod(implObj, "createTextNode"), flags, 3)
        this.vtbl.get_documentElement := CallbackCreate(GetMethod(implObj, "get_documentElement"), flags, 2)
        this.vtbl.get_uniqueID := CallbackCreate(GetMethod(implObj, "get_uniqueID"), flags, 2)
        this.vtbl.attachEvent := CallbackCreate(GetMethod(implObj, "attachEvent"), flags, 4)
        this.vtbl.detachEvent := CallbackCreate(GetMethod(implObj, "detachEvent"), flags, 3)
        this.vtbl.put_onrowsdelete := CallbackCreate(GetMethod(implObj, "put_onrowsdelete"), flags, 2)
        this.vtbl.get_onrowsdelete := CallbackCreate(GetMethod(implObj, "get_onrowsdelete"), flags, 2)
        this.vtbl.put_onrowsinserted := CallbackCreate(GetMethod(implObj, "put_onrowsinserted"), flags, 2)
        this.vtbl.get_onrowsinserted := CallbackCreate(GetMethod(implObj, "get_onrowsinserted"), flags, 2)
        this.vtbl.put_oncellchange := CallbackCreate(GetMethod(implObj, "put_oncellchange"), flags, 2)
        this.vtbl.get_oncellchange := CallbackCreate(GetMethod(implObj, "get_oncellchange"), flags, 2)
        this.vtbl.put_ondatasetchanged := CallbackCreate(GetMethod(implObj, "put_ondatasetchanged"), flags, 2)
        this.vtbl.get_ondatasetchanged := CallbackCreate(GetMethod(implObj, "get_ondatasetchanged"), flags, 2)
        this.vtbl.put_ondataavailable := CallbackCreate(GetMethod(implObj, "put_ondataavailable"), flags, 2)
        this.vtbl.get_ondataavailable := CallbackCreate(GetMethod(implObj, "get_ondataavailable"), flags, 2)
        this.vtbl.put_ondatasetcomplete := CallbackCreate(GetMethod(implObj, "put_ondatasetcomplete"), flags, 2)
        this.vtbl.get_ondatasetcomplete := CallbackCreate(GetMethod(implObj, "get_ondatasetcomplete"), flags, 2)
        this.vtbl.put_onpropertychange := CallbackCreate(GetMethod(implObj, "put_onpropertychange"), flags, 2)
        this.vtbl.get_onpropertychange := CallbackCreate(GetMethod(implObj, "get_onpropertychange"), flags, 2)
        this.vtbl.put_dir := CallbackCreate(GetMethod(implObj, "put_dir"), flags, 2)
        this.vtbl.get_dir := CallbackCreate(GetMethod(implObj, "get_dir"), flags, 2)
        this.vtbl.put_oncontextmenu := CallbackCreate(GetMethod(implObj, "put_oncontextmenu"), flags, 2)
        this.vtbl.get_oncontextmenu := CallbackCreate(GetMethod(implObj, "get_oncontextmenu"), flags, 2)
        this.vtbl.put_onstop := CallbackCreate(GetMethod(implObj, "put_onstop"), flags, 2)
        this.vtbl.get_onstop := CallbackCreate(GetMethod(implObj, "get_onstop"), flags, 2)
        this.vtbl.createDocumentFragment := CallbackCreate(GetMethod(implObj, "createDocumentFragment"), flags, 2)
        this.vtbl.get_parentDocument := CallbackCreate(GetMethod(implObj, "get_parentDocument"), flags, 2)
        this.vtbl.put_enableDownload := CallbackCreate(GetMethod(implObj, "put_enableDownload"), flags, 2)
        this.vtbl.get_enableDownload := CallbackCreate(GetMethod(implObj, "get_enableDownload"), flags, 2)
        this.vtbl.put_baseUrl := CallbackCreate(GetMethod(implObj, "put_baseUrl"), flags, 2)
        this.vtbl.get_baseUrl := CallbackCreate(GetMethod(implObj, "get_baseUrl"), flags, 2)
        this.vtbl.get_childNodes := CallbackCreate(GetMethod(implObj, "get_childNodes"), flags, 2)
        this.vtbl.put_inheritStyleSheets := CallbackCreate(GetMethod(implObj, "put_inheritStyleSheets"), flags, 2)
        this.vtbl.get_inheritStyleSheets := CallbackCreate(GetMethod(implObj, "get_inheritStyleSheets"), flags, 2)
        this.vtbl.put_onbeforeeditfocus := CallbackCreate(GetMethod(implObj, "put_onbeforeeditfocus"), flags, 2)
        this.vtbl.get_onbeforeeditfocus := CallbackCreate(GetMethod(implObj, "get_onbeforeeditfocus"), flags, 2)
        this.vtbl.getElementsByName := CallbackCreate(GetMethod(implObj, "getElementsByName"), flags, 3)
        this.vtbl.getElementById := CallbackCreate(GetMethod(implObj, "getElementById"), flags, 3)
        this.vtbl.getElementsByTagName := CallbackCreate(GetMethod(implObj, "getElementsByTagName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.releaseCapture)
        CallbackFree(this.vtbl.recalc)
        CallbackFree(this.vtbl.createTextNode)
        CallbackFree(this.vtbl.get_documentElement)
        CallbackFree(this.vtbl.get_uniqueID)
        CallbackFree(this.vtbl.attachEvent)
        CallbackFree(this.vtbl.detachEvent)
        CallbackFree(this.vtbl.put_onrowsdelete)
        CallbackFree(this.vtbl.get_onrowsdelete)
        CallbackFree(this.vtbl.put_onrowsinserted)
        CallbackFree(this.vtbl.get_onrowsinserted)
        CallbackFree(this.vtbl.put_oncellchange)
        CallbackFree(this.vtbl.get_oncellchange)
        CallbackFree(this.vtbl.put_ondatasetchanged)
        CallbackFree(this.vtbl.get_ondatasetchanged)
        CallbackFree(this.vtbl.put_ondataavailable)
        CallbackFree(this.vtbl.get_ondataavailable)
        CallbackFree(this.vtbl.put_ondatasetcomplete)
        CallbackFree(this.vtbl.get_ondatasetcomplete)
        CallbackFree(this.vtbl.put_onpropertychange)
        CallbackFree(this.vtbl.get_onpropertychange)
        CallbackFree(this.vtbl.put_dir)
        CallbackFree(this.vtbl.get_dir)
        CallbackFree(this.vtbl.put_oncontextmenu)
        CallbackFree(this.vtbl.get_oncontextmenu)
        CallbackFree(this.vtbl.put_onstop)
        CallbackFree(this.vtbl.get_onstop)
        CallbackFree(this.vtbl.createDocumentFragment)
        CallbackFree(this.vtbl.get_parentDocument)
        CallbackFree(this.vtbl.put_enableDownload)
        CallbackFree(this.vtbl.get_enableDownload)
        CallbackFree(this.vtbl.put_baseUrl)
        CallbackFree(this.vtbl.get_baseUrl)
        CallbackFree(this.vtbl.get_childNodes)
        CallbackFree(this.vtbl.put_inheritStyleSheets)
        CallbackFree(this.vtbl.get_inheritStyleSheets)
        CallbackFree(this.vtbl.put_onbeforeeditfocus)
        CallbackFree(this.vtbl.get_onbeforeeditfocus)
        CallbackFree(this.vtbl.getElementsByName)
        CallbackFree(this.vtbl.getElementById)
        CallbackFree(this.vtbl.getElementsByTagName)
    }
}
