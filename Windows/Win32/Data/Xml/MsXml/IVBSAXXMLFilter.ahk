#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IVBSAXXMLReader.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXXMLFilter extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_parent", "putref_parent"]

    /**
     * @type {IVBSAXXMLReader} 
     */
    parent {
        get => this.get_parent()
    }

    /**
     * 
     * @returns {IVBSAXXMLReader} 
     */
    get_parent() {
        result := ComCall(7, this, "ptr*", &oReader := 0, "HRESULT")
        return IVBSAXXMLReader(oReader)
    }

    /**
     * 
     * @param {IVBSAXXMLReader} oReader 
     * @returns {HRESULT} 
     */
    putref_parent(oReader) {
        result := ComCall(8, this, "ptr", oReader, "HRESULT")
        return result
    }
}
