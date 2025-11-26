#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEventObj3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEventObj3
     * @type {Guid}
     */
    static IID => Guid("{3050f680-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_contentOverflow", "put_shiftLeft", "get_shiftLeft", "put_altLeft", "get_altLeft", "put_ctrlLeft", "get_ctrlLeft", "get_imeCompositionChange", "get_imeNotifyCommand", "get_imeNotifyData", "get_imeRequest", "get_imeRequestData", "get_keyboardLayout", "get_behaviorCookie", "get_behaviorPart", "get_nextPage"]

    /**
     * @type {VARIANT_BOOL} 
     */
    contentOverflow {
        get => this.get_contentOverflow()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shiftLeft {
        get => this.get_shiftLeft()
        set => this.put_shiftLeft(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    altLeft {
        get => this.get_altLeft()
        set => this.put_altLeft(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ctrlLeft {
        get => this.get_ctrlLeft()
        set => this.put_ctrlLeft(value)
    }

    /**
     * @type {Pointer} 
     */
    imeCompositionChange {
        get => this.get_imeCompositionChange()
    }

    /**
     * @type {Pointer} 
     */
    imeNotifyCommand {
        get => this.get_imeNotifyCommand()
    }

    /**
     * @type {Pointer} 
     */
    imeNotifyData {
        get => this.get_imeNotifyData()
    }

    /**
     * @type {Pointer} 
     */
    imeRequest {
        get => this.get_imeRequest()
    }

    /**
     * @type {Pointer} 
     */
    imeRequestData {
        get => this.get_imeRequestData()
    }

    /**
     * @type {Pointer} 
     */
    keyboardLayout {
        get => this.get_keyboardLayout()
    }

    /**
     * @type {Integer} 
     */
    behaviorCookie {
        get => this.get_behaviorCookie()
    }

    /**
     * @type {Integer} 
     */
    behaviorPart {
        get => this.get_behaviorPart()
    }

    /**
     * @type {BSTR} 
     */
    nextPage {
        get => this.get_nextPage()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_contentOverflow() {
        result := ComCall(7, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_shiftLeft(v) {
        result := ComCall(8, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftLeft() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_altLeft(v) {
        result := ComCall(10, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altLeft() {
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_ctrlLeft(v) {
        result := ComCall(12, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlLeft() {
        result := ComCall(13, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeCompositionChange() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeNotifyCommand() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeNotifyData() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeRequest() {
        result := ComCall(17, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_imeRequestData() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_keyboardLayout() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_behaviorCookie() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_behaviorPart() {
        result := ComCall(21, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nextPage() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }
}
