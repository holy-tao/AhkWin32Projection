#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLElementCollection.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLSelectionObject.ahk
#Include .\IHTMLFramesCollection2.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLLocation.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLWindow2.ahk
#Include .\IHTMLStyleSheetsCollection.ahk
#Include .\IHTMLStyleSheet.ahk
#Include .\IHTMLDocument.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument2 extends IHTMLDocument{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument2
     * @type {Guid}
     */
    static IID => Guid("{332c4425-26cb-11d0-b483-00c04fd90119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_all", "get_body", "get_activeElement", "get_images", "get_applets", "get_links", "get_forms", "get_anchors", "put_title", "get_title", "get_scripts", "put_designMode", "get_designMode", "get_selection", "get_readyState", "get_frames", "get_embeds", "get_plugins", "put_alinkColor", "get_alinkColor", "put_bgColor", "get_bgColor", "put_fgColor", "get_fgColor", "put_linkColor", "get_linkColor", "put_vlinkColor", "get_vlinkColor", "get_referrer", "get_location", "get_lastModified", "put_URL", "get_URL", "put_domain", "get_domain", "put_cookie", "get_cookie", "put_expando", "get_expando", "put_charset", "get_charset", "put_defaultCharset", "get_defaultCharset", "get_mimeType", "get_fileSize", "get_fileCreatedDate", "get_fileModifiedDate", "get_fileUpdatedDate", "get_security", "get_protocol", "get_nameProp", "write", "writeln", "open", "close", "clear", "queryCommandSupported", "queryCommandEnabled", "queryCommandState", "queryCommandIndeterm", "queryCommandText", "queryCommandValue", "execCommand", "execCommandShowHelp", "createElement", "put_onhelp", "get_onhelp", "put_onclick", "get_onclick", "put_ondblclick", "get_ondblclick", "put_onkeyup", "get_onkeyup", "put_onkeydown", "get_onkeydown", "put_onkeypress", "get_onkeypress", "put_onmouseup", "get_onmouseup", "put_onmousedown", "get_onmousedown", "put_onmousemove", "get_onmousemove", "put_onmouseout", "get_onmouseout", "put_onmouseover", "get_onmouseover", "put_onreadystatechange", "get_onreadystatechange", "put_onafterupdate", "get_onafterupdate", "put_onrowexit", "get_onrowexit", "put_onrowenter", "get_onrowenter", "put_ondragstart", "get_ondragstart", "put_onselectstart", "get_onselectstart", "elementFromPoint", "get_parentWindow", "get_styleSheets", "put_onbeforeupdate", "get_onbeforeupdate", "put_onerrorupdate", "get_onerrorupdate", "toString", "createStyleSheet"]

    /**
     * @type {IHTMLElementCollection} 
     */
    all {
        get => this.get_all()
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
    activeElement {
        get => this.get_activeElement()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    images {
        get => this.get_images()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    applets {
        get => this.get_applets()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    links {
        get => this.get_links()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    forms {
        get => this.get_forms()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    anchors {
        get => this.get_anchors()
    }

    /**
     * @type {BSTR} 
     */
    title {
        get => this.get_title()
        set => this.put_title(value)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    scripts {
        get => this.get_scripts()
    }

    /**
     * @type {BSTR} 
     */
    designMode {
        get => this.get_designMode()
        set => this.put_designMode(value)
    }

    /**
     * @type {IHTMLSelectionObject} 
     */
    selection {
        get => this.get_selection()
    }

    /**
     * @type {BSTR} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {IHTMLFramesCollection2} 
     */
    frames {
        get => this.get_frames()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    embeds {
        get => this.get_embeds()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    plugins {
        get => this.get_plugins()
    }

    /**
     * @type {VARIANT} 
     */
    alinkColor {
        get => this.get_alinkColor()
        set => this.put_alinkColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    fgColor {
        get => this.get_fgColor()
        set => this.put_fgColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    linkColor {
        get => this.get_linkColor()
        set => this.put_linkColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    vlinkColor {
        get => this.get_vlinkColor()
        set => this.put_vlinkColor(value)
    }

    /**
     * @type {BSTR} 
     */
    referrer {
        get => this.get_referrer()
    }

    /**
     * @type {IHTMLLocation} 
     */
    location {
        get => this.get_location()
    }

    /**
     * @type {BSTR} 
     */
    lastModified {
        get => this.get_lastModified()
    }

    /**
     * @type {BSTR} 
     */
    URL {
        get => this.get_URL()
        set => this.put_URL(value)
    }

    /**
     * @type {BSTR} 
     */
    domain {
        get => this.get_domain()
        set => this.put_domain(value)
    }

    /**
     * @type {BSTR} 
     */
    cookie {
        get => this.get_cookie()
        set => this.put_cookie(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    expando {
        get => this.get_expando()
        set => this.put_expando(value)
    }

    /**
     * @type {BSTR} 
     */
    charset {
        get => this.get_charset()
        set => this.put_charset(value)
    }

    /**
     * @type {BSTR} 
     */
    defaultCharset {
        get => this.get_defaultCharset()
        set => this.put_defaultCharset(value)
    }

    /**
     * @type {BSTR} 
     */
    mimeType {
        get => this.get_mimeType()
    }

    /**
     * @type {BSTR} 
     */
    fileSize {
        get => this.get_fileSize()
    }

    /**
     * @type {BSTR} 
     */
    fileCreatedDate {
        get => this.get_fileCreatedDate()
    }

    /**
     * @type {BSTR} 
     */
    fileModifiedDate {
        get => this.get_fileModifiedDate()
    }

    /**
     * @type {BSTR} 
     */
    fileUpdatedDate {
        get => this.get_fileUpdatedDate()
    }

    /**
     * @type {BSTR} 
     */
    security {
        get => this.get_security()
    }

    /**
     * @type {BSTR} 
     */
    protocol {
        get => this.get_protocol()
    }

    /**
     * @type {BSTR} 
     */
    nameProp {
        get => this.get_nameProp()
    }

    /**
     * @type {VARIANT} 
     */
    onhelp {
        get => this.get_onhelp()
        set => this.put_onhelp(value)
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
    ondblclick {
        get => this.get_ondblclick()
        set => this.put_ondblclick(value)
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
    onmouseup {
        get => this.get_onmouseup()
        set => this.put_onmouseup(value)
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
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onafterupdate {
        get => this.get_onafterupdate()
        set => this.put_onafterupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onrowexit {
        get => this.get_onrowexit()
        set => this.put_onrowexit(value)
    }

    /**
     * @type {VARIANT} 
     */
    onrowenter {
        get => this.get_onrowenter()
        set => this.put_onrowenter(value)
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
    onselectstart {
        get => this.get_onselectstart()
        set => this.put_onselectstart(value)
    }

    /**
     * @type {IHTMLWindow2} 
     */
    parentWindow {
        get => this.get_parentWindow()
    }

    /**
     * @type {IHTMLStyleSheetsCollection} 
     */
    styleSheets {
        get => this.get_styleSheets()
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeupdate {
        get => this.get_onbeforeupdate()
        set => this.put_onbeforeupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerrorupdate {
        get => this.get_onerrorupdate()
        set => this.put_onerrorupdate(value)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_all() {
        result := ComCall(8, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_body() {
        result := ComCall(9, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_activeElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_images() {
        result := ComCall(11, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_applets() {
        result := ComCall(12, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_links() {
        result := ComCall(13, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_forms() {
        result := ComCall(14, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_anchors() {
        result := ComCall(15, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(16, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_scripts() {
        result := ComCall(18, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_designMode(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(19, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_designMode() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLSelectionObject} 
     */
    get_selection() {
        result := ComCall(21, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLSelectionObject(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLFramesCollection2} 
     */
    get_frames() {
        result := ComCall(23, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLFramesCollection2(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_embeds() {
        result := ComCall(24, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_plugins() {
        result := ComCall(25, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_alinkColor(v) {
        result := ComCall(26, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_alinkColor() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(28, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(29, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fgColor(v) {
        result := ComCall(30, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fgColor() {
        p := VARIANT()
        result := ComCall(31, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_linkColor(v) {
        result := ComCall(32, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_linkColor() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_vlinkColor(v) {
        result := ComCall(34, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_vlinkColor() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_referrer() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLLocation} 
     */
    get_location() {
        result := ComCall(37, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLLocation(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lastModified() {
        p := BSTR()
        result := ComCall(38, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(39, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR()
        result := ComCall(40, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_domain(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(41, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_domain() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cookie(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(43, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cookie() {
        p := BSTR()
        result := ComCall(44, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_expando(v) {
        result := ComCall(45, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expando() {
        result := ComCall(46, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_charset(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(47, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
        p := BSTR()
        result := ComCall(48, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultCharset(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(49, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultCharset() {
        p := BSTR()
        result := ComCall(50, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR()
        result := ComCall(51, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileSize() {
        p := BSTR()
        result := ComCall(52, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileCreatedDate() {
        p := BSTR()
        result := ComCall(53, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileModifiedDate() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileUpdatedDate() {
        p := BSTR()
        result := ComCall(55, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_security() {
        p := BSTR()
        result := ComCall(56, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR()
        result := ComCall(57, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nameProp() {
        p := BSTR()
        result := ComCall(58, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psarray 
     * @returns {HRESULT} 
     */
    write(psarray) {
        result := ComCall(59, this, "ptr", psarray, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psarray 
     * @returns {HRESULT} 
     */
    writeln(psarray) {
        result := ComCall(60, this, "ptr", psarray, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The open command initializes a device. All MCI devices recognize this command.
     * @remarks
     * MCI reserves "cdaudio" for the CD audio device type, "videodisc" for the videodisc device type, "sequencer" for the MIDI sequencer device type, "AVIVideo" for the digital-video device type, and "waveaudio" for the waveform-audio device type.
     * 
     * As an alternative to the "type" flag, MCI can select the device based on the extension used by the file, as recorded in the registry or the \[mci extension\] section of the SYSTEM.INI file.
     * 
     * MCI can open AVI files by using a file-interface pointer or a stream-interface pointer. To open a file by using either type of interface pointer, specify an at sign (@) followed by the interface pointer in place of the file or device name for the *lpszDevice* parameter. For more information about the file and stream interfaces, see " [AVIFile Functions and Macros](avifile-functions-and-macros.md)."
     * 
     * The following command opens the "mysound" device.
     * 
     * ``` syntax
     * open new type waveaudio alias mysound buffer 6
     * ```
     * 
     * With device name "new", the waveform driver prepares a new waveform resource. The command assigns the device alias "mysound" and specifies a 6-second buffer.
     * 
     * You can eliminate the "type" flag if you combine the device name with the filename. MCI recognizes this combination when you use the following syntax:
     * 
     * *device\_name* ! *element\_name*
     * 
     * The exclamation point separates the device name from the filename. The exclamation point should not be delimited by white spaces.
     * 
     * The following example opens the RIGHT.WAV file using the "waveaudio" device.
     * 
     * ``` syntax
     * open waveaudio!right.wav
     * ```
     * 
     * The MCIWAVE driver requires an asynchronous waveform-audio device.
     * @param {BSTR} url 
     * @param {VARIANT} name 
     * @param {VARIANT} features 
     * @param {VARIANT} replace 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/open
     */
    open(url, name, features, replace) {
        if(url is String) {
            pin := BSTR.Alloc(url)
            url := pin.Value
        }

        result := ComCall(61, this, "ptr", url, "ptr", name, "ptr", features, "ptr", replace, "ptr*", &pomWindowResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(pomWindowResult)
    }

    /**
     * The close command closes the device or file and any associated resources. MCI unloads a device when all instances of the device or all files are closed. All MCI devices recognize this command.
     * @remarks
     * To close all devices opened by your application, specify the "all" device identifier for the *lpszDeviceID* parameter.
     * 
     * Closing the **cdaudio** device stops audio playback.
     * 
     * **Windows 2000/XP:** If the **cdaudio** device is playing, closing the **cdaudio** device does not cause the audio to stop playing. Send the [stop](stop.md) command first.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/close
     */
    close() {
        result := ComCall(62, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * clearBatch Method (SQLServerStatement)
     * @remarks
     * This clearBatch method is specified by the clearBatch method in the java.sql.Statement interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/clearbatch-method-sqlserverstatement
     */
    clear() {
        result := ComCall(63, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandSupported(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        result := ComCall(64, this, "ptr", cmdID, "short*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandEnabled(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        result := ComCall(65, this, "ptr", cmdID, "short*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandState(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        result := ComCall(66, this, "ptr", cmdID, "short*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandIndeterm(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        result := ComCall(67, this, "ptr", cmdID, "short*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {BSTR} 
     */
    queryCommandText(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        pcmdText := BSTR()
        result := ComCall(68, this, "ptr", cmdID, "ptr", pcmdText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcmdText
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT} 
     */
    queryCommandValue(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        pcmdValue := VARIANT()
        result := ComCall(69, this, "ptr", cmdID, "ptr", pcmdValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcmdValue
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {VARIANT_BOOL} showUI 
     * @param {VARIANT} value 
     * @returns {VARIANT_BOOL} 
     */
    execCommand(cmdID, showUI, value) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        result := ComCall(70, this, "ptr", cmdID, "short", showUI, "ptr", value, "short*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    execCommandShowHelp(cmdID) {
        if(cmdID is String) {
            pin := BSTR.Alloc(cmdID)
            cmdID := pin.Value
        }

        result := ComCall(71, this, "ptr", cmdID, "short*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * 
     * @param {BSTR} eTag 
     * @returns {IHTMLElement} 
     */
    createElement(eTag) {
        if(eTag is String) {
            pin := BSTR.Alloc(eTag)
            eTag := pin.Value
        }

        result := ComCall(72, this, "ptr", eTag, "ptr*", &newElem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(newElem)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhelp(v) {
        result := ComCall(73, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(74, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(75, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(76, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(77, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(78, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(79, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(81, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(82, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(83, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(84, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(85, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(86, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(87, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(88, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(89, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(90, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(91, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(92, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(93, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(94, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(95, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(96, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterupdate(v) {
        result := ComCall(97, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterupdate() {
        p := VARIANT()
        result := ComCall(98, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowexit(v) {
        result := ComCall(99, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowexit() {
        p := VARIANT()
        result := ComCall(100, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowenter(v) {
        result := ComCall(101, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowenter() {
        p := VARIANT()
        result := ComCall(102, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragstart(v) {
        result := ComCall(103, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(104, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectstart(v) {
        result := ComCall(105, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselectstart() {
        p := VARIANT()
        result := ComCall(106, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {IHTMLElement} 
     */
    elementFromPoint(x, y) {
        result := ComCall(107, this, "int", x, "int", y, "ptr*", &elementHit := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(elementHit)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_parentWindow() {
        result := ComCall(108, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLStyleSheetsCollection} 
     */
    get_styleSheets() {
        result := ComCall(109, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheetsCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeupdate(v) {
        result := ComCall(110, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeupdate() {
        p := VARIANT()
        result := ComCall(111, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerrorupdate(v) {
        result := ComCall(112, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerrorupdate() {
        p := VARIANT()
        result := ComCall(113, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * toString Method (DateTimeOffset)
     * @remarks
     * The string has the format `YYYY-MM-DD HH:mm:ss[.fffffff] [+|-]HH:mm`.  
     *   
     *  The fractional seconds of the returned string are zero padded to the declared precision. For example, a **datetimeoffset(6)** with a value of "2010-03-10 12:34:56.78 -08:00" will be formatted by DateTimeOffset.toString as "2010-03-10 12:34:56.780000 -08:00".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/tostring-method-datetimeoffset
     */
    toString() {
        String_ := BSTR()
        result := ComCall(114, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return String_
    }

    /**
     * 
     * @param {BSTR} bstrHref 
     * @param {Integer} lIndex 
     * @returns {IHTMLStyleSheet} 
     */
    createStyleSheet(bstrHref, lIndex) {
        if(bstrHref is String) {
            pin := BSTR.Alloc(bstrHref)
            bstrHref := pin.Value
        }

        result := ComCall(115, this, "ptr", bstrHref, "int", lIndex, "ptr*", &ppnewStyleSheet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheet(ppnewStyleSheet)
    }
}
