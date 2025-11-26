#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAzAuthorizationStore2.ahk

/**
 * Extends the IAzAuthorizationStore2 interface with methods that manage business rule (BizRule) support and caching.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazauthorizationstore3
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzAuthorizationStore3 extends IAzAuthorizationStore2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzAuthorizationStore3
     * @type {Guid}
     */
    static IID => Guid("{abc08425-0c86-4fa0-9be3-7189956c926e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsUpdateNeeded", "BizruleGroupSupported", "UpgradeStoresFunctionalLevel", "IsFunctionalLevelUpgradeSupported", "GetSchemaVersion"]

    /**
     * Checks whether the persisted version of this authorization store is newer than the cached version.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the persisted version of this authorization store is newer than the cached version; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore3-isupdateneeded
     */
    IsUpdateNeeded() {
        result := ComCall(60, this, "short*", &pbIsUpdateNeeded := 0, "HRESULT")
        return pbIsUpdateNeeded
    }

    /**
     * Returns a Boolean value that specifies whether this IAzAuthorizationStore3 object supports application groups that use business rule (BizRule) scripts.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the current <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore3">IAzAuthorizationStore3</a> object supports scripts that use business logic to determine group membership; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore3-bizrulegroupsupported
     */
    BizruleGroupSupported() {
        result := ComCall(61, this, "short*", &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * Upgrades this authorization store from version 1 to version 2.
     * @param {Integer} lFunctionalLevel Specifies the version to which to upgrade the authorization store. Set the value of this parameter to  <b>AZ_AZSTORE_NT6_FUNCTION_LEVEL</b>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore3-upgradestoresfunctionallevel
     */
    UpgradeStoresFunctionalLevel(lFunctionalLevel) {
        result := ComCall(62, this, "int", lFunctionalLevel, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the version of this authorization store can be upgraded.
     * @param {Integer} lFunctionalLevel The version to check. Set this parameter   to <b>AZ_AZSTORE_NT6_FUNCTION_LEVEL</b>.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b>  if the underlying authorization store supports version 2 functionality; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore3-isfunctionallevelupgradesupported
     */
    IsFunctionalLevelUpgradeSupported(lFunctionalLevel) {
        result := ComCall(63, this, "int", lFunctionalLevel, "short*", &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * Gets the version number of this authorization store.
     * @param {Pointer<Integer>} plMajorVersion The major version of the authorization store. Valid values are 1 and 2. A version 1 Authorization Manager (AzMan) runtime cannot read from or write to an authorization store with a major version of 2.
     * @param {Pointer<Integer>} plMinorVersion The minor version of the authorization store. Valid values are 1 and 2. A version 1 AzMan runtime can read from but not write to an authorization store with a minor version of 2.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore3-getschemaversion
     */
    GetSchemaVersion(plMajorVersion, plMinorVersion) {
        plMajorVersionMarshal := plMajorVersion is VarRef ? "int*" : "ptr"
        plMinorVersionMarshal := plMinorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, plMajorVersionMarshal, plMajorVersion, plMinorVersionMarshal, plMinorVersion, "HRESULT")
        return result
    }
}
