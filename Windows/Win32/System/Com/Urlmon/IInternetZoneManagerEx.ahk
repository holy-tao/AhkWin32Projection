#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetZoneManager.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetZoneManagerEx extends IInternetZoneManager{
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
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetZoneActionPolicyEx(dwZone, dwAction, pPolicy, cbPolicy, urlZoneReg, dwFlags) {
        result := ComCall(15, this, "uint", dwZone, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "int", urlZoneReg, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetZoneActionPolicyEx(dwZone, dwAction, pPolicy, cbPolicy, urlZoneReg, dwFlags) {
        result := ComCall(16, this, "uint", dwZone, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "int", urlZoneReg, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
