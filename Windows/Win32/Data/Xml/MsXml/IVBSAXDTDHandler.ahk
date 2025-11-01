#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXDTDHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXDTDHandler
     * @type {Guid}
     */
    static IID => Guid("{24fb3297-302d-4620-ba39-3a732d850558}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["notationDecl", "unparsedEntityDecl"]

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    notationDecl(strName, strPublicId, strSystemId) {
        result := ComCall(7, this, "ptr", strName, "ptr", strPublicId, "ptr", strSystemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @param {Pointer<BSTR>} strNotationName 
     * @returns {HRESULT} 
     */
    unparsedEntityDecl(strName, strPublicId, strSystemId, strNotationName) {
        result := ComCall(8, this, "ptr", strName, "ptr", strPublicId, "ptr", strSystemId, "ptr", strNotationName, "HRESULT")
        return result
    }
}
