#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXLocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXLocator
     * @type {Guid}
     */
    static IID => Guid("{796e7ac5-5aa2-4eff-acad-3faaf01a3288}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_columnNumber", "get_lineNumber", "get_publicId", "get_systemId"]

    /**
     * 
     * @param {Pointer<Integer>} nColumn 
     * @returns {HRESULT} 
     */
    get_columnNumber(nColumn) {
        nColumnMarshal := nColumn is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, nColumnMarshal, nColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} nLine 
     * @returns {HRESULT} 
     */
    get_lineNumber(nLine) {
        nLineMarshal := nLine is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, nLineMarshal, nLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPublicId 
     * @returns {HRESULT} 
     */
    get_publicId(strPublicId) {
        result := ComCall(9, this, "ptr", strPublicId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    get_systemId(strSystemId) {
        result := ComCall(10, this, "ptr", strSystemId, "HRESULT")
        return result
    }
}
