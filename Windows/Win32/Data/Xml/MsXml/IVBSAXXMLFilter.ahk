#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXXMLFilter extends IDispatch{
    /**
     * The interface identifier for IVBSAXXMLFilter
     * @type {Guid}
     */
    static IID => Guid("{1299eb1b-5b88-433e-82de-82ca75ad4e04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IVBSAXXMLReader>} oReader 
     * @returns {HRESULT} 
     */
    get_parent(oReader) {
        result := ComCall(7, this, "ptr", oReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXXMLReader>} oReader 
     * @returns {HRESULT} 
     */
    putref_parent(oReader) {
        result := ComCall(8, this, "ptr", oReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
