#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLLocation.ahk" { IHTMLLocation }
#Import ".\IHTMLWindow2.ahk" { IHTMLWindow2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\IHTMLStyleSheet.ahk" { IHTMLStyleSheet }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLStyleSheetsCollection.ahk" { IHTMLStyleSheetsCollection }
#Import ".\IHTMLDocument.ahk" { IHTMLDocument }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLSelectionObject.ahk" { IHTMLSelectionObject }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import ".\IHTMLFramesCollection2.ahk" { IHTMLFramesCollection2 }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocument2 extends IHTMLDocument {
    /**
     * The interface identifier for IHTMLDocument2
     * @type {Guid}
     */
    static IID := Guid("{332c4425-26cb-11d0-b483-00c04fd90119}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocument2 interfaces
    */
    struct Vtbl extends IHTMLDocument.Vtbl {
        get_all                : IntPtr
        get_body               : IntPtr
        get_activeElement      : IntPtr
        get_images             : IntPtr
        get_applets            : IntPtr
        get_links              : IntPtr
        get_forms              : IntPtr
        get_anchors            : IntPtr
        put_title              : IntPtr
        get_title              : IntPtr
        get_scripts            : IntPtr
        put_designMode         : IntPtr
        get_designMode         : IntPtr
        get_selection          : IntPtr
        get_readyState         : IntPtr
        get_frames             : IntPtr
        get_embeds             : IntPtr
        get_plugins            : IntPtr
        put_alinkColor         : IntPtr
        get_alinkColor         : IntPtr
        put_bgColor            : IntPtr
        get_bgColor            : IntPtr
        put_fgColor            : IntPtr
        get_fgColor            : IntPtr
        put_linkColor          : IntPtr
        get_linkColor          : IntPtr
        put_vlinkColor         : IntPtr
        get_vlinkColor         : IntPtr
        get_referrer           : IntPtr
        get_location           : IntPtr
        get_lastModified       : IntPtr
        put_URL                : IntPtr
        get_URL                : IntPtr
        put_domain             : IntPtr
        get_domain             : IntPtr
        put_cookie             : IntPtr
        get_cookie             : IntPtr
        put_expando            : IntPtr
        get_expando            : IntPtr
        put_charset            : IntPtr
        get_charset            : IntPtr
        put_defaultCharset     : IntPtr
        get_defaultCharset     : IntPtr
        get_mimeType           : IntPtr
        get_fileSize           : IntPtr
        get_fileCreatedDate    : IntPtr
        get_fileModifiedDate   : IntPtr
        get_fileUpdatedDate    : IntPtr
        get_security           : IntPtr
        get_protocol           : IntPtr
        get_nameProp           : IntPtr
        write                  : IntPtr
        writeln                : IntPtr
        open                   : IntPtr
        close                  : IntPtr
        clear                  : IntPtr
        queryCommandSupported  : IntPtr
        queryCommandEnabled    : IntPtr
        queryCommandState      : IntPtr
        queryCommandIndeterm   : IntPtr
        queryCommandText       : IntPtr
        queryCommandValue      : IntPtr
        execCommand            : IntPtr
        execCommandShowHelp    : IntPtr
        createElement          : IntPtr
        put_onhelp             : IntPtr
        get_onhelp             : IntPtr
        put_onclick            : IntPtr
        get_onclick            : IntPtr
        put_ondblclick         : IntPtr
        get_ondblclick         : IntPtr
        put_onkeyup            : IntPtr
        get_onkeyup            : IntPtr
        put_onkeydown          : IntPtr
        get_onkeydown          : IntPtr
        put_onkeypress         : IntPtr
        get_onkeypress         : IntPtr
        put_onmouseup          : IntPtr
        get_onmouseup          : IntPtr
        put_onmousedown        : IntPtr
        get_onmousedown        : IntPtr
        put_onmousemove        : IntPtr
        get_onmousemove        : IntPtr
        put_onmouseout         : IntPtr
        get_onmouseout         : IntPtr
        put_onmouseover        : IntPtr
        get_onmouseover        : IntPtr
        put_onreadystatechange : IntPtr
        get_onreadystatechange : IntPtr
        put_onafterupdate      : IntPtr
        get_onafterupdate      : IntPtr
        put_onrowexit          : IntPtr
        get_onrowexit          : IntPtr
        put_onrowenter         : IntPtr
        get_onrowenter         : IntPtr
        put_ondragstart        : IntPtr
        get_ondragstart        : IntPtr
        put_onselectstart      : IntPtr
        get_onselectstart      : IntPtr
        elementFromPoint       : IntPtr
        get_parentWindow       : IntPtr
        get_styleSheets        : IntPtr
        put_onbeforeupdate     : IntPtr
        get_onbeforeupdate     : IntPtr
        put_onerrorupdate      : IntPtr
        get_onerrorupdate      : IntPtr
        toString               : IntPtr
        createStyleSheet       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocument2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_body() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_activeElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_images() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_applets() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_links() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_forms() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_anchors() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_scripts() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_designMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_designMode() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLSelectionObject} 
     */
    get_selection() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLSelectionObject(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFramesCollection2} 
     */
    get_frames() {
        result := ComCall(23, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFramesCollection2(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_embeds() {
        result := ComCall(24, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_plugins() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_alinkColor(v) {
        result := ComCall(26, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_alinkColor() {
        p := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(28, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fgColor(v) {
        result := ComCall(30, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fgColor() {
        p := VARIANT()
        result := ComCall(31, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_linkColor(v) {
        result := ComCall(32, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_linkColor() {
        p := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_vlinkColor(v) {
        result := ComCall(34, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_vlinkColor() {
        p := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_referrer() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLLocation} 
     */
    get_location() {
        result := ComCall(37, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLLocation(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lastModified() {
        p := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_domain(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_domain() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cookie(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cookie() {
        p := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_expando(v) {
        result := ComCall(45, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expando() {
        result := ComCall(46, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_charset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
        p := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultCharset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultCharset() {
        p := BSTR.Owned()
        result := ComCall(50, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR.Owned()
        result := ComCall(51, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileSize() {
        p := BSTR.Owned()
        result := ComCall(52, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileCreatedDate() {
        p := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileModifiedDate() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileUpdatedDate() {
        p := BSTR.Owned()
        result := ComCall(55, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_security() {
        p := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR.Owned()
        result := ComCall(57, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nameProp() {
        p := BSTR.Owned()
        result := ComCall(58, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psarray 
     * @returns {HRESULT} 
     */
    write(psarray) {
        result := ComCall(59, this, SAFEARRAY.Ptr, psarray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psarray 
     * @returns {HRESULT} 
     */
    writeln(psarray) {
        result := ComCall(60, this, SAFEARRAY.Ptr, psarray, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/open
     */
    open(url, name, features, replace) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(61, this, BSTR, url, VARIANT, name, VARIANT, features, VARIANT, replace, "ptr*", &pomWindowResult := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/close
     */
    close() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandSupported(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(64, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandEnabled(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(65, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandState(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(66, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandIndeterm(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(67, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {BSTR} 
     */
    queryCommandText(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        pcmdText := BSTR.Owned()
        result := ComCall(68, this, BSTR, cmdID, BSTR.Ptr, pcmdText, "HRESULT")
        return pcmdText
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT} 
     */
    queryCommandValue(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        pcmdValue := VARIANT()
        result := ComCall(69, this, BSTR, cmdID, VARIANT.Ptr, pcmdValue, "HRESULT")
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
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(70, this, BSTR, cmdID, VARIANT_BOOL, showUI, VARIANT, value, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    execCommandShowHelp(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(71, this, BSTR, cmdID, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} eTag 
     * @returns {IHTMLElement} 
     */
    createElement(eTag) {
        eTag := eTag is String ? BSTR.Alloc(eTag).Value : eTag

        result := ComCall(72, this, BSTR, eTag, "ptr*", &newElem := 0, "HRESULT")
        return IHTMLElement(newElem)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhelp(v) {
        result := ComCall(73, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(74, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(75, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(76, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(77, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(78, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(79, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(81, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(82, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(83, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(84, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(85, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(86, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(87, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(88, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(89, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(90, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(91, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(92, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(93, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(94, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(95, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(96, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterupdate(v) {
        result := ComCall(97, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterupdate() {
        p := VARIANT()
        result := ComCall(98, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowexit(v) {
        result := ComCall(99, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowexit() {
        p := VARIANT()
        result := ComCall(100, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowenter(v) {
        result := ComCall(101, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowenter() {
        p := VARIANT()
        result := ComCall(102, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragstart(v) {
        result := ComCall(103, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(104, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectstart(v) {
        result := ComCall(105, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselectstart() {
        p := VARIANT()
        result := ComCall(106, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {IHTMLElement} 
     */
    elementFromPoint(x, y) {
        result := ComCall(107, this, "int", x, "int", y, "ptr*", &elementHit := 0, "HRESULT")
        return IHTMLElement(elementHit)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_parentWindow() {
        result := ComCall(108, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLStyleSheetsCollection} 
     */
    get_styleSheets() {
        result := ComCall(109, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetsCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeupdate(v) {
        result := ComCall(110, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeupdate() {
        p := VARIANT()
        result := ComCall(111, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerrorupdate(v) {
        result := ComCall(112, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerrorupdate() {
        p := VARIANT()
        result := ComCall(113, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _String := BSTR.Owned()
        result := ComCall(114, this, BSTR.Ptr, _String, "HRESULT")
        return _String
    }

    /**
     * 
     * @param {BSTR} bstrHref 
     * @param {Integer} lIndex 
     * @returns {IHTMLStyleSheet} 
     */
    createStyleSheet(bstrHref, lIndex) {
        bstrHref := bstrHref is String ? BSTR.Alloc(bstrHref).Value : bstrHref

        result := ComCall(115, this, BSTR, bstrHref, "int", lIndex, "ptr*", &ppnewStyleSheet := 0, "HRESULT")
        return IHTMLStyleSheet(ppnewStyleSheet)
    }

    Query(iid) {
        if (IHTMLDocument2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_all := CallbackCreate(GetMethod(implObj, "get_all"), flags, 2)
        this.vtbl.get_body := CallbackCreate(GetMethod(implObj, "get_body"), flags, 2)
        this.vtbl.get_activeElement := CallbackCreate(GetMethod(implObj, "get_activeElement"), flags, 2)
        this.vtbl.get_images := CallbackCreate(GetMethod(implObj, "get_images"), flags, 2)
        this.vtbl.get_applets := CallbackCreate(GetMethod(implObj, "get_applets"), flags, 2)
        this.vtbl.get_links := CallbackCreate(GetMethod(implObj, "get_links"), flags, 2)
        this.vtbl.get_forms := CallbackCreate(GetMethod(implObj, "get_forms"), flags, 2)
        this.vtbl.get_anchors := CallbackCreate(GetMethod(implObj, "get_anchors"), flags, 2)
        this.vtbl.put_title := CallbackCreate(GetMethod(implObj, "put_title"), flags, 2)
        this.vtbl.get_title := CallbackCreate(GetMethod(implObj, "get_title"), flags, 2)
        this.vtbl.get_scripts := CallbackCreate(GetMethod(implObj, "get_scripts"), flags, 2)
        this.vtbl.put_designMode := CallbackCreate(GetMethod(implObj, "put_designMode"), flags, 2)
        this.vtbl.get_designMode := CallbackCreate(GetMethod(implObj, "get_designMode"), flags, 2)
        this.vtbl.get_selection := CallbackCreate(GetMethod(implObj, "get_selection"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.get_frames := CallbackCreate(GetMethod(implObj, "get_frames"), flags, 2)
        this.vtbl.get_embeds := CallbackCreate(GetMethod(implObj, "get_embeds"), flags, 2)
        this.vtbl.get_plugins := CallbackCreate(GetMethod(implObj, "get_plugins"), flags, 2)
        this.vtbl.put_alinkColor := CallbackCreate(GetMethod(implObj, "put_alinkColor"), flags, 2)
        this.vtbl.get_alinkColor := CallbackCreate(GetMethod(implObj, "get_alinkColor"), flags, 2)
        this.vtbl.put_bgColor := CallbackCreate(GetMethod(implObj, "put_bgColor"), flags, 2)
        this.vtbl.get_bgColor := CallbackCreate(GetMethod(implObj, "get_bgColor"), flags, 2)
        this.vtbl.put_fgColor := CallbackCreate(GetMethod(implObj, "put_fgColor"), flags, 2)
        this.vtbl.get_fgColor := CallbackCreate(GetMethod(implObj, "get_fgColor"), flags, 2)
        this.vtbl.put_linkColor := CallbackCreate(GetMethod(implObj, "put_linkColor"), flags, 2)
        this.vtbl.get_linkColor := CallbackCreate(GetMethod(implObj, "get_linkColor"), flags, 2)
        this.vtbl.put_vlinkColor := CallbackCreate(GetMethod(implObj, "put_vlinkColor"), flags, 2)
        this.vtbl.get_vlinkColor := CallbackCreate(GetMethod(implObj, "get_vlinkColor"), flags, 2)
        this.vtbl.get_referrer := CallbackCreate(GetMethod(implObj, "get_referrer"), flags, 2)
        this.vtbl.get_location := CallbackCreate(GetMethod(implObj, "get_location"), flags, 2)
        this.vtbl.get_lastModified := CallbackCreate(GetMethod(implObj, "get_lastModified"), flags, 2)
        this.vtbl.put_URL := CallbackCreate(GetMethod(implObj, "put_URL"), flags, 2)
        this.vtbl.get_URL := CallbackCreate(GetMethod(implObj, "get_URL"), flags, 2)
        this.vtbl.put_domain := CallbackCreate(GetMethod(implObj, "put_domain"), flags, 2)
        this.vtbl.get_domain := CallbackCreate(GetMethod(implObj, "get_domain"), flags, 2)
        this.vtbl.put_cookie := CallbackCreate(GetMethod(implObj, "put_cookie"), flags, 2)
        this.vtbl.get_cookie := CallbackCreate(GetMethod(implObj, "get_cookie"), flags, 2)
        this.vtbl.put_expando := CallbackCreate(GetMethod(implObj, "put_expando"), flags, 2)
        this.vtbl.get_expando := CallbackCreate(GetMethod(implObj, "get_expando"), flags, 2)
        this.vtbl.put_charset := CallbackCreate(GetMethod(implObj, "put_charset"), flags, 2)
        this.vtbl.get_charset := CallbackCreate(GetMethod(implObj, "get_charset"), flags, 2)
        this.vtbl.put_defaultCharset := CallbackCreate(GetMethod(implObj, "put_defaultCharset"), flags, 2)
        this.vtbl.get_defaultCharset := CallbackCreate(GetMethod(implObj, "get_defaultCharset"), flags, 2)
        this.vtbl.get_mimeType := CallbackCreate(GetMethod(implObj, "get_mimeType"), flags, 2)
        this.vtbl.get_fileSize := CallbackCreate(GetMethod(implObj, "get_fileSize"), flags, 2)
        this.vtbl.get_fileCreatedDate := CallbackCreate(GetMethod(implObj, "get_fileCreatedDate"), flags, 2)
        this.vtbl.get_fileModifiedDate := CallbackCreate(GetMethod(implObj, "get_fileModifiedDate"), flags, 2)
        this.vtbl.get_fileUpdatedDate := CallbackCreate(GetMethod(implObj, "get_fileUpdatedDate"), flags, 2)
        this.vtbl.get_security := CallbackCreate(GetMethod(implObj, "get_security"), flags, 2)
        this.vtbl.get_protocol := CallbackCreate(GetMethod(implObj, "get_protocol"), flags, 2)
        this.vtbl.get_nameProp := CallbackCreate(GetMethod(implObj, "get_nameProp"), flags, 2)
        this.vtbl.write := CallbackCreate(GetMethod(implObj, "write"), flags, 2)
        this.vtbl.writeln := CallbackCreate(GetMethod(implObj, "writeln"), flags, 2)
        this.vtbl.open := CallbackCreate(GetMethod(implObj, "open"), flags, 6)
        this.vtbl.close := CallbackCreate(GetMethod(implObj, "close"), flags, 1)
        this.vtbl.clear := CallbackCreate(GetMethod(implObj, "clear"), flags, 1)
        this.vtbl.queryCommandSupported := CallbackCreate(GetMethod(implObj, "queryCommandSupported"), flags, 3)
        this.vtbl.queryCommandEnabled := CallbackCreate(GetMethod(implObj, "queryCommandEnabled"), flags, 3)
        this.vtbl.queryCommandState := CallbackCreate(GetMethod(implObj, "queryCommandState"), flags, 3)
        this.vtbl.queryCommandIndeterm := CallbackCreate(GetMethod(implObj, "queryCommandIndeterm"), flags, 3)
        this.vtbl.queryCommandText := CallbackCreate(GetMethod(implObj, "queryCommandText"), flags, 3)
        this.vtbl.queryCommandValue := CallbackCreate(GetMethod(implObj, "queryCommandValue"), flags, 3)
        this.vtbl.execCommand := CallbackCreate(GetMethod(implObj, "execCommand"), flags, 5)
        this.vtbl.execCommandShowHelp := CallbackCreate(GetMethod(implObj, "execCommandShowHelp"), flags, 3)
        this.vtbl.createElement := CallbackCreate(GetMethod(implObj, "createElement"), flags, 3)
        this.vtbl.put_onhelp := CallbackCreate(GetMethod(implObj, "put_onhelp"), flags, 2)
        this.vtbl.get_onhelp := CallbackCreate(GetMethod(implObj, "get_onhelp"), flags, 2)
        this.vtbl.put_onclick := CallbackCreate(GetMethod(implObj, "put_onclick"), flags, 2)
        this.vtbl.get_onclick := CallbackCreate(GetMethod(implObj, "get_onclick"), flags, 2)
        this.vtbl.put_ondblclick := CallbackCreate(GetMethod(implObj, "put_ondblclick"), flags, 2)
        this.vtbl.get_ondblclick := CallbackCreate(GetMethod(implObj, "get_ondblclick"), flags, 2)
        this.vtbl.put_onkeyup := CallbackCreate(GetMethod(implObj, "put_onkeyup"), flags, 2)
        this.vtbl.get_onkeyup := CallbackCreate(GetMethod(implObj, "get_onkeyup"), flags, 2)
        this.vtbl.put_onkeydown := CallbackCreate(GetMethod(implObj, "put_onkeydown"), flags, 2)
        this.vtbl.get_onkeydown := CallbackCreate(GetMethod(implObj, "get_onkeydown"), flags, 2)
        this.vtbl.put_onkeypress := CallbackCreate(GetMethod(implObj, "put_onkeypress"), flags, 2)
        this.vtbl.get_onkeypress := CallbackCreate(GetMethod(implObj, "get_onkeypress"), flags, 2)
        this.vtbl.put_onmouseup := CallbackCreate(GetMethod(implObj, "put_onmouseup"), flags, 2)
        this.vtbl.get_onmouseup := CallbackCreate(GetMethod(implObj, "get_onmouseup"), flags, 2)
        this.vtbl.put_onmousedown := CallbackCreate(GetMethod(implObj, "put_onmousedown"), flags, 2)
        this.vtbl.get_onmousedown := CallbackCreate(GetMethod(implObj, "get_onmousedown"), flags, 2)
        this.vtbl.put_onmousemove := CallbackCreate(GetMethod(implObj, "put_onmousemove"), flags, 2)
        this.vtbl.get_onmousemove := CallbackCreate(GetMethod(implObj, "get_onmousemove"), flags, 2)
        this.vtbl.put_onmouseout := CallbackCreate(GetMethod(implObj, "put_onmouseout"), flags, 2)
        this.vtbl.get_onmouseout := CallbackCreate(GetMethod(implObj, "get_onmouseout"), flags, 2)
        this.vtbl.put_onmouseover := CallbackCreate(GetMethod(implObj, "put_onmouseover"), flags, 2)
        this.vtbl.get_onmouseover := CallbackCreate(GetMethod(implObj, "get_onmouseover"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.get_onreadystatechange := CallbackCreate(GetMethod(implObj, "get_onreadystatechange"), flags, 2)
        this.vtbl.put_onafterupdate := CallbackCreate(GetMethod(implObj, "put_onafterupdate"), flags, 2)
        this.vtbl.get_onafterupdate := CallbackCreate(GetMethod(implObj, "get_onafterupdate"), flags, 2)
        this.vtbl.put_onrowexit := CallbackCreate(GetMethod(implObj, "put_onrowexit"), flags, 2)
        this.vtbl.get_onrowexit := CallbackCreate(GetMethod(implObj, "get_onrowexit"), flags, 2)
        this.vtbl.put_onrowenter := CallbackCreate(GetMethod(implObj, "put_onrowenter"), flags, 2)
        this.vtbl.get_onrowenter := CallbackCreate(GetMethod(implObj, "get_onrowenter"), flags, 2)
        this.vtbl.put_ondragstart := CallbackCreate(GetMethod(implObj, "put_ondragstart"), flags, 2)
        this.vtbl.get_ondragstart := CallbackCreate(GetMethod(implObj, "get_ondragstart"), flags, 2)
        this.vtbl.put_onselectstart := CallbackCreate(GetMethod(implObj, "put_onselectstart"), flags, 2)
        this.vtbl.get_onselectstart := CallbackCreate(GetMethod(implObj, "get_onselectstart"), flags, 2)
        this.vtbl.elementFromPoint := CallbackCreate(GetMethod(implObj, "elementFromPoint"), flags, 4)
        this.vtbl.get_parentWindow := CallbackCreate(GetMethod(implObj, "get_parentWindow"), flags, 2)
        this.vtbl.get_styleSheets := CallbackCreate(GetMethod(implObj, "get_styleSheets"), flags, 2)
        this.vtbl.put_onbeforeupdate := CallbackCreate(GetMethod(implObj, "put_onbeforeupdate"), flags, 2)
        this.vtbl.get_onbeforeupdate := CallbackCreate(GetMethod(implObj, "get_onbeforeupdate"), flags, 2)
        this.vtbl.put_onerrorupdate := CallbackCreate(GetMethod(implObj, "put_onerrorupdate"), flags, 2)
        this.vtbl.get_onerrorupdate := CallbackCreate(GetMethod(implObj, "get_onerrorupdate"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.createStyleSheet := CallbackCreate(GetMethod(implObj, "createStyleSheet"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_all)
        CallbackFree(this.vtbl.get_body)
        CallbackFree(this.vtbl.get_activeElement)
        CallbackFree(this.vtbl.get_images)
        CallbackFree(this.vtbl.get_applets)
        CallbackFree(this.vtbl.get_links)
        CallbackFree(this.vtbl.get_forms)
        CallbackFree(this.vtbl.get_anchors)
        CallbackFree(this.vtbl.put_title)
        CallbackFree(this.vtbl.get_title)
        CallbackFree(this.vtbl.get_scripts)
        CallbackFree(this.vtbl.put_designMode)
        CallbackFree(this.vtbl.get_designMode)
        CallbackFree(this.vtbl.get_selection)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.get_frames)
        CallbackFree(this.vtbl.get_embeds)
        CallbackFree(this.vtbl.get_plugins)
        CallbackFree(this.vtbl.put_alinkColor)
        CallbackFree(this.vtbl.get_alinkColor)
        CallbackFree(this.vtbl.put_bgColor)
        CallbackFree(this.vtbl.get_bgColor)
        CallbackFree(this.vtbl.put_fgColor)
        CallbackFree(this.vtbl.get_fgColor)
        CallbackFree(this.vtbl.put_linkColor)
        CallbackFree(this.vtbl.get_linkColor)
        CallbackFree(this.vtbl.put_vlinkColor)
        CallbackFree(this.vtbl.get_vlinkColor)
        CallbackFree(this.vtbl.get_referrer)
        CallbackFree(this.vtbl.get_location)
        CallbackFree(this.vtbl.get_lastModified)
        CallbackFree(this.vtbl.put_URL)
        CallbackFree(this.vtbl.get_URL)
        CallbackFree(this.vtbl.put_domain)
        CallbackFree(this.vtbl.get_domain)
        CallbackFree(this.vtbl.put_cookie)
        CallbackFree(this.vtbl.get_cookie)
        CallbackFree(this.vtbl.put_expando)
        CallbackFree(this.vtbl.get_expando)
        CallbackFree(this.vtbl.put_charset)
        CallbackFree(this.vtbl.get_charset)
        CallbackFree(this.vtbl.put_defaultCharset)
        CallbackFree(this.vtbl.get_defaultCharset)
        CallbackFree(this.vtbl.get_mimeType)
        CallbackFree(this.vtbl.get_fileSize)
        CallbackFree(this.vtbl.get_fileCreatedDate)
        CallbackFree(this.vtbl.get_fileModifiedDate)
        CallbackFree(this.vtbl.get_fileUpdatedDate)
        CallbackFree(this.vtbl.get_security)
        CallbackFree(this.vtbl.get_protocol)
        CallbackFree(this.vtbl.get_nameProp)
        CallbackFree(this.vtbl.write)
        CallbackFree(this.vtbl.writeln)
        CallbackFree(this.vtbl.open)
        CallbackFree(this.vtbl.close)
        CallbackFree(this.vtbl.clear)
        CallbackFree(this.vtbl.queryCommandSupported)
        CallbackFree(this.vtbl.queryCommandEnabled)
        CallbackFree(this.vtbl.queryCommandState)
        CallbackFree(this.vtbl.queryCommandIndeterm)
        CallbackFree(this.vtbl.queryCommandText)
        CallbackFree(this.vtbl.queryCommandValue)
        CallbackFree(this.vtbl.execCommand)
        CallbackFree(this.vtbl.execCommandShowHelp)
        CallbackFree(this.vtbl.createElement)
        CallbackFree(this.vtbl.put_onhelp)
        CallbackFree(this.vtbl.get_onhelp)
        CallbackFree(this.vtbl.put_onclick)
        CallbackFree(this.vtbl.get_onclick)
        CallbackFree(this.vtbl.put_ondblclick)
        CallbackFree(this.vtbl.get_ondblclick)
        CallbackFree(this.vtbl.put_onkeyup)
        CallbackFree(this.vtbl.get_onkeyup)
        CallbackFree(this.vtbl.put_onkeydown)
        CallbackFree(this.vtbl.get_onkeydown)
        CallbackFree(this.vtbl.put_onkeypress)
        CallbackFree(this.vtbl.get_onkeypress)
        CallbackFree(this.vtbl.put_onmouseup)
        CallbackFree(this.vtbl.get_onmouseup)
        CallbackFree(this.vtbl.put_onmousedown)
        CallbackFree(this.vtbl.get_onmousedown)
        CallbackFree(this.vtbl.put_onmousemove)
        CallbackFree(this.vtbl.get_onmousemove)
        CallbackFree(this.vtbl.put_onmouseout)
        CallbackFree(this.vtbl.get_onmouseout)
        CallbackFree(this.vtbl.put_onmouseover)
        CallbackFree(this.vtbl.get_onmouseover)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.get_onreadystatechange)
        CallbackFree(this.vtbl.put_onafterupdate)
        CallbackFree(this.vtbl.get_onafterupdate)
        CallbackFree(this.vtbl.put_onrowexit)
        CallbackFree(this.vtbl.get_onrowexit)
        CallbackFree(this.vtbl.put_onrowenter)
        CallbackFree(this.vtbl.get_onrowenter)
        CallbackFree(this.vtbl.put_ondragstart)
        CallbackFree(this.vtbl.get_ondragstart)
        CallbackFree(this.vtbl.put_onselectstart)
        CallbackFree(this.vtbl.get_onselectstart)
        CallbackFree(this.vtbl.elementFromPoint)
        CallbackFree(this.vtbl.get_parentWindow)
        CallbackFree(this.vtbl.get_styleSheets)
        CallbackFree(this.vtbl.put_onbeforeupdate)
        CallbackFree(this.vtbl.get_onbeforeupdate)
        CallbackFree(this.vtbl.put_onerrorupdate)
        CallbackFree(this.vtbl.get_onerrorupdate)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.createStyleSheet)
    }
}
