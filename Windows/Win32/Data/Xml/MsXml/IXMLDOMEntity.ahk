#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMEntity extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMEntity
     * @type {Guid}
     */
    static IID => Guid("{2933bf8d-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_publicId", "get_systemId", "get_notationName"]

    /**
     * 
     * @param {Pointer<VARIANT>} publicID 
     * @returns {HRESULT} 
     */
    get_publicId(publicID) {
        result := ComCall(43, this, "ptr", publicID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} systemID 
     * @returns {HRESULT} 
     */
    get_systemId(systemID) {
        result := ComCall(44, this, "ptr", systemID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_notationName(name) {
        result := ComCall(45, this, "ptr", name, "HRESULT")
        return result
    }
}
