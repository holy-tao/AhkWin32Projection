#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGNumber extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGNumber
     * @type {Guid}
     */
    static IID => Guid("{305104cb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGNumber
     * @type {Guid}
     */
    static CLSID => Guid("{30510587-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_value", "get_value"]

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_value(p) {
        result := ComCall(8, this, "float*", p, "HRESULT")
        return result
    }
}
