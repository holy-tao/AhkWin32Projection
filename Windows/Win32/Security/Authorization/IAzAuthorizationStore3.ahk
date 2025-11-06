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
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-isupdateneeded
     */
    IsUpdateNeeded() {
        result := ComCall(60, this, "short*", &pbIsUpdateNeeded := 0, "HRESULT")
        return pbIsUpdateNeeded
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-bizrulegroupsupported
     */
    BizruleGroupSupported() {
        result := ComCall(61, this, "short*", &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * 
     * @param {Integer} lFunctionalLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-upgradestoresfunctionallevel
     */
    UpgradeStoresFunctionalLevel(lFunctionalLevel) {
        result := ComCall(62, this, "int", lFunctionalLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFunctionalLevel 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-isfunctionallevelupgradesupported
     */
    IsFunctionalLevelUpgradeSupported(lFunctionalLevel) {
        result := ComCall(63, this, "int", lFunctionalLevel, "short*", &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @param {Pointer<Integer>} plMinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-getschemaversion
     */
    GetSchemaVersion(plMajorVersion, plMinorVersion) {
        plMajorVersionMarshal := plMajorVersion is VarRef ? "int*" : "ptr"
        plMinorVersionMarshal := plMinorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, plMajorVersionMarshal, plMajorVersion, plMinorVersionMarshal, plMinorVersion, "HRESULT")
        return result
    }
}
