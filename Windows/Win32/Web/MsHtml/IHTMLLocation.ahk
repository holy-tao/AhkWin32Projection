#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLLocation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLLocation
     * @type {Guid}
     */
    static IID => Guid("{163bb1e0-6e00-11cf-837a-48dc04c10000}")

    /**
     * The class identifier for HTMLLocation
     * @type {Guid}
     */
    static CLSID => Guid("{163bb1e1-6e00-11cf-837a-48dc04c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_href", "get_href", "put_protocol", "get_protocol", "put_host", "get_host", "put_hostname", "get_hostname", "put_port", "get_port", "put_pathname", "get_pathname", "put_search", "get_search", "put_hash", "get_hash", "reload", "replace", "assign", "toString"]

    /**
     * @type {BSTR} 
     */
    href {
        get => this.get_href()
        set => this.put_href(value)
    }

    /**
     * @type {BSTR} 
     */
    protocol {
        get => this.get_protocol()
        set => this.put_protocol(value)
    }

    /**
     * @type {BSTR} 
     */
    host {
        get => this.get_host()
        set => this.put_host(value)
    }

    /**
     * @type {BSTR} 
     */
    hostname {
        get => this.get_hostname()
        set => this.put_hostname(value)
    }

    /**
     * @type {BSTR} 
     */
    port {
        get => this.get_port()
        set => this.put_port(value)
    }

    /**
     * @type {BSTR} 
     */
    pathname {
        get => this.get_pathname()
        set => this.put_pathname(value)
    }

    /**
     * @type {BSTR} 
     */
    search {
        get => this.get_search()
        set => this.put_search(value)
    }

    /**
     * @type {BSTR} 
     */
    hash {
        get => this.get_hash()
        set => this.put_hash(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_href(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_protocol(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_host(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_host() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hostname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hostname() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_port(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_port() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pathname(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pathname() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_search(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_search() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_hash(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_hash() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} flag 
     * @returns {HRESULT} 
     */
    reload(flag) {
        result := ComCall(23, this, "short", flag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    replace(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(24, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     */
    assign(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(25, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        string := BSTR()
        result := ComCall(26, this, "ptr", string, "HRESULT")
        return string
    }
}
