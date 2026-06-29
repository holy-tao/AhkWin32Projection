#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement7 extends IDispatch {
    /**
     * The interface identifier for IHTMLElement7
     * @type {Guid}
     */
    static IID := Guid("{305107aa-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement7 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onmspointerdown              : IntPtr
        get_onmspointerdown              : IntPtr
        put_onmspointermove              : IntPtr
        get_onmspointermove              : IntPtr
        put_onmspointerup                : IntPtr
        get_onmspointerup                : IntPtr
        put_onmspointerover              : IntPtr
        get_onmspointerover              : IntPtr
        put_onmspointerout               : IntPtr
        get_onmspointerout               : IntPtr
        put_onmspointercancel            : IntPtr
        get_onmspointercancel            : IntPtr
        put_onmspointerhover             : IntPtr
        get_onmspointerhover             : IntPtr
        put_onmslostpointercapture       : IntPtr
        get_onmslostpointercapture       : IntPtr
        put_onmsgotpointercapture        : IntPtr
        get_onmsgotpointercapture        : IntPtr
        put_onmsgesturestart             : IntPtr
        get_onmsgesturestart             : IntPtr
        put_onmsgesturechange            : IntPtr
        get_onmsgesturechange            : IntPtr
        put_onmsgestureend               : IntPtr
        get_onmsgestureend               : IntPtr
        put_onmsgesturehold              : IntPtr
        get_onmsgesturehold              : IntPtr
        put_onmsgesturetap               : IntPtr
        get_onmsgesturetap               : IntPtr
        put_onmsgesturedoubletap         : IntPtr
        get_onmsgesturedoubletap         : IntPtr
        put_onmsinertiastart             : IntPtr
        get_onmsinertiastart             : IntPtr
        msSetPointerCapture              : IntPtr
        msReleasePointerCapture          : IntPtr
        put_onmstransitionstart          : IntPtr
        get_onmstransitionstart          : IntPtr
        put_onmstransitionend            : IntPtr
        get_onmstransitionend            : IntPtr
        put_onmsanimationstart           : IntPtr
        get_onmsanimationstart           : IntPtr
        put_onmsanimationend             : IntPtr
        get_onmsanimationend             : IntPtr
        put_onmsanimationiteration       : IntPtr
        get_onmsanimationiteration       : IntPtr
        put_oninvalid                    : IntPtr
        get_oninvalid                    : IntPtr
        put_xmsAcceleratorKey            : IntPtr
        get_xmsAcceleratorKey            : IntPtr
        put_spellcheck                   : IntPtr
        get_spellcheck                   : IntPtr
        put_onmsmanipulationstatechanged : IntPtr
        get_onmsmanipulationstatechanged : IntPtr
        put_oncuechange                  : IntPtr
        get_oncuechange                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointerdown {
        get => this.get_onmspointerdown()
        set => this.put_onmspointerdown(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointermove {
        get => this.get_onmspointermove()
        set => this.put_onmspointermove(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointerup {
        get => this.get_onmspointerup()
        set => this.put_onmspointerup(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointerover {
        get => this.get_onmspointerover()
        set => this.put_onmspointerover(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointerout {
        get => this.get_onmspointerout()
        set => this.put_onmspointerout(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointercancel {
        get => this.get_onmspointercancel()
        set => this.put_onmspointercancel(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmspointerhover {
        get => this.get_onmspointerhover()
        set => this.put_onmspointerhover(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmslostpointercapture {
        get => this.get_onmslostpointercapture()
        set => this.put_onmslostpointercapture(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgotpointercapture {
        get => this.get_onmsgotpointercapture()
        set => this.put_onmsgotpointercapture(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgesturestart {
        get => this.get_onmsgesturestart()
        set => this.put_onmsgesturestart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgesturechange {
        get => this.get_onmsgesturechange()
        set => this.put_onmsgesturechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgestureend {
        get => this.get_onmsgestureend()
        set => this.put_onmsgestureend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgesturehold {
        get => this.get_onmsgesturehold()
        set => this.put_onmsgesturehold(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgesturetap {
        get => this.get_onmsgesturetap()
        set => this.put_onmsgesturetap(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsgesturedoubletap {
        get => this.get_onmsgesturedoubletap()
        set => this.put_onmsgesturedoubletap(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsinertiastart {
        get => this.get_onmsinertiastart()
        set => this.put_onmsinertiastart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmstransitionstart {
        get => this.get_onmstransitionstart()
        set => this.put_onmstransitionstart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmstransitionend {
        get => this.get_onmstransitionend()
        set => this.put_onmstransitionend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsanimationstart {
        get => this.get_onmsanimationstart()
        set => this.put_onmsanimationstart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsanimationend {
        get => this.get_onmsanimationend()
        set => this.put_onmsanimationend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsanimationiteration {
        get => this.get_onmsanimationiteration()
        set => this.put_onmsanimationiteration(value)
    }

    /**
     * @type {VARIANT} 
     */
    oninvalid {
        get => this.get_oninvalid()
        set => this.put_oninvalid(value)
    }

    /**
     * @type {BSTR} 
     */
    xmsAcceleratorKey {
        get => this.get_xmsAcceleratorKey()
        set => this.put_xmsAcceleratorKey(value)
    }

    /**
     * @type {VARIANT} 
     */
    spellcheck {
        get => this.get_spellcheck()
        set => this.put_spellcheck(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmsmanipulationstatechanged {
        get => this.get_onmsmanipulationstatechanged()
        set => this.put_onmsmanipulationstatechanged(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncuechange {
        get => this.get_oncuechange()
        set => this.put_oncuechange(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerdown(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerdown() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointermove(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointermove() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerup(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerup() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerover(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerover() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerout(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerout() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointercancel(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointercancel() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerhover(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerhover() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmslostpointercapture(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmslostpointercapture() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgotpointercapture(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgotpointercapture() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturestart(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturestart() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturechange(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturechange() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgestureend(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgestureend() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturehold(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturehold() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturetap(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturetap() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturedoubletap(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturedoubletap() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsinertiastart(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsinertiastart() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    msSetPointerCapture(pointerId) {
        result := ComCall(39, this, "int", pointerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    msReleasePointerCapture(pointerId) {
        result := ComCall(40, this, "int", pointerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmstransitionstart(v) {
        result := ComCall(41, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmstransitionstart() {
        p := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmstransitionend(v) {
        result := ComCall(43, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmstransitionend() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsanimationstart(v) {
        result := ComCall(45, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsanimationstart() {
        p := VARIANT()
        result := ComCall(46, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsanimationend(v) {
        result := ComCall(47, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsanimationend() {
        p := VARIANT()
        result := ComCall(48, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsanimationiteration(v) {
        result := ComCall(49, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsanimationiteration() {
        p := VARIANT()
        result := ComCall(50, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninvalid(v) {
        result := ComCall(51, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninvalid() {
        p := VARIANT()
        result := ComCall(52, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmsAcceleratorKey(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmsAcceleratorKey() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_spellcheck(v) {
        result := ComCall(55, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_spellcheck() {
        p := VARIANT()
        result := ComCall(56, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsmanipulationstatechanged(v) {
        result := ComCall(57, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsmanipulationstatechanged() {
        p := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncuechange(v) {
        result := ComCall(59, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncuechange() {
        p := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLElement7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_onmspointerdown := CallbackCreate(GetMethod(implObj, "put_onmspointerdown"), flags, 2)
        this.vtbl.get_onmspointerdown := CallbackCreate(GetMethod(implObj, "get_onmspointerdown"), flags, 2)
        this.vtbl.put_onmspointermove := CallbackCreate(GetMethod(implObj, "put_onmspointermove"), flags, 2)
        this.vtbl.get_onmspointermove := CallbackCreate(GetMethod(implObj, "get_onmspointermove"), flags, 2)
        this.vtbl.put_onmspointerup := CallbackCreate(GetMethod(implObj, "put_onmspointerup"), flags, 2)
        this.vtbl.get_onmspointerup := CallbackCreate(GetMethod(implObj, "get_onmspointerup"), flags, 2)
        this.vtbl.put_onmspointerover := CallbackCreate(GetMethod(implObj, "put_onmspointerover"), flags, 2)
        this.vtbl.get_onmspointerover := CallbackCreate(GetMethod(implObj, "get_onmspointerover"), flags, 2)
        this.vtbl.put_onmspointerout := CallbackCreate(GetMethod(implObj, "put_onmspointerout"), flags, 2)
        this.vtbl.get_onmspointerout := CallbackCreate(GetMethod(implObj, "get_onmspointerout"), flags, 2)
        this.vtbl.put_onmspointercancel := CallbackCreate(GetMethod(implObj, "put_onmspointercancel"), flags, 2)
        this.vtbl.get_onmspointercancel := CallbackCreate(GetMethod(implObj, "get_onmspointercancel"), flags, 2)
        this.vtbl.put_onmspointerhover := CallbackCreate(GetMethod(implObj, "put_onmspointerhover"), flags, 2)
        this.vtbl.get_onmspointerhover := CallbackCreate(GetMethod(implObj, "get_onmspointerhover"), flags, 2)
        this.vtbl.put_onmslostpointercapture := CallbackCreate(GetMethod(implObj, "put_onmslostpointercapture"), flags, 2)
        this.vtbl.get_onmslostpointercapture := CallbackCreate(GetMethod(implObj, "get_onmslostpointercapture"), flags, 2)
        this.vtbl.put_onmsgotpointercapture := CallbackCreate(GetMethod(implObj, "put_onmsgotpointercapture"), flags, 2)
        this.vtbl.get_onmsgotpointercapture := CallbackCreate(GetMethod(implObj, "get_onmsgotpointercapture"), flags, 2)
        this.vtbl.put_onmsgesturestart := CallbackCreate(GetMethod(implObj, "put_onmsgesturestart"), flags, 2)
        this.vtbl.get_onmsgesturestart := CallbackCreate(GetMethod(implObj, "get_onmsgesturestart"), flags, 2)
        this.vtbl.put_onmsgesturechange := CallbackCreate(GetMethod(implObj, "put_onmsgesturechange"), flags, 2)
        this.vtbl.get_onmsgesturechange := CallbackCreate(GetMethod(implObj, "get_onmsgesturechange"), flags, 2)
        this.vtbl.put_onmsgestureend := CallbackCreate(GetMethod(implObj, "put_onmsgestureend"), flags, 2)
        this.vtbl.get_onmsgestureend := CallbackCreate(GetMethod(implObj, "get_onmsgestureend"), flags, 2)
        this.vtbl.put_onmsgesturehold := CallbackCreate(GetMethod(implObj, "put_onmsgesturehold"), flags, 2)
        this.vtbl.get_onmsgesturehold := CallbackCreate(GetMethod(implObj, "get_onmsgesturehold"), flags, 2)
        this.vtbl.put_onmsgesturetap := CallbackCreate(GetMethod(implObj, "put_onmsgesturetap"), flags, 2)
        this.vtbl.get_onmsgesturetap := CallbackCreate(GetMethod(implObj, "get_onmsgesturetap"), flags, 2)
        this.vtbl.put_onmsgesturedoubletap := CallbackCreate(GetMethod(implObj, "put_onmsgesturedoubletap"), flags, 2)
        this.vtbl.get_onmsgesturedoubletap := CallbackCreate(GetMethod(implObj, "get_onmsgesturedoubletap"), flags, 2)
        this.vtbl.put_onmsinertiastart := CallbackCreate(GetMethod(implObj, "put_onmsinertiastart"), flags, 2)
        this.vtbl.get_onmsinertiastart := CallbackCreate(GetMethod(implObj, "get_onmsinertiastart"), flags, 2)
        this.vtbl.msSetPointerCapture := CallbackCreate(GetMethod(implObj, "msSetPointerCapture"), flags, 2)
        this.vtbl.msReleasePointerCapture := CallbackCreate(GetMethod(implObj, "msReleasePointerCapture"), flags, 2)
        this.vtbl.put_onmstransitionstart := CallbackCreate(GetMethod(implObj, "put_onmstransitionstart"), flags, 2)
        this.vtbl.get_onmstransitionstart := CallbackCreate(GetMethod(implObj, "get_onmstransitionstart"), flags, 2)
        this.vtbl.put_onmstransitionend := CallbackCreate(GetMethod(implObj, "put_onmstransitionend"), flags, 2)
        this.vtbl.get_onmstransitionend := CallbackCreate(GetMethod(implObj, "get_onmstransitionend"), flags, 2)
        this.vtbl.put_onmsanimationstart := CallbackCreate(GetMethod(implObj, "put_onmsanimationstart"), flags, 2)
        this.vtbl.get_onmsanimationstart := CallbackCreate(GetMethod(implObj, "get_onmsanimationstart"), flags, 2)
        this.vtbl.put_onmsanimationend := CallbackCreate(GetMethod(implObj, "put_onmsanimationend"), flags, 2)
        this.vtbl.get_onmsanimationend := CallbackCreate(GetMethod(implObj, "get_onmsanimationend"), flags, 2)
        this.vtbl.put_onmsanimationiteration := CallbackCreate(GetMethod(implObj, "put_onmsanimationiteration"), flags, 2)
        this.vtbl.get_onmsanimationiteration := CallbackCreate(GetMethod(implObj, "get_onmsanimationiteration"), flags, 2)
        this.vtbl.put_oninvalid := CallbackCreate(GetMethod(implObj, "put_oninvalid"), flags, 2)
        this.vtbl.get_oninvalid := CallbackCreate(GetMethod(implObj, "get_oninvalid"), flags, 2)
        this.vtbl.put_xmsAcceleratorKey := CallbackCreate(GetMethod(implObj, "put_xmsAcceleratorKey"), flags, 2)
        this.vtbl.get_xmsAcceleratorKey := CallbackCreate(GetMethod(implObj, "get_xmsAcceleratorKey"), flags, 2)
        this.vtbl.put_spellcheck := CallbackCreate(GetMethod(implObj, "put_spellcheck"), flags, 2)
        this.vtbl.get_spellcheck := CallbackCreate(GetMethod(implObj, "get_spellcheck"), flags, 2)
        this.vtbl.put_onmsmanipulationstatechanged := CallbackCreate(GetMethod(implObj, "put_onmsmanipulationstatechanged"), flags, 2)
        this.vtbl.get_onmsmanipulationstatechanged := CallbackCreate(GetMethod(implObj, "get_onmsmanipulationstatechanged"), flags, 2)
        this.vtbl.put_oncuechange := CallbackCreate(GetMethod(implObj, "put_oncuechange"), flags, 2)
        this.vtbl.get_oncuechange := CallbackCreate(GetMethod(implObj, "get_oncuechange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_onmspointerdown)
        CallbackFree(this.vtbl.get_onmspointerdown)
        CallbackFree(this.vtbl.put_onmspointermove)
        CallbackFree(this.vtbl.get_onmspointermove)
        CallbackFree(this.vtbl.put_onmspointerup)
        CallbackFree(this.vtbl.get_onmspointerup)
        CallbackFree(this.vtbl.put_onmspointerover)
        CallbackFree(this.vtbl.get_onmspointerover)
        CallbackFree(this.vtbl.put_onmspointerout)
        CallbackFree(this.vtbl.get_onmspointerout)
        CallbackFree(this.vtbl.put_onmspointercancel)
        CallbackFree(this.vtbl.get_onmspointercancel)
        CallbackFree(this.vtbl.put_onmspointerhover)
        CallbackFree(this.vtbl.get_onmspointerhover)
        CallbackFree(this.vtbl.put_onmslostpointercapture)
        CallbackFree(this.vtbl.get_onmslostpointercapture)
        CallbackFree(this.vtbl.put_onmsgotpointercapture)
        CallbackFree(this.vtbl.get_onmsgotpointercapture)
        CallbackFree(this.vtbl.put_onmsgesturestart)
        CallbackFree(this.vtbl.get_onmsgesturestart)
        CallbackFree(this.vtbl.put_onmsgesturechange)
        CallbackFree(this.vtbl.get_onmsgesturechange)
        CallbackFree(this.vtbl.put_onmsgestureend)
        CallbackFree(this.vtbl.get_onmsgestureend)
        CallbackFree(this.vtbl.put_onmsgesturehold)
        CallbackFree(this.vtbl.get_onmsgesturehold)
        CallbackFree(this.vtbl.put_onmsgesturetap)
        CallbackFree(this.vtbl.get_onmsgesturetap)
        CallbackFree(this.vtbl.put_onmsgesturedoubletap)
        CallbackFree(this.vtbl.get_onmsgesturedoubletap)
        CallbackFree(this.vtbl.put_onmsinertiastart)
        CallbackFree(this.vtbl.get_onmsinertiastart)
        CallbackFree(this.vtbl.msSetPointerCapture)
        CallbackFree(this.vtbl.msReleasePointerCapture)
        CallbackFree(this.vtbl.put_onmstransitionstart)
        CallbackFree(this.vtbl.get_onmstransitionstart)
        CallbackFree(this.vtbl.put_onmstransitionend)
        CallbackFree(this.vtbl.get_onmstransitionend)
        CallbackFree(this.vtbl.put_onmsanimationstart)
        CallbackFree(this.vtbl.get_onmsanimationstart)
        CallbackFree(this.vtbl.put_onmsanimationend)
        CallbackFree(this.vtbl.get_onmsanimationend)
        CallbackFree(this.vtbl.put_onmsanimationiteration)
        CallbackFree(this.vtbl.get_onmsanimationiteration)
        CallbackFree(this.vtbl.put_oninvalid)
        CallbackFree(this.vtbl.get_oninvalid)
        CallbackFree(this.vtbl.put_xmsAcceleratorKey)
        CallbackFree(this.vtbl.get_xmsAcceleratorKey)
        CallbackFree(this.vtbl.put_spellcheck)
        CallbackFree(this.vtbl.get_spellcheck)
        CallbackFree(this.vtbl.put_onmsmanipulationstatechanged)
        CallbackFree(this.vtbl.get_onmsmanipulationstatechanged)
        CallbackFree(this.vtbl.put_oncuechange)
        CallbackFree(this.vtbl.get_oncuechange)
    }
}
