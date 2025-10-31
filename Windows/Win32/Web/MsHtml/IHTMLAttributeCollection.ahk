#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAttributeCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAttributeCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f4c3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAttributeCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4cc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "get__newEnum", "item"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} p 
     * @returns {HRESULT} 
     */
    get__newEnum(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} name 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    item(name, pdisp) {
        result := ComCall(9, this, "ptr", name, "ptr*", pdisp, "HRESULT")
        return result
    }
}
