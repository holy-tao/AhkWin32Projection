#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLFramesCollection2.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLImageElementFactory.ahk
#Include .\IHTMLLocation.ahk
#Include .\IOmHistory.ahk
#Include .\IOmNavigator.ahk
#Include .\IHTMLWindow2.ahk
#Include .\IHTMLDocument2.ahk
#Include .\IHTMLEventObj.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IHTMLScreen.ahk
#Include .\IHTMLOptionElementFactory.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow2 extends IHTMLFramesCollection2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow2
     * @type {Guid}
     */
    static IID => Guid("{332c4427-26cb-11d0-b483-00c04fd90119}")

    /**
     * The class identifier for HTMLWindow2
     * @type {Guid}
     */
    static CLSID => Guid("{d48a6ec6-6a4a-11cf-94a7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_frames", "put_defaultStatus", "get_defaultStatus", "put_status", "get_status", "setTimeout", "clearTimeout", "alert", "confirm", "prompt", "get_Image", "get_location", "get_history", "close", "put_opener", "get_opener", "get_navigator", "put_name", "get_name", "get_parent", "open", "get_self", "get_top", "get_window", "navigate", "put_onfocus", "get_onfocus", "put_onblur", "get_onblur", "put_onload", "get_onload", "put_onbeforeunload", "get_onbeforeunload", "put_onunload", "get_onunload", "put_onhelp", "get_onhelp", "put_onerror", "get_onerror", "put_onresize", "get_onresize", "put_onscroll", "get_onscroll", "get_document", "get_event", "get__newEnum", "showModalDialog", "showHelp", "get_screen", "get_Option", "focus", "get_closed", "blur", "scroll", "get_clientInformation", "setInterval", "clearInterval", "put_offscreenBuffering", "get_offscreenBuffering", "execScript", "toString", "scrollBy", "scrollTo", "moveTo", "moveBy", "resizeTo", "resizeBy", "get_external"]

    /**
     * 
     * @returns {IHTMLFramesCollection2} 
     */
    get_frames() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFramesCollection2(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultStatus(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultStatus() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_status() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setTimeout(expression, msec, language) {
        expression := expression is String ? BSTR.Alloc(expression).Value : expression

        result := ComCall(14, this, "ptr", expression, "int", msec, "ptr", language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @param {Integer} timerID 
     * @returns {HRESULT} 
     */
    clearTimeout(timerID) {
        result := ComCall(15, this, "int", timerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {HRESULT} 
     */
    alert(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(16, this, "ptr", message, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {VARIANT_BOOL} 
     */
    confirm(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(17, this, "ptr", message, "short*", &confirmed := 0, "HRESULT")
        return confirmed
    }

    /**
     * 
     * @param {BSTR} message 
     * @param {BSTR} defstr 
     * @returns {VARIANT} 
     */
    prompt(message, defstr) {
        message := message is String ? BSTR.Alloc(message).Value : message
        defstr := defstr is String ? BSTR.Alloc(defstr).Value : defstr

        textdata := VARIANT()
        result := ComCall(18, this, "ptr", message, "ptr", defstr, "ptr", textdata, "HRESULT")
        return textdata
    }

    /**
     * 
     * @returns {IHTMLImageElementFactory} 
     */
    get_Image() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLImageElementFactory(p)
    }

    /**
     * 
     * @returns {IHTMLLocation} 
     */
    get_location() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLLocation(p)
    }

    /**
     * 
     * @returns {IOmHistory} 
     */
    get_history() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IOmHistory(p)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    close() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_opener(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_opener() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IOmNavigator} 
     */
    get_navigator() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IOmNavigator(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_parent() {
        result := ComCall(28, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} url 
     * @param {BSTR} name 
     * @param {BSTR} features 
     * @param {VARIANT_BOOL} replace 
     * @returns {IHTMLWindow2} 
     */
    open(url, name, features, replace) {
        url := url is String ? BSTR.Alloc(url).Value : url
        name := name is String ? BSTR.Alloc(name).Value : name
        features := features is String ? BSTR.Alloc(features).Value : features

        result := ComCall(29, this, "ptr", url, "ptr", name, "ptr", features, "short", replace, "ptr*", &pomWindowResult := 0, "HRESULT")
        return IHTMLWindow2(pomWindowResult)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_self() {
        result := ComCall(30, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_top() {
        result := ComCall(31, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_window() {
        result := ComCall(32, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} url 
     * @returns {HRESULT} 
     */
    navigate(url) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(33, this, "ptr", url, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeunload(v) {
        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeunload() {
        p := VARIANT()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onunload(v) {
        result := ComCall(42, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onunload() {
        p := VARIANT()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhelp(v) {
        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(46, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresize(v) {
        result := ComCall(48, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresize() {
        p := VARIANT()
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(50, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    get_document() {
        result := ComCall(52, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument2(p)
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    get_event() {
        result := ComCall(53, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLEventObj(p)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(54, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {BSTR} dialog 
     * @param {Pointer<VARIANT>} varArgIn 
     * @param {Pointer<VARIANT>} varOptions 
     * @returns {VARIANT} 
     */
    showModalDialog(dialog, varArgIn, varOptions) {
        dialog := dialog is String ? BSTR.Alloc(dialog).Value : dialog

        varArgOut := VARIANT()
        result := ComCall(55, this, "ptr", dialog, "ptr", varArgIn, "ptr", varOptions, "ptr", varArgOut, "HRESULT")
        return varArgOut
    }

    /**
     * 
     * @param {BSTR} helpURL 
     * @param {VARIANT} helpArg 
     * @param {BSTR} features 
     * @returns {HRESULT} 
     */
    showHelp(helpURL, helpArg, features) {
        helpURL := helpURL is String ? BSTR.Alloc(helpURL).Value : helpURL
        features := features is String ? BSTR.Alloc(features).Value : features

        result := ComCall(56, this, "ptr", helpURL, "ptr", helpArg, "ptr", features, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLScreen} 
     */
    get_screen() {
        result := ComCall(57, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLScreen(p)
    }

    /**
     * 
     * @returns {IHTMLOptionElementFactory} 
     */
    get_Option() {
        result := ComCall(58, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLOptionElementFactory(p)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_closed() {
        result := ComCall(60, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scroll(x, y) {
        result := ComCall(62, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOmNavigator} 
     */
    get_clientInformation() {
        result := ComCall(63, this, "ptr*", &p := 0, "HRESULT")
        return IOmNavigator(p)
    }

    /**
     * 
     * @param {BSTR} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setInterval(expression, msec, language) {
        expression := expression is String ? BSTR.Alloc(expression).Value : expression

        result := ComCall(64, this, "ptr", expression, "int", msec, "ptr", language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @param {Integer} timerID 
     * @returns {HRESULT} 
     */
    clearInterval(timerID) {
        result := ComCall(65, this, "int", timerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_offscreenBuffering(v) {
        result := ComCall(66, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_offscreenBuffering() {
        p := VARIANT()
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} code 
     * @param {BSTR} language 
     * @returns {VARIANT} 
     */
    execScript(code, language) {
        code := code is String ? BSTR.Alloc(code).Value : code
        language := language is String ? BSTR.Alloc(language).Value : language

        pvarRet := VARIANT()
        result := ComCall(68, this, "ptr", code, "ptr", language, "ptr", pvarRet, "HRESULT")
        return pvarRet
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        String := BSTR()
        result := ComCall(69, this, "ptr", String, "HRESULT")
        return String
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scrollBy(x, y) {
        result := ComCall(70, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scrollTo(x, y) {
        result := ComCall(71, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveTo(x, y) {
        result := ComCall(72, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveBy(x, y) {
        result := ComCall(73, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeTo(x, y) {
        result := ComCall(74, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeBy(x, y) {
        result := ComCall(75, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_external() {
        result := ComCall(76, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }
}
