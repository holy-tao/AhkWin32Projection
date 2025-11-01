#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLFontSizesCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLFontSizesCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f377-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "get__newEnum", "get_forFont", "item"]

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
     * @param {Pointer<IUnknown>} p 
     * @returns {HRESULT} 
     */
    get__newEnum(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_forFont(p) {
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     */
    item(index, plSize) {
        plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", index, plSizeMarshal, plSize, "HRESULT")
        return result
    }
}
