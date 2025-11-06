#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetZoneManager.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetZoneManagerEx extends IInternetZoneManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetZoneManagerEx
     * @type {Guid}
     */
    static IID => Guid("{a4c23339-8e06-431e-9bf4-7e711c085648}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetZoneActionPolicyEx", "SetZoneActionPolicyEx"]

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetZoneActionPolicyEx(dwZone, dwAction, cbPolicy, urlZoneReg, dwFlags) {
        result := ComCall(15, this, "uint", dwZone, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, "int", urlZoneReg, "uint", dwFlags, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetZoneActionPolicyEx(dwZone, dwAction, pPolicy, cbPolicy, urlZoneReg, dwFlags) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "uint", dwZone, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, "int", urlZoneReg, "uint", dwFlags, "HRESULT")
        return result
    }
}
