#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_screenLeft(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_screenTop(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} event 
     * @param {IDispatch} pDisp 
     * @param {Pointer<VARIANT_BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    attachEvent(event, pDisp, pfResult) {
        event := event is String ? BSTR.Alloc(event).Value : event

        result := ComCall(9, this, "ptr", event, "ptr", pDisp, "ptr", pfResult, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} timerID 
     * @returns {HRESULT} 
     */
    setTimeout(expression, msec, language, timerID) {
        timerIDMarshal := timerID is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", expression, "int", msec, "ptr", language, timerIDMarshal, timerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @param {Pointer<Integer>} timerID 
     * @returns {HRESULT} 
     */
    setInterval(expression, msec, language, timerID) {
        timerIDMarshal := timerID is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", expression, "int", msec, "ptr", language, timerIDMarshal, timerID, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onbeforeprint(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onafterprint(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDataTransfer>} p 
     * @returns {HRESULT} 
     */
    get_clipboardData(p) {
        result := ComCall(18, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} url 
     * @param {Pointer<VARIANT>} varArgIn 
     * @param {Pointer<VARIANT>} options 
     * @param {Pointer<IHTMLWindow2>} pDialog 
     * @returns {HRESULT} 
     */
    showModelessDialog(url, varArgIn, options, pDialog) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(19, this, "ptr", url, "ptr", varArgIn, "ptr", options, "ptr*", pDialog, "HRESULT")
        return result
    }
}
