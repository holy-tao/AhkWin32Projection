#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoDictionaryOld interface to manipulate the dictionary of Remote Access Dial-In User Service (RADIUS) attributes.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdodictionaryold
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoDictionaryOld extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoDictionaryOld
     * @type {Guid}
     */
    static IID => Guid("{d432e5f4-53d8-11d2-9a3a-00c04fb998ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAttributes", "GetAttributeInfo", "EnumAttributeValues", "CreateAttribute", "GetAttributeID"]

    /**
     * 
     * @param {Pointer<VARIANT>} Id 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-enumattributes
     */
    EnumAttributes(Id) {
        pValues := VARIANT()
        result := ComCall(7, this, "ptr", Id, "ptr", pValues, "HRESULT")
        return pValues
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pInfoIDs 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-getattributeinfo
     */
    GetAttributeInfo(Id, pInfoIDs) {
        pInfoValues := VARIANT()
        result := ComCall(8, this, "uint", Id, "ptr", pInfoIDs, "ptr", pInfoValues, "HRESULT")
        return pInfoValues
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pValueIds 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-enumattributevalues
     */
    EnumAttributeValues(Id, pValueIds) {
        pValuesDesc := VARIANT()
        result := ComCall(9, this, "uint", Id, "ptr", pValueIds, "ptr", pValuesDesc, "HRESULT")
        return pValuesDesc
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-createattribute
     */
    CreateAttribute(Id) {
        result := ComCall(10, this, "uint", Id, "ptr*", &ppAttributeObject := 0, "HRESULT")
        return IDispatch(ppAttributeObject)
    }

    /**
     * 
     * @param {BSTR} bstrAttributeName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdodictionaryold-getattributeid
     */
    GetAttributeID(bstrAttributeName) {
        bstrAttributeName := bstrAttributeName is String ? BSTR.Alloc(bstrAttributeName).Value : bstrAttributeName

        result := ComCall(11, this, "ptr", bstrAttributeName, "uint*", &pId := 0, "HRESULT")
        return pId
    }
}
