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
     * 
     * @param {Pointer<PWSTR>} ppszAttrNames 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<ADS_ATTR_DEF>} ppAttrDefinition 
     * @param {Pointer<UInt32>} pdwNumAttributes 
     * @returns {HRESULT} 
     */
    EnumAttributes(ppszAttrNames, dwNumAttributes, ppAttrDefinition, pdwNumAttributes) {
        result := ComCall(3, this, "ptr", ppszAttrNames, "uint", dwNumAttributes, "ptr", ppAttrDefinition, "uint*", pdwNumAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<ADS_ATTR_DEF>} pAttributeDefinition 
     * @returns {HRESULT} 
     */
    CreateAttributeDefinition(pszAttributeName, pAttributeDefinition) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(4, this, "ptr", pszAttributeName, "ptr", pAttributeDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<ADS_ATTR_DEF>} pAttributeDefinition 
     * @returns {HRESULT} 
     */
    WriteAttributeDefinition(pszAttributeName, pAttributeDefinition) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(5, this, "ptr", pszAttributeName, "ptr", pAttributeDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @returns {HRESULT} 
     */
    DeleteAttributeDefinition(pszAttributeName) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(6, this, "ptr", pszAttributeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszClassNames 
     * @param {Integer} dwNumClasses 
     * @param {Pointer<ADS_CLASS_DEF>} ppClassDefinition 
     * @param {Pointer<UInt32>} pdwNumClasses 
     * @returns {HRESULT} 
     */
    EnumClasses(ppszClassNames, dwNumClasses, ppClassDefinition, pdwNumClasses) {
        result := ComCall(7, this, "ptr", ppszClassNames, "uint", dwNumClasses, "ptr", ppClassDefinition, "uint*", pdwNumClasses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszClassName 
     * @param {Pointer<ADS_CLASS_DEF>} pClassDefinition 
     * @returns {HRESULT} 
     */
    WriteClassDefinition(pszClassName, pClassDefinition) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(8, this, "ptr", pszClassName, "ptr", pClassDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszClassName 
     * @param {Pointer<ADS_CLASS_DEF>} pClassDefinition 
     * @returns {HRESULT} 
     */
    CreateClassDefinition(pszClassName, pClassDefinition) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(9, this, "ptr", pszClassName, "ptr", pClassDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszClassName 
     * @returns {HRESULT} 
     */
    DeleteClassDefinition(pszClassName) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(10, this, "ptr", pszClassName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
