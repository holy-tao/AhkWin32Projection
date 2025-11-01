#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXEntityResolver extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXEntityResolver
     * @type {Guid}
     */
    static IID => Guid("{0c05d096-f45b-4aca-ad1a-aa0bc25518dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["resolveEntity"]

    /**
     * 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @param {Pointer<VARIANT>} varInput 
     * @returns {HRESULT} 
     */
    resolveEntity(strPublicId, strSystemId, varInput) {
        result := ComCall(7, this, "ptr", strPublicId, "ptr", strSystemId, "ptr", varInput, "HRESULT")
        return result
    }
}
