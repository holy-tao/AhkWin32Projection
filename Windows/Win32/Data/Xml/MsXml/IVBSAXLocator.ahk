#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXLocator extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} nColumn 
     * @returns {HRESULT} 
     */
    get_columnNumber(nColumn) {
        result := ComCall(7, this, "int*", nColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} nLine 
     * @returns {HRESULT} 
     */
    get_lineNumber(nLine) {
        result := ComCall(8, this, "int*", nLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPublicId 
     * @returns {HRESULT} 
     */
    get_publicId(strPublicId) {
        result := ComCall(9, this, "ptr", strPublicId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    get_systemId(strSystemId) {
        result := ComCall(10, this, "ptr", strSystemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
