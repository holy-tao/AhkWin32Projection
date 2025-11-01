#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPreserveAspectRatio extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGPreserveAspectRatio
     * @type {Guid}
     */
    static IID => Guid("{305104fa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPreserveAspectRatio
     * @type {Guid}
     */
    static CLSID => Guid("{305105d0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_align", "get_align", "put_meetOrSlice", "get_meetOrSlice"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_align(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_meetOrSlice(v) {
        result := ComCall(9, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_meetOrSlice(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }
}
