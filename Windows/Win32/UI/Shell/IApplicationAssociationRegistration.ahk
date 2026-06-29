#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ASSOCIATIONTYPE.ahk" { ASSOCIATIONTYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ASSOCIATIONLEVEL.ahk" { ASSOCIATIONLEVEL }

/**
 * Exposes methods that query and set default applications for specific file Association Type, and protocols at a specific Association Level.
 * @remarks
 * Because <b>IApplicationAssociationRegistration</b> is only supported for Windows Vista and Windows 7, applications that support earlier operating systems must use their preexisting code in relation to defaults when running under those operating systems. Those applications should include a check for the operating system version to account for this.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationassociationregistration
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IApplicationAssociationRegistration extends IUnknown {
    /**
     * The interface identifier for IApplicationAssociationRegistration
     * @type {Guid}
     */
    static IID := Guid("{4e530b0a-e611-4c77-a3ac-9031d022281b}")

    /**
     * The class identifier for ApplicationAssociationRegistration
     * @type {Guid}
     */
    static CLSID := Guid("{591209c7-767b-42b2-9fba-44ee4615f2c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApplicationAssociationRegistration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryCurrentDefault   : IntPtr
        QueryAppIsDefault     : IntPtr
        QueryAppIsDefaultAll  : IntPtr
        SetAppAsDefault       : IntPtr
        SetAppAsDefaultAll    : IntPtr
        ClearUserAssociations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApplicationAssociationRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines the default application for a given association type. This is the default application launched by ShellExecute for that type.
     * @remarks
     * The string produced is typically a ProgID matching one of the ProgIDs associated with a registered application, but there are a few exceptions: If the string returned is a machine default protocol, it is a legacy string indicating a command line to a .exe handler instead of a ProgID. Similarly, if returning a machine default MIME type, it returns a legacy class identifier (CLSID) string instead of a ProgID.
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that contains the file name extension or protocol, such as .mp3 or http.
     * @param {ASSOCIATIONTYPE} atQueryType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a> enumeration values that specifies the type of association, such as extension or MIME type.
     * @param {ASSOCIATIONLEVEL} alQueryLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a> enumeration values that specifies the level of association, such as per-user or machine. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">AL_EFFECTIVE</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to the ProgID that identifies the current default association.
     * 
     * <div class="alert"><b>Note</b>  It is the responsibility of the calling application to release the string through <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-querycurrentdefault
     */
    QueryCurrentDefault(pszQuery, atQueryType, alQueryLevel) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(3, this, "ptr", pszQuery, ASSOCIATIONTYPE, atQueryType, ASSOCIATIONLEVEL, alQueryLevel, PWSTR.Ptr, &ppszAssociation := 0, "HRESULT")
        return ppszAssociation
    }

    /**
     * Determines whether an application owns the registered default association for a given application level and type. Not intended for use in Windows 8.
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * A pointer to a <b>null</b>-terminated Unicode string that contains the file name extension or protocol of the application, such as .mp3 or http.
     * @param {ASSOCIATIONTYPE} atQueryType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a> enumeration values that specifies the type of the application named in <i>pszQuery</i>, such as file name extension or MIME type.
     * @param {ASSOCIATIONLEVEL} alQueryLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a> enumeration values that specifies the level of association, such as per-user or machine. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">AL_EFFECTIVE</a>.
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a <b>null</b>-terminated Unicode string that specifies the registered name of the application.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     *  When this method returns, contains <b>TRUE</b> if the application is the default; or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-queryappisdefault
     */
    QueryAppIsDefault(pszQuery, atQueryType, alQueryLevel, pszAppRegistryName) {
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(4, this, "ptr", pszQuery, ASSOCIATIONTYPE, atQueryType, ASSOCIATIONLEVEL, alQueryLevel, "ptr", pszAppRegistryName, BOOL.Ptr, &pfDefault := 0, "HRESULT")
        return pfDefault
    }

    /**
     * Determines whether an application owns all of the registered default associations for a given application level. Not intended for use in Windows 8.
     * @param {ASSOCIATIONLEVEL} alQueryLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a> enumeration values that specifies the level of association, such as per-user or machine. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">AL_EFFECTIVE</a>.
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a <b>null</b>-terminated Unicode string that specifies the registered name of the application.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, contains <b>TRUE</b> if the application is the default for all <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype"> association types</a> at the specified <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationlevel">ASSOCIATIONLEVEL</a>; 
     * or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-queryappisdefaultall
     */
    QueryAppIsDefaultAll(alQueryLevel, pszAppRegistryName) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName

        result := ComCall(5, this, ASSOCIATIONLEVEL, alQueryLevel, "ptr", pszAppRegistryName, BOOL.Ptr, &pfDefault := 0, "HRESULT")
        return pfDefault
    }

    /**
     * Sets an application as the default for a given extension or protocol, provided that the application's publisher matches the current default's. For more information, see Default Programs. Not intended for use in Windows 8.
     * @param {PWSTR} pszAppRegistryName 
     * @param {PWSTR} pszSet 
     * @param {ASSOCIATIONTYPE} atSetType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-associationtype">ASSOCIATIONTYPE</a> enumeration values that specifies the type of the application named in <i>extOrUriScheme</i>, such as file name extension or MIME type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. In particular, if the application's publisher doesn't match the default's, this method returns <b>E_ACCESSDENIED</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-setappasdefault
     */
    SetAppAsDefault(pszAppRegistryName, pszSet, atSetType) {
        pszAppRegistryName := pszAppRegistryName is String ? StrPtr(pszAppRegistryName) : pszAppRegistryName
        pszSet := pszSet is String ? StrPtr(pszSet) : pszSet

        result := ComCall(6, this, "ptr", pszAppRegistryName, "ptr", pszSet, ASSOCIATIONTYPE, atSetType, "HRESULT")
        return result
    }

    /**
     * Sets an application as the default for all of the registered associations of any type for that application. Not intended for use in Windows 8.
     * @param {PWSTR} pszAppRegistryName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the registered name of the application.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-setappasdefaultall
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationassociationregistration-clearuserassociations
     */
    ClearUserAssociations() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IApplicationAssociationRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryCurrentDefault := CallbackCreate(GetMethod(implObj, "QueryCurrentDefault"), flags, 5)
        this.vtbl.QueryAppIsDefault := CallbackCreate(GetMethod(implObj, "QueryAppIsDefault"), flags, 6)
        this.vtbl.QueryAppIsDefaultAll := CallbackCreate(GetMethod(implObj, "QueryAppIsDefaultAll"), flags, 4)
        this.vtbl.SetAppAsDefault := CallbackCreate(GetMethod(implObj, "SetAppAsDefault"), flags, 4)
        this.vtbl.SetAppAsDefaultAll := CallbackCreate(GetMethod(implObj, "SetAppAsDefaultAll"), flags, 2)
        this.vtbl.ClearUserAssociations := CallbackCreate(GetMethod(implObj, "ClearUserAssociations"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryCurrentDefault)
        CallbackFree(this.vtbl.QueryAppIsDefault)
        CallbackFree(this.vtbl.QueryAppIsDefaultAll)
        CallbackFree(this.vtbl.SetAppAsDefault)
        CallbackFree(this.vtbl.SetAppAsDefaultAll)
        CallbackFree(this.vtbl.ClearUserAssociations)
    }
}
