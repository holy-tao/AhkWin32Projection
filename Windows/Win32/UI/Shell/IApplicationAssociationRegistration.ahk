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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryCurrentDefault", "QueryAppIsDefault", "QueryAppIsDefaultAll", "SetAppAsDefault", "SetAppAsDefaultAll", "ClearUserAssociations"]

    /**
     * 
     * @param {PWSTR} pszQuery 
     * @param {Integer} atQueryType 
     * @param {Integer} alQueryLevel 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-querycurrentdefault
     */
    QueryCurrentDefault(pszQuery, atQueryType, alQueryLevel) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(3, this, "ptr", pszQuery, "int", atQueryType, "int", alQueryLevel, "ptr*", &ppszAssociation := 0, "HRESULT")
        return ppszAssociation
    }

    /**
     * 
     * @param {PWSTR} pszQuery 
     * @param {Integer} atQueryType 
     * @param {Integer} alQueryLevel 
     * @param {PWSTR} pszAppRegistryName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-queryappisdefault
     */
    QueryAppIsDefault(pszQuery, atQueryType, alQueryLevel, pszAppRegistryName) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(4, this, "ptr", pszQuery, "int", atQueryType, "int", alQueryLevel, "ptr", pszAppRegistryName, "int*", &pfDefault := 0, "HRESULT")
        return pfDefault
    }

    /**
     * 
     * @param {Integer} alQueryLevel 
     * @param {PWSTR} pszAppRegistryName 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-queryappisdefaultall
     */
    QueryAppIsDefaultAll(alQueryLevel, pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(5, this, "int", alQueryLevel, "ptr", pszAppRegistryName, "int*", &pfDefault := 0, "HRESULT")
        return pfDefault
    }

    /**
     * 
     * @param {PWSTR} pszAppRegistryName 
     * @param {PWSTR} pszSet 
     * @param {Integer} atSetType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-setappasdefault
     */
    SetAppAsDefault(pszAppRegistryName, pszSet, atSetType) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName
        pszSet := pszSet is String ? StrPtr(pszSet) : pszSet

        result := ComCall(6, this, "ptr", pszAppRegistryName, "ptr", pszSet, "int", atSetType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAppRegistryName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-setappasdefaultall
     */
    SetAppAsDefaultAll(pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(7, this, "ptr", pszAppRegistryName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-clearuserassociations
     */
    ClearUserAssociations() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
