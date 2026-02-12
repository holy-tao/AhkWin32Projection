#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDOMNode.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLDocument2.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLElementCollection.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument3
     * @type {Guid}
     */
    static IID => Guid("{3050f485-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["releaseCapture", "recalc", "createTextNode", "get_documentElement", "get_uniqueID", "attachEvent", "detachEvent", "put_onrowsdelete", "get_onrowsdelete", "put_onrowsinserted", "get_onrowsinserted", "put_oncellchange", "get_oncellchange", "put_ondatasetchanged", "get_ondatasetchanged", "put_ondataavailable", "get_ondataavailable", "put_ondatasetcomplete", "get_ondatasetcomplete", "put_onpropertychange", "get_onpropertychange", "put_dir", "get_dir", "put_oncontextmenu", "get_oncontextmenu", "put_onstop", "get_onstop", "createDocumentFragment", "get_parentDocument", "put_enableDownload", "get_enableDownload", "put_baseUrl", "get_baseUrl", "get_childNodes", "put_inheritStyleSheets", "get_inheritStyleSheets", "put_onbeforeeditfocus", "get_onbeforeeditfocus", "getElementsByName", "getElementById", "getElementsByTagName"]

    /**
     * @type {IHTMLElement} 
     */
    documentElement {
        get => this.get_documentElement()
    }

    /**
     * @type {BSTR} 
     */
    uniqueID {
        get => this.get_uniqueID()
    }

    /**
     * @type {VARIANT} 
     */
    onrowsdelete {
        get => this.get_onrowsdelete()
        set => this.put_onrowsdelete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onrowsinserted {
        get => this.get_onrowsinserted()
        set => this.put_onrowsinserted(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncellchange {
        get => this.get_oncellchange()
        set => this.put_oncellchange(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondatasetchanged {
        get => this.get_ondatasetchanged()
        set => this.put_ondatasetchanged(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondataavailable {
        get => this.get_ondataavailable()
        set => this.put_ondataavailable(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondatasetcomplete {
        get => this.get_ondatasetcomplete()
        set => this.put_ondatasetcomplete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onpropertychange {
        get => this.get_onpropertychange()
        set => this.put_onpropertychange(value)
    }

    /**
     * @type {BSTR} 
     */
    dir {
        get => this.get_dir()
        set => this.put_dir(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncontextmenu {
        get => this.get_oncontextmenu()
        set => this.put_oncontextmenu(value)
    }

    /**
     * @type {VARIANT} 
     */
    onstop {
        get => this.get_onstop()
        set => this.put_onstop(value)
    }

    /**
     * @type {IHTMLDocument2} 
     */
    parentDocument {
        get => this.get_parentDocument()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enableDownload {
        get => this.get_enableDownload()
        set => this.put_enableDownload(value)
    }

    /**
     * @type {BSTR} 
     */
    baseUrl {
        get => this.get_baseUrl()
        set => this.put_baseUrl(value)
    }

    /**
     * @type {IDispatch} 
     */
    childNodes {
        get => this.get_childNodes()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    inheritStyleSheets {
        get => this.get_inheritStyleSheets()
        set => this.put_inheritStyleSheets(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeeditfocus {
        get => this.get_onbeforeeditfocus()
        set => this.put_onbeforeeditfocus(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    releaseCapture() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fForce 
     * @returns {HRESULT} 
     */
    recalc(fForce) {
        result := ComCall(8, this, "short", fForce, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {IHTMLDOMNode} 
     */
    createTextNode(text) {
        if(text is String) {
            pin := BSTR.Alloc(text)
            text := pin.Value
        }

        result := ComCall(9, this, "ptr", text, "ptr*", &newTextNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(newTextNode)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_documentElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_uniqueID() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {VARIANT_BOOL} 
     */
    attachEvent(event, pDisp) {
        if(event is String) {
            pin := BSTR.Alloc(event)
            event := pin.Value
        }

        result := ComCall(12, this, "ptr", event, "ptr", pDisp, "short*", &pfResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfResult
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {HRESULT} 
     */
    detachEvent(event, pDisp) {
        if(event is String) {
            pin := BSTR.Alloc(event)
            event := pin.Value
        }

        result := ComCall(13, this, "ptr", event, "ptr", pDisp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowsdelete(v) {
        result := ComCall(14, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowsdelete() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "int")
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
    put_onrowsinserted(v) {
        result := ComCall(16, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowsinserted() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "int")
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
    put_oncellchange(v) {
        result := ComCall(18, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncellchange() {
        p := VARIANT()
        result := ComCall(19, this, "ptr", p, "int")
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
    put_ondatasetchanged(v) {
        result := ComCall(20, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetchanged() {
        p := VARIANT()
        result := ComCall(21, this, "ptr", p, "int")
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
    put_ondataavailable(v) {
        result := ComCall(22, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondataavailable() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "int")
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
    put_ondatasetcomplete(v) {
        result := ComCall(24, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetcomplete() {
        p := VARIANT()
        result := ComCall(25, this, "ptr", p, "int")
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
    put_onpropertychange(v) {
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
    get_onpropertychange() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "int")
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
    put_dir(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(28, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dir() {
        p := BSTR()
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
    put_oncontextmenu(v) {
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
    get_oncontextmenu() {
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
    put_onstop(v) {
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
    get_onstop() {
        p := VARIANT()
        result := ComCall(33, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    createDocumentFragment() {
        result := ComCall(34, this, "ptr*", &pNewDoc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDocument2(pNewDoc)
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    get_parentDocument() {
        result := ComCall(35, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDocument2(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_enableDownload(v) {
        result := ComCall(36, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_enableDownload() {
        result := ComCall(37, this, "short*", &p := 0, "int")
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
    put_baseUrl(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(38, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_baseUrl() {
        p := BSTR()
        result := ComCall(39, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_childNodes() {
        result := ComCall(40, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_inheritStyleSheets(v) {
        result := ComCall(41, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_inheritStyleSheets() {
        result := ComCall(42, this, "short*", &p := 0, "int")
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
    put_onbeforeeditfocus(v) {
        result := ComCall(43, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeeditfocus() {
        p := VARIANT()
        result := ComCall(44, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByName(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(45, this, "ptr", v, "ptr*", &pelColl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(pelColl)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElement} 
     */
    getElementById(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(46, this, "ptr", v, "ptr*", &pel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(pel)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElementCollection} 
     */
    getElementsByTagName(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(47, this, "ptr", v, "ptr*", &pelColl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElementCollection(pelColl)
    }
}
