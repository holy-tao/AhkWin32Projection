#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IWebBridge extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebBridge
     * @type {Guid}
     */
    static IID => Guid("{ae24fdad-03c6-11d1-8b76-0080c744f389}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_URL", "get_URL", "put_Scrollbar", "get_Scrollbar", "put_embed", "get_embed", "get_event", "get_readyState", "AboutBox"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_URL(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_Scrollbar(v) {
        result := ComCall(9, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_Scrollbar(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_embed(v) {
        result := ComCall(11, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_embed(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_event(p) {
        result := ComCall(13, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_readyState(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AboutBox() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
