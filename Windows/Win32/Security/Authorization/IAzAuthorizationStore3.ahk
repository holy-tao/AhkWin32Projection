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
     * @param {Pointer<VARIANT_BOOL>} pbIsUpdateNeeded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-isupdateneeded
     */
    IsUpdateNeeded(pbIsUpdateNeeded) {
        result := ComCall(60, this, "ptr", pbIsUpdateNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-bizrulegroupsupported
     */
    BizruleGroupSupported(pbSupported) {
        result := ComCall(61, this, "ptr", pbSupported, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-isfunctionallevelupgradesupported
     */
    IsFunctionalLevelUpgradeSupported(lFunctionalLevel, pbSupported) {
        result := ComCall(63, this, "int", lFunctionalLevel, "ptr", pbSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @param {Pointer<Integer>} plMinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore3-getschemaversion
     */
    GetSchemaVersion(plMajorVersion, plMinorVersion) {
        result := ComCall(64, this, "int*", plMajorVersion, "int*", plMinorVersion, "HRESULT")
        return result
    }
}
