#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not currently implemented and should not be used.
 * @remarks
 * 
  * The methods for this interface are not fully implemented at this time.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-idirectoryschemamgmt
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDirectorySchemaMgmt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectorySchemaMgmt
     * @type {Guid}
     */
    static IID => Guid("{75db3b9c-a4d8-11d0-a79c-00c04fd8d5a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAttributes", "CreateAttributeDefinition", "WriteAttributeDefinition", "DeleteAttributeDefinition", "EnumClasses", "WriteClassDefinition", "CreateClassDefinition", "DeleteClassDefinition"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszAttrNames 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<Pointer<ADS_ATTR_DEF>>} ppAttrDefinition 
     * @param {Pointer<Integer>} pdwNumAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    EnumAttributes(ppszAttrNames, dwNumAttributes, ppAttrDefinition, pdwNumAttributes) {
        result := ComCall(3, this, "ptr", ppszAttrNames, "uint", dwNumAttributes, "ptr*", ppAttrDefinition, "uint*", pdwNumAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<ADS_ATTR_DEF>} pAttributeDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    CreateAttributeDefinition(pszAttributeName, pAttributeDefinition) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(4, this, "ptr", pszAttributeName, "ptr", pAttributeDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<ADS_ATTR_DEF>} pAttributeDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    WriteAttributeDefinition(pszAttributeName, pAttributeDefinition) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(5, this, "ptr", pszAttributeName, "ptr", pAttributeDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    DeleteAttributeDefinition(pszAttributeName) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(6, this, "ptr", pszAttributeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszClassNames 
     * @param {Integer} dwNumClasses 
     * @param {Pointer<Pointer<ADS_CLASS_DEF>>} ppClassDefinition 
     * @param {Pointer<Integer>} pdwNumClasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    EnumClasses(ppszClassNames, dwNumClasses, ppClassDefinition, pdwNumClasses) {
        result := ComCall(7, this, "ptr", ppszClassNames, "uint", dwNumClasses, "ptr*", ppClassDefinition, "uint*", pdwNumClasses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszClassName 
     * @param {Pointer<ADS_CLASS_DEF>} pClassDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    WriteClassDefinition(pszClassName, pClassDefinition) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(8, this, "ptr", pszClassName, "ptr", pClassDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszClassName 
     * @param {Pointer<ADS_CLASS_DEF>} pClassDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    CreateClassDefinition(pszClassName, pClassDefinition) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(9, this, "ptr", pszClassName, "ptr", pClassDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    DeleteClassDefinition(pszClassName) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(10, this, "ptr", pszClassName, "HRESULT")
        return result
    }
}
