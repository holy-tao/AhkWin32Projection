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

        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
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

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_designMode() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
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
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
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
        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_alinkColor() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fgColor(v) {
        result := ComCall(30, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fgColor() {
        p := VARIANT()
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_linkColor(v) {
        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_linkColor() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_vlinkColor(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_vlinkColor() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_referrer() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "HRESULT")
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
        p := BSTR()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_domain(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_domain() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cookie(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cookie() {
        p := BSTR()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_expando(v) {
        result := ComCall(45, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expando() {
        result := ComCall(46, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_charset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
        p := BSTR()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultCharset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultCharset() {
        p := BSTR()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileSize() {
        p := BSTR()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileCreatedDate() {
        p := BSTR()
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileModifiedDate() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileUpdatedDate() {
        p := BSTR()
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_security() {
        p := BSTR()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR()
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nameProp() {
        p := BSTR()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psarray 
     * @returns {HRESULT} 
     */
    write(psarray) {
        result := ComCall(59, this, "ptr", psarray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} psarray 
     * @returns {HRESULT} 
     */
    writeln(psarray) {
        result := ComCall(60, this, "ptr", psarray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} url 
     * @param {VARIANT} name 
     * @param {VARIANT} features 
     * @param {VARIANT} replace 
     * @returns {IDispatch} 
     */
    open(url, name, features, replace) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(61, this, "ptr", url, "ptr", name, "ptr", features, "ptr", replace, "ptr*", &pomWindowResult := 0, "HRESULT")
        return IDispatch(pomWindowResult)
    }

    /**
     * 
     * @returns {HRESULT} 
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

        result := ComCall(64, this, "ptr", cmdID, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandEnabled(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(65, this, "ptr", cmdID, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandState(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(66, this, "ptr", cmdID, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    queryCommandIndeterm(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(67, this, "ptr", cmdID, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {BSTR} 
     */
    queryCommandText(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        pcmdText := BSTR()
        result := ComCall(68, this, "ptr", cmdID, "ptr", pcmdText, "HRESULT")
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
        result := ComCall(69, this, "ptr", cmdID, "ptr", pcmdValue, "HRESULT")
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

        result := ComCall(70, this, "ptr", cmdID, "short", showUI, "ptr", value, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @returns {VARIANT_BOOL} 
     */
    execCommandShowHelp(cmdID) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(71, this, "ptr", cmdID, "short*", &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @param {BSTR} eTag 
     * @returns {IHTMLElement} 
     */
    createElement(eTag) {
        eTag := eTag is String ? BSTR.Alloc(eTag).Value : eTag

        result := ComCall(72, this, "ptr", eTag, "ptr*", &newElem := 0, "HRESULT")
        return IHTMLElement(newElem)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhelp(v) {
        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(79, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(81, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(83, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(85, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(87, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(89, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(91, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(93, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(95, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterupdate(v) {
        result := ComCall(97, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterupdate() {
        p := VARIANT()
        result := ComCall(98, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowexit(v) {
        result := ComCall(99, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowexit() {
        p := VARIANT()
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowenter(v) {
        result := ComCall(101, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowenter() {
        p := VARIANT()
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragstart(v) {
        result := ComCall(103, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(104, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectstart(v) {
        result := ComCall(105, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselectstart() {
        p := VARIANT()
        result := ComCall(106, this, "ptr", p, "HRESULT")
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
        result := ComCall(110, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeupdate() {
        p := VARIANT()
        result := ComCall(111, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerrorupdate(v) {
        result := ComCall(112, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerrorupdate() {
        p := VARIANT()
        result := ComCall(113, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        String := BSTR()
        result := ComCall(114, this, "ptr", String, "HRESULT")
        return String
    }

    /**
     * 
     * @param {BSTR} bstrHref 
     * @param {Integer} lIndex 
     * @returns {IHTMLStyleSheet} 
     */
    createStyleSheet(bstrHref, lIndex) {
        bstrHref := bstrHref is String ? BSTR.Alloc(bstrHref).Value : bstrHref

        result := ComCall(115, this, "ptr", bstrHref, "int", lIndex, "ptr*", &ppnewStyleSheet := 0, "HRESULT")
        return IHTMLStyleSheet(ppnewStyleSheet)
    }
}
