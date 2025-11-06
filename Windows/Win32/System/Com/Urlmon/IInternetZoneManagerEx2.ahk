#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetZoneManagerEx.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetZoneManagerEx2 extends IInternetZoneManagerEx{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetZoneAttributesEx", "GetZoneSecurityState", "GetIESecurityState", "FixUnsecureSettings"]

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetZoneAttributesEx(dwZone, pZoneAttributes, dwFlags) {
        result := ComCall(17, this, "uint", dwZone, "ptr", pZoneAttributes, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZoneIndex 
     * @param {BOOL} fRespectPolicy 
     * @param {Pointer<Integer>} pdwState 
     * @param {Pointer<BOOL>} pfPolicyEncountered 
     * @returns {HRESULT} 
     */
    GetZoneSecurityState(dwZoneIndex, fRespectPolicy, pdwState, pfPolicyEncountered) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pfPolicyEncounteredMarshal := pfPolicyEncountered is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "uint", dwZoneIndex, "int", fRespectPolicy, pdwStateMarshal, pdwState, pfPolicyEncounteredMarshal, pfPolicyEncountered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fRespectPolicy 
     * @param {Pointer<Integer>} pdwState 
     * @param {Pointer<BOOL>} pfPolicyEncountered 
     * @param {BOOL} fNoCache 
     * @returns {HRESULT} 
     */
    GetIESecurityState(fRespectPolicy, pdwState, pfPolicyEncountered, fNoCache) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pfPolicyEncounteredMarshal := pfPolicyEncountered is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "int", fRespectPolicy, pdwStateMarshal, pdwState, pfPolicyEncounteredMarshal, pfPolicyEncountered, "int", fNoCache, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FixUnsecureSettings() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
