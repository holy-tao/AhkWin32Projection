#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzAuthorizationStore2.ahk" { IAzAuthorizationStore2 }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Extends the IAzAuthorizationStore2 interface with methods that manage business rule (BizRule) support and caching.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazauthorizationstore3
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzAuthorizationStore3 extends IAzAuthorizationStore2 {
    /**
     * The interface identifier for IAzAuthorizationStore3
     * @type {Guid}
     */
    static IID := Guid("{abc08425-0c86-4fa0-9be3-7189956c926e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzAuthorizationStore3 interfaces
    */
    struct Vtbl extends IAzAuthorizationStore2.Vtbl {
        IsUpdateNeeded                    : IntPtr
        BizruleGroupSupported             : IntPtr
        UpgradeStoresFunctionalLevel      : IntPtr
        IsFunctionalLevelUpgradeSupported : IntPtr
        GetSchemaVersion                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzAuthorizationStore3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks whether the persisted version of this authorization store is newer than the cached version.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the persisted version of this authorization store is newer than the cached version; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-isupdateneeded
     */
    IsUpdateNeeded() {
        result := ComCall(60, this, VARIANT_BOOL.Ptr, &pbIsUpdateNeeded := 0, "HRESULT")
        return pbIsUpdateNeeded
    }

    /**
     * Returns a Boolean value that specifies whether this IAzAuthorizationStore3 object supports application groups that use business rule (BizRule) scripts.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the current <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore3">IAzAuthorizationStore3</a> object supports scripts that use business logic to determine group membership; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-bizrulegroupsupported
     */
    BizruleGroupSupported() {
        result := ComCall(61, this, VARIANT_BOOL.Ptr, &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * Upgrades this authorization store from version 1 to version 2.
     * @remarks
     * If the authorization store being updated is an Active Directory store, this method checks whether the LDAP schema of the Active Directory store is updated. If the LDAP schema of the Active Directory store is not updated, the authorization store is not updated.
     * @param {Integer} lFunctionalLevel Specifies the version to which to upgrade the authorization store. Set the value of this parameter to  <b>AZ_AZSTORE_NT6_FUNCTION_LEVEL</b>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-upgradestoresfunctionallevel
     */
    UpgradeStoresFunctionalLevel(lFunctionalLevel) {
        result := ComCall(62, this, "int", lFunctionalLevel, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the version of this authorization store can be upgraded.
     * @param {Integer} lFunctionalLevel The version to check. Set this parameter   to <b>AZ_AZSTORE_NT6_FUNCTION_LEVEL</b>.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b>  if the underlying authorization store supports version 2 functionality; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-isfunctionallevelupgradesupported
     */
    IsFunctionalLevelUpgradeSupported(lFunctionalLevel) {
        result := ComCall(63, this, "int", lFunctionalLevel, VARIANT_BOOL.Ptr, &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * Gets the version number of this authorization store.
     * @param {Pointer<Integer>} plMajorVersion The major version of the authorization store. Valid values are 1 and 2. A version 1 Authorization Manager (AzMan) runtime cannot read from or write to an authorization store with a major version of 2.
     * @param {Pointer<Integer>} plMinorVersion The minor version of the authorization store. Valid values are 1 and 2. A version 1 AzMan runtime can read from but not write to an authorization store with a minor version of 2.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-getschemaversion
     */
    GetSchemaVersion(plMajorVersion, plMinorVersion) {
        plMajorVersionMarshal := plMajorVersion is VarRef ? "int*" : "ptr"
        plMinorVersionMarshal := plMinorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, plMajorVersionMarshal, plMajorVersion, plMinorVersionMarshal, plMinorVersion, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAzAuthorizationStore3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsUpdateNeeded := CallbackCreate(GetMethod(implObj, "IsUpdateNeeded"), flags, 2)
        this.vtbl.BizruleGroupSupported := CallbackCreate(GetMethod(implObj, "BizruleGroupSupported"), flags, 2)
        this.vtbl.UpgradeStoresFunctionalLevel := CallbackCreate(GetMethod(implObj, "UpgradeStoresFunctionalLevel"), flags, 2)
        this.vtbl.IsFunctionalLevelUpgradeSupported := CallbackCreate(GetMethod(implObj, "IsFunctionalLevelUpgradeSupported"), flags, 3)
        this.vtbl.GetSchemaVersion := CallbackCreate(GetMethod(implObj, "GetSchemaVersion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsUpdateNeeded)
        CallbackFree(this.vtbl.BizruleGroupSupported)
        CallbackFree(this.vtbl.UpgradeStoresFunctionalLevel)
        CallbackFree(this.vtbl.IsFunctionalLevelUpgradeSupported)
        CallbackFree(this.vtbl.GetSchemaVersion)
    }
}
