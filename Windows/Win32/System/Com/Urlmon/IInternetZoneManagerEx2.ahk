#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetZoneManagerEx.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetZoneManagerEx2 extends IInternetZoneManagerEx{
    /**
     * The interface identifier for IInternetZoneManagerEx2
     * @type {Guid}
     */
    static IID => Guid("{edc17559-dd5d-4846-8eef-8becba5a4abf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetZoneAttributesEx(dwZone, pZoneAttributes, dwFlags) {
        result := ComCall(17, this, "uint", dwZone, "ptr", pZoneAttributes, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZoneIndex 
     * @param {BOOL} fRespectPolicy 
     * @param {Pointer<UInt32>} pdwState 
     * @param {Pointer<BOOL>} pfPolicyEncountered 
     * @returns {HRESULT} 
     */
    GetZoneSecurityState(dwZoneIndex, fRespectPolicy, pdwState, pfPolicyEncountered) {
        result := ComCall(18, this, "uint", dwZoneIndex, "int", fRespectPolicy, "uint*", pdwState, "ptr", pfPolicyEncountered, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fRespectPolicy 
     * @param {Pointer<UInt32>} pdwState 
     * @param {Pointer<BOOL>} pfPolicyEncountered 
     * @param {BOOL} fNoCache 
     * @returns {HRESULT} 
     */
    GetIESecurityState(fRespectPolicy, pdwState, pfPolicyEncountered, fNoCache) {
        result := ComCall(19, this, "int", fRespectPolicy, "uint*", pdwState, "ptr", pfPolicyEncountered, "int", fNoCache, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FixUnsecureSettings() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
