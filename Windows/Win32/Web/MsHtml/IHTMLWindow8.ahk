#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLApplicationCache.ahk" { IHTMLApplicationCache }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLWindow8 extends IDispatch {
    /**
     * The interface identifier for IHTMLWindow8
     * @type {Guid}
     */
    static IID := Guid("{305107ab-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLWindow8 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onmspointerdown      : IntPtr
        get_onmspointerdown      : IntPtr
        put_onmspointermove      : IntPtr
        get_onmspointermove      : IntPtr
        put_onmspointerup        : IntPtr
        get_onmspointerup        : IntPtr
        put_onmspointerover      : IntPtr
        get_onmspointerover      : IntPtr
        put_onmspointerout       : IntPtr
        get_onmspointerout       : IntPtr
        put_onmspointercancel    : IntPtr
        get_onmspointercancel    : IntPtr
        put_onmspointerhover     : IntPtr
        get_onmspointerhover     : IntPtr
        put_onmsgesturestart     : IntPtr
        get_onmsgesturestart     : IntPtr
        put_onmsgesturechange    : IntPtr
        get_onmsgesturechange    : IntPtr
        put_onmsgestureend       : IntPtr
        get_onmsgestureend       : IntPtr
        put_onmsgesturehold      : IntPtr
        get_onmsgesturehold      : IntPtr
        put_onmsgesturetap       : IntPtr
        get_onmsgesturetap       : IntPtr
        put_onmsgesturedoubletap : IntPtr
        get_onmsgesturedoubletap : IntPtr
        put_onmsinertiastart     : IntPtr
        get_onmsinertiastart     : IntPtr
        get_applicationCache     : IntPtr
        put_onpopstate           : IntPtr
        get_onpopstate           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLWindow8.Vtbl()
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
     * @type {IHTMLApplicationCache} 
     */
    applicationCache {
        get => this.get_applicationCache()
    }

    /**
     * @type {VARIANT} 
     */
    onpopstate {
        get => this.get_onpopstate()
        set => this.put_onpopstate(value)
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
    put_onmsgesturestart(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturestart() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturechange(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturechange() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgestureend(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgestureend() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturehold(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturehold() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturetap(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturetap() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturedoubletap(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturedoubletap() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsinertiastart(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsinertiastart() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLApplicationCache} 
     */
    get_applicationCache() {
        result := ComCall(35, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLApplicationCache(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpopstate(v) {
        result := ComCall(36, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpopstate() {
        p := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLWindow8.IID.Equals(iid)) {
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
        this.vtbl.get_applicationCache := CallbackCreate(GetMethod(implObj, "get_applicationCache"), flags, 2)
        this.vtbl.put_onpopstate := CallbackCreate(GetMethod(implObj, "put_onpopstate"), flags, 2)
        this.vtbl.get_onpopstate := CallbackCreate(GetMethod(implObj, "get_onpopstate"), flags, 2)
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
        CallbackFree(this.vtbl.get_applicationCache)
        CallbackFree(this.vtbl.put_onpopstate)
        CallbackFree(this.vtbl.get_onpopstate)
    }
}
