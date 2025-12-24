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
     * Determines the default application for a given association type. This is the default application launched by ShellExecute for that type. Not intended for use in Windows 8.
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that contains the file name extension or protocol, such as .mp3 or http.
     * @param {Integer} atQueryType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a> enumeration values that specifies the type of association, such as extension or MIME type.
     * @param {Integer} alQueryLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a> enumeration values that specifies the level of association, such as per-user or machine. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">AL_EFFECTIVE</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the ProgID that identifies the current default association.
     * 
     * <div class="alert"><b>Note</b>  It is the responsibility of the calling application to release the string through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-querycurrentdefault
     */
    QueryCurrentDefault(pszQuery, atQueryType, alQueryLevel) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(3, this, "ptr", pszQuery, "int", atQueryType, "int", alQueryLevel, "ptr*", &ppszAssociation := 0, "HRESULT")
        return ppszAssociation
    }

    /**
     * Determines whether an application owns the registered default association for a given application level and type. Not intended for use in Windows 8.
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * A pointer to a <b>null</b>-terminated Unicode string that contains the file name extension or protocol of the application, such as .mp3 or http.
     * @param {Integer} atQueryType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a> enumeration values that specifies the type of the application named in <i>pszQuery</i>, such as file name extension or MIME type.
     * @param {Integer} alQueryLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a> enumeration values that specifies the level of association, such as per-user or machine. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">AL_EFFECTIVE</a>.
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a <b>null</b>-terminated Unicode string that specifies the registered name of the application.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     *  When this method returns, contains <b>TRUE</b> if the application is the default; or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-queryappisdefault
     */
    QueryAppIsDefault(pszQuery, atQueryType, alQueryLevel, pszAppRegistryName) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(4, this, "ptr", pszQuery, "int", atQueryType, "int", alQueryLevel, "ptr", pszAppRegistryName, "int*", &pfDefault := 0, "HRESULT")
        return pfDefault
    }

    /**
     * Determines whether an application owns all of the registered default associations for a given application level. Not intended for use in Windows 8.
     * @param {Integer} alQueryLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a> enumeration values that specifies the level of association, such as per-user or machine. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">AL_EFFECTIVE</a>.
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a <b>null</b>-terminated Unicode string that specifies the registered name of the application.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains <b>TRUE</b> if the application is the default for all <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype"> association types</a> at the specified <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a>; 
     * or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-queryappisdefaultall
     */
    QueryAppIsDefaultAll(alQueryLevel, pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(5, this, "int", alQueryLevel, "ptr", pszAppRegistryName, "int*", &pfDefault := 0, "HRESULT")
        return pfDefault
    }

    /**
     * Sets an application as the default for a given extension or protocol, provided that the application's publisher matches the current default's. For more information, see Default Programs. Not intended for use in Windows 8.
     * @param {PWSTR} pszAppRegistryName 
     * @param {PWSTR} pszSet 
     * @param {Integer} atSetType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a> enumeration values that specifies the type of the application named in <i>extOrUriScheme</i>, such as file name extension or MIME type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code. In particular, if the application's publisher doesn't match the default's, this method returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">E_ACCESSDENIED</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-setappasdefault
     */
    SetAppAsDefault(pszAppRegistryName, pszSet, atSetType) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName
        pszSet := pszSet is String ? StrPtr(pszSet) : pszSet

        result := ComCall(6, this, "ptr", pszAppRegistryName, "ptr", pszSet, "int", atSetType, "HRESULT")
        return result
    }

    /**
     * Sets an application as the default for all of the registered associations of any type for that application. Not intended for use in Windows 8.
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the registered name of the application.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-setappasdefaultall
     */
    SetAppAsDefaultAll(pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(7, this, "ptr", pszAppRegistryName, "HRESULT")
        return result
    }

    /**
     * Removes all per-user associations for the current user. This results in a reversion to machine defaults, if they exist. Not intended for use in Windows 8.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-clearuserassociations
     */
    ClearUserAssociations() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
