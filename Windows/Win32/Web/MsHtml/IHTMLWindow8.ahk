#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLApplicationCache.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow8 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow8
     * @type {Guid}
     */
    static IID => Guid("{305107ab-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_onmspointerdown", "get_onmspointerdown", "put_onmspointermove", "get_onmspointermove", "put_onmspointerup", "get_onmspointerup", "put_onmspointerover", "get_onmspointerover", "put_onmspointerout", "get_onmspointerout", "put_onmspointercancel", "get_onmspointercancel", "put_onmspointerhover", "get_onmspointerhover", "put_onmsgesturestart", "get_onmsgesturestart", "put_onmsgesturechange", "get_onmsgesturechange", "put_onmsgestureend", "get_onmsgestureend", "put_onmsgesturehold", "get_onmsgesturehold", "put_onmsgesturetap", "get_onmsgesturetap", "put_onmsgesturedoubletap", "get_onmsgesturedoubletap", "put_onmsinertiastart", "get_onmsinertiastart", "get_applicationCache", "put_onpopstate", "get_onpopstate"]

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerdown(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerdown() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointermove(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointermove() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerup(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerup() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerover(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerover() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerout(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerout() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointercancel(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointercancel() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmspointerhover(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmspointerhover() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturestart(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturestart() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturechange(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturechange() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgestureend(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgestureend() {
        p := VARIANT()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturehold(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturehold() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturetap(v) {
        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturetap() {
        p := VARIANT()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturedoubletap(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturedoubletap() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsinertiastart(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsinertiastart() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
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
        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpopstate() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }
}
