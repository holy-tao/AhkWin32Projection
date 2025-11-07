#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAttributeGet interface gets key/value pairs from an object, where the key is a GUID and the value is any binary data.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAttributeGet)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nn-dsattrib-iattributeget
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAttributeGet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAttributeGet
     * @type {Guid}
     */
    static IID => Guid("{52dbd1ec-e48f-4528-9232-f442a68f0ae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAttribIndexed", "GetAttrib"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dsattrib/nf-dsattrib-iattributeget-getcount
     */
    GetCount() {
        result := ComCall(3, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} pbAttribute 
     * @param {Pointer<Integer>} pdwAttributeLength 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/dsattrib/nf-dsattrib-iattributeget-getattribindexed
     */
    GetAttribIndexed(lIndex, pbAttribute, pdwAttributeLength) {
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pdwAttributeLengthMarshal := pdwAttributeLength is VarRef ? "uint*" : "ptr"

        pguidAttribute := Guid()
        result := ComCall(4, this, "int", lIndex, "ptr", pguidAttribute, pbAttributeMarshal, pbAttribute, pdwAttributeLengthMarshal, pdwAttributeLength, "HRESULT")
        return pguidAttribute
    }

    /**
     * 
     * @param {Guid} guidAttribute 
     * @param {Pointer<Integer>} pbAttribute 
     * @param {Pointer<Integer>} pdwAttributeLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsattrib/nf-dsattrib-iattributeget-getattrib
     */
    GetAttrib(guidAttribute, pbAttribute, pdwAttributeLength) {
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pdwAttributeLengthMarshal := pdwAttributeLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", guidAttribute, pbAttributeMarshal, pbAttribute, pdwAttributeLengthMarshal, pdwAttributeLength, "HRESULT")
        return result
    }
}
