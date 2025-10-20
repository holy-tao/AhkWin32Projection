#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that query and set default applications for specific file Association Type, and protocols at a specific Association Level.
 * @remarks
 * 
  * Because <b>IApplicationAssociationRegistration</b> is only supported for Windows Vista and Windows 7, applications that support earlier operating systems must use their preexisting code in relation to defaults when running under those operating systems. Those applications should include a check for the operating system version to account for this.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iapplicationassociationregistration
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationAssociationRegistration extends IUnknown{
    /**
     * The interface identifier for IApplicationAssociationRegistration
     * @type {Guid}
     */
    static IID => Guid("{4e530b0a-e611-4c77-a3ac-9031d022281b}")

    /**
     * The class identifier for ApplicationAssociationRegistration
     * @type {Guid}
     */
    static CLSID => Guid("{591209c7-767b-42b2-9fba-44ee4615f2c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszQuery 
     * @param {Integer} atQueryType 
     * @param {Integer} alQueryLevel 
     * @param {Pointer<PWSTR>} ppszAssociation 
     * @returns {HRESULT} 
     */
    QueryCurrentDefault(pszQuery, atQueryType, alQueryLevel, ppszAssociation) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(3, this, "ptr", pszQuery, "int", atQueryType, "int", alQueryLevel, "ptr", ppszAssociation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszQuery 
     * @param {Integer} atQueryType 
     * @param {Integer} alQueryLevel 
     * @param {PWSTR} pszAppRegistryName 
     * @param {Pointer<BOOL>} pfDefault 
     * @returns {HRESULT} 
     */
    QueryAppIsDefault(pszQuery, atQueryType, alQueryLevel, pszAppRegistryName, pfDefault) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(4, this, "ptr", pszQuery, "int", atQueryType, "int", alQueryLevel, "ptr", pszAppRegistryName, "ptr", pfDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} alQueryLevel 
     * @param {PWSTR} pszAppRegistryName 
     * @param {Pointer<BOOL>} pfDefault 
     * @returns {HRESULT} 
     */
    QueryAppIsDefaultAll(alQueryLevel, pszAppRegistryName, pfDefault) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(5, this, "int", alQueryLevel, "ptr", pszAppRegistryName, "ptr", pfDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAppRegistryName 
     * @param {PWSTR} pszSet 
     * @param {Integer} atSetType 
     * @returns {HRESULT} 
     */
    SetAppAsDefault(pszAppRegistryName, pszSet, atSetType) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName
        pszSet := pszSet is String ? StrPtr(pszSet) : pszSet

        result := ComCall(6, this, "ptr", pszAppRegistryName, "ptr", pszSet, "int", atSetType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAppRegistryName 
     * @returns {HRESULT} 
     */
    SetAppAsDefaultAll(pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(7, this, "ptr", pszAppRegistryName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearUserAssociations() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
