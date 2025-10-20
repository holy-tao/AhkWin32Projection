#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgSysPrep extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgSysPrep
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae98-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HrSetupSetFirstDword", "HrSetupSetFirstString", "HrSetupSetFirstStringAsBool", "HrSetupSetFirstMultiSzField"]

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstDword(pwszSection, pwszKey, dwValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey

        result := ComCall(3, this, "ptr", pwszSection, "ptr", pwszKey, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstString(pwszSection, pwszKey, pwszValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(4, this, "ptr", pwszSection, "ptr", pwszKey, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {BOOL} fValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstStringAsBool(pwszSection, pwszKey, fValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey

        result := ComCall(5, this, "ptr", pwszSection, "ptr", pwszKey, "int", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {PWSTR} pmszValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstMultiSzField(pwszSection, pwszKey, pmszValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey
        pmszValue := pmszValue is String ? StrPtr(pmszValue) : pmszValue

        result := ComCall(6, this, "ptr", pwszSection, "ptr", pwszKey, "ptr", pmszValue, "HRESULT")
        return result
    }
}
