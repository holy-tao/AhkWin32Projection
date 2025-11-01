#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGElementInstanceList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGElementInstanceList
     * @type {Guid}
     */
    static IID => Guid("{305104ef-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGElementInstanceList
     * @type {Guid}
     */
    static CLSID => Guid("{30510576-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "item"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGElementInstance>} ppResult 
     * @returns {HRESULT} 
     */
    item(index, ppResult) {
        result := ComCall(8, this, "int", index, "ptr*", ppResult, "HRESULT")
        return result
    }
}
