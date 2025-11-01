#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXDeclHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXDeclHandler
     * @type {Guid}
     */
    static IID => Guid("{e8917260-7579-4be1-b5dd-7afbfa6f077b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["elementDecl", "attributeDecl", "internalEntityDecl", "externalEntityDecl"]

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strModel 
     * @returns {HRESULT} 
     */
    elementDecl(strName, strModel) {
        result := ComCall(7, this, "ptr", strName, "ptr", strModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strElementName 
     * @param {Pointer<BSTR>} strAttributeName 
     * @param {Pointer<BSTR>} strType 
     * @param {Pointer<BSTR>} strValueDefault 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    attributeDecl(strElementName, strAttributeName, strType, strValueDefault, strValue) {
        result := ComCall(8, this, "ptr", strElementName, "ptr", strAttributeName, "ptr", strType, "ptr", strValueDefault, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    internalEntityDecl(strName, strValue) {
        result := ComCall(9, this, "ptr", strName, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    externalEntityDecl(strName, strPublicId, strSystemId) {
        result := ComCall(10, this, "ptr", strName, "ptr", strPublicId, "ptr", strSystemId, "HRESULT")
        return result
    }
}
