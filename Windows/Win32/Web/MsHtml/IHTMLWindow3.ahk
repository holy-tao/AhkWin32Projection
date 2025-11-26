#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLDataTransfer.ahk
#Include .\IHTMLWindow2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow3
     * @type {Guid}
     */
    static IID => Guid("{3050f4ae-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_screenLeft", "get_screenTop", "attachEvent", "detachEvent", "setTimeout", "setInterval", "print", "put_onbeforeprint", "get_onbeforeprint", "put_onafterprint", "get_onafterprint", "get_clipboardData", "showModelessDialog"]

    /**
     * @type {Integer} 
     */
    screenLeft {
        get => this.get_screenLeft()
    }

    /**
     * @type {Integer} 
     */
    screenTop {
        get => this.get_screenTop()
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeprint {
        get => this.get_onbeforeprint()
        set => this.put_onbeforeprint(value)
    }

    /**
     * @type {VARIANT} 
     */
    onafterprint {
        get => this.get_onafterprint()
        set => this.put_onafterprint(value)
    }

    /**
     * @type {IHTMLDataTransfer} 
     */
    clipboardData {
        get => this.get_clipboardData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenLeft() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenTop() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {VARIANT_BOOL} 
     */
    attachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(9, this, "ptr", event, "ptr", pDisp, "short*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @returns {HRESULT} 
     */
    detachEvent(event, pDisp) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(10, this, "ptr", event, "ptr", pDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setTimeout(expression, msec, language) {
        result := ComCall(11, this, "ptr", expression, "int", msec, "ptr", language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @param {Pointer<VARIANT>} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setInterval(expression, msec, language) {
        result := ComCall(12, this, "ptr", expression, "int", msec, "ptr", language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    print() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeprint(v) {
        result := ComCall(14, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeprint() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterprint(v) {
        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterprint() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDataTransfer} 
     */
    get_clipboardData() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDataTransfer(p)
    }

    /**
     * 
     * @param {BSTR} url 
     * @param {Pointer<VARIANT>} varArgIn 
     * @param {Pointer<VARIANT>} options 
     * @returns {IHTMLWindow2} 
     */
    showModelessDialog(url, varArgIn, options) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(19, this, "ptr", url, "ptr", varArgIn, "ptr", options, "ptr*", &pDialog := 0, "HRESULT")
        return IHTMLWindow2(pDialog)
    }
}
