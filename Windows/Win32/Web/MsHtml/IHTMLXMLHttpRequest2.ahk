#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLXMLHttpRequest2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLXMLHttpRequest2
     * @type {Guid}
     */
    static IID => Guid("{30510482-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_timeout", "get_timeout", "put_ontimeout", "get_ontimeout"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_timeout(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_timeout(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ontimeout(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_ontimeout(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }
}
