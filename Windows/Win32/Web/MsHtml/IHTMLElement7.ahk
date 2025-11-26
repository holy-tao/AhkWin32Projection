#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement7 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement7
     * @type {Guid}
     */
    static IID => Guid("{305107aa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_onmspointerdown", "get_onmspointerdown", "put_onmspointermove", "get_onmspointermove", "put_onmspointerup", "get_onmspointerup", "put_onmspointerover", "get_onmspointerover", "put_onmspointerout", "get_onmspointerout", "put_onmspointercancel", "get_onmspointercancel", "put_onmspointerhover", "get_onmspointerhover", "put_onmslostpointercapture", "get_onmslostpointercapture", "put_onmsgotpointercapture", "get_onmsgotpointercapture", "put_onmsgesturestart", "get_onmsgesturestart", "put_onmsgesturechange", "get_onmsgesturechange", "put_onmsgestureend", "get_onmsgestureend", "put_onmsgesturehold", "get_onmsgesturehold", "put_onmsgesturetap", "get_onmsgesturetap", "put_onmsgesturedoubletap", "get_onmsgesturedoubletap", "put_onmsinertiastart", "get_onmsinertiastart", "msSetPointerCapture", "msReleasePointerCapture", "put_onmstransitionstart", "get_onmstransitionstart", "put_onmstransitionend", "get_onmstransitionend", "put_onmsanimationstart", "get_onmsanimationstart", "put_onmsanimationend", "get_onmsanimationend", "put_onmsanimationiteration", "get_onmsanimationiteration", "put_oninvalid", "get_oninvalid", "put_xmsAcceleratorKey", "get_xmsAcceleratorKey", "put_spellcheck", "get_spellcheck", "put_onmsmanipulationstatechanged", "get_onmsmanipulationstatechanged", "put_oncuechange", "get_oncuechange"]

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
    put_onmslostpointercapture(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmslostpointercapture() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgotpointercapture(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgotpointercapture() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturestart(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturestart() {
        p := VARIANT()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturechange(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturechange() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgestureend(v) {
        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgestureend() {
        p := VARIANT()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturehold(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturehold() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturetap(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturetap() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsgesturedoubletap(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsgesturedoubletap() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsinertiastart(v) {
        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsinertiastart() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
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
        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmstransitionstart() {
        p := VARIANT()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmstransitionend(v) {
        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmstransitionend() {
        p := VARIANT()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsanimationstart(v) {
        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsanimationstart() {
        p := VARIANT()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsanimationend(v) {
        result := ComCall(47, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsanimationend() {
        p := VARIANT()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsanimationiteration(v) {
        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsanimationiteration() {
        p := VARIANT()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oninvalid(v) {
        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oninvalid() {
        p := VARIANT()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmsAcceleratorKey(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmsAcceleratorKey() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_spellcheck(v) {
        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_spellcheck() {
        p := VARIANT()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmsmanipulationstatechanged(v) {
        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmsmanipulationstatechanged() {
        p := VARIANT()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncuechange(v) {
        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncuechange() {
        p := VARIANT()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }
}
