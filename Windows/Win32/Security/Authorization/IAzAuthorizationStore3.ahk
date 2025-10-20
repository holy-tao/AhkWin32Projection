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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsUpdateNeeded 
     * @returns {HRESULT} 
     */
    IsUpdateNeeded(pbIsUpdateNeeded) {
        result := ComCall(60, this, "ptr", pbIsUpdateNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSupported 
     * @returns {HRESULT} 
     */
    BizruleGroupSupported(pbSupported) {
        result := ComCall(61, this, "ptr", pbSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFunctionalLevel 
     * @returns {HRESULT} 
     */
    UpgradeStoresFunctionalLevel(lFunctionalLevel) {
        result := ComCall(62, this, "int", lFunctionalLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFunctionalLevel 
     * @param {Pointer<VARIANT_BOOL>} pbSupported 
     * @returns {HRESULT} 
     */
    IsFunctionalLevelUpgradeSupported(lFunctionalLevel, pbSupported) {
        result := ComCall(63, this, "int", lFunctionalLevel, "ptr", pbSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @param {Pointer<Int32>} plMinorVersion 
     * @returns {HRESULT} 
     */
    GetSchemaVersion(plMajorVersion, plMinorVersion) {
        result := ComCall(64, this, "int*", plMajorVersion, "int*", plMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
