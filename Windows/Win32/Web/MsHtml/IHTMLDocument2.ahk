#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_all(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_body(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} p 
     * @returns {HRESULT} 
     */
    get_activeElement(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_images(p) {
        result := ComCall(11, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_applets(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_links(p) {
        result := ComCall(13, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_forms(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_anchors(p) {
        result := ComCall(15, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_title(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_scripts(p) {
        result := ComCall(18, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_designMode(p) {
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLSelectionObject>} p 
     * @returns {HRESULT} 
     */
    get_selection(p) {
        result := ComCall(21, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_readyState(p) {
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLFramesCollection2>} p 
     * @returns {HRESULT} 
     */
    get_frames(p) {
        result := ComCall(23, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_embeds(p) {
        result := ComCall(24, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElementCollection>} p 
     * @returns {HRESULT} 
     */
    get_plugins(p) {
        result := ComCall(25, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_alinkColor(p) {
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_bgColor(p) {
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_fgColor(p) {
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_linkColor(p) {
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_vlinkColor(p) {
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_referrer(p) {
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLLocation>} p 
     * @returns {HRESULT} 
     */
    get_location(p) {
        result := ComCall(37, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_lastModified(p) {
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_URL(p) {
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_domain(p) {
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cookie(p) {
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_expando(p) {
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_charset(p) {
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_defaultCharset(p) {
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_mimeType(p) {
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileSize(p) {
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileCreatedDate(p) {
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileModifiedDate(p) {
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fileUpdatedDate(p) {
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_security(p) {
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_protocol(p) {
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_nameProp(p) {
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} pomWindowResult 
     * @returns {HRESULT} 
     */
    open(url, name, features, replace, pomWindowResult) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(61, this, "ptr", url, "ptr", name, "ptr", features, "ptr", replace, "ptr*", pomWindowResult, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandSupported(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(64, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandEnabled(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(65, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandState(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(66, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    queryCommandIndeterm(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(67, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<BSTR>} pcmdText 
     * @returns {HRESULT} 
     */
    queryCommandText(cmdID, pcmdText) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(68, this, "ptr", cmdID, "ptr", pcmdText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT>} pcmdValue 
     * @returns {HRESULT} 
     */
    queryCommandValue(cmdID, pcmdValue) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(69, this, "ptr", cmdID, "ptr", pcmdValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {VARIANT_BOOL} showUI 
     * @param {VARIANT} value 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    execCommand(cmdID, showUI, value, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(70, this, "ptr", cmdID, "short", showUI, "ptr", value, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} cmdID 
     * @param {Pointer<VARIANT_BOOL>} pfRet 
     * @returns {HRESULT} 
     */
    execCommandShowHelp(cmdID, pfRet) {
        cmdID := cmdID is String ? BSTR.Alloc(cmdID).Value : cmdID

        result := ComCall(71, this, "ptr", cmdID, "ptr", pfRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} eTag 
     * @param {Pointer<IHTMLElement>} newElem 
     * @returns {HRESULT} 
     */
    createElement(eTag, newElem) {
        eTag := eTag is String ? BSTR.Alloc(eTag).Value : eTag

        result := ComCall(72, this, "ptr", eTag, "ptr*", newElem, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onhelp(p) {
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onclick(p) {
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondblclick(p) {
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onkeyup(p) {
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onkeydown(p) {
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onkeypress(p) {
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmouseup(p) {
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmousedown(p) {
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmousemove(p) {
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmouseout(p) {
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onmouseover(p) {
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onreadystatechange(p) {
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onafterupdate(p) {
        result := ComCall(98, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onrowexit(p) {
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onrowenter(p) {
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ondragstart(p) {
        result := ComCall(104, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onselectstart(p) {
        result := ComCall(106, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<IHTMLElement>} elementHit 
     * @returns {HRESULT} 
     */
    elementFromPoint(x, y, elementHit) {
        result := ComCall(107, this, "int", x, "int", y, "ptr*", elementHit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLWindow2>} p 
     * @returns {HRESULT} 
     */
    get_parentWindow(p) {
        result := ComCall(108, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLStyleSheetsCollection>} p 
     * @returns {HRESULT} 
     */
    get_styleSheets(p) {
        result := ComCall(109, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforeupdate(p) {
        result := ComCall(111, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onerrorupdate(p) {
        result := ComCall(113, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} String 
     * @returns {HRESULT} 
     */
    toString(String) {
        result := ComCall(114, this, "ptr", String, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHref 
     * @param {Integer} lIndex 
     * @param {Pointer<IHTMLStyleSheet>} ppnewStyleSheet 
     * @returns {HRESULT} 
     */
    createStyleSheet(bstrHref, lIndex, ppnewStyleSheet) {
        bstrHref := bstrHref is String ? BSTR.Alloc(bstrHref).Value : bstrHref

        result := ComCall(115, this, "ptr", bstrHref, "int", lIndex, "ptr*", ppnewStyleSheet, "HRESULT")
        return result
    }
}
