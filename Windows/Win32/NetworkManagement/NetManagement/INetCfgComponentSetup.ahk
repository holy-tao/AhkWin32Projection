#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentSetup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentSetup
     * @type {Guid}
     */
    static IID => Guid("{932238e3-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Install", "Upgrade", "ReadAnswerFile", "Removing"]

    /**
     * 
     * @param {Integer} dwSetupFlags 
     * @returns {HRESULT} 
     */
    Install(dwSetupFlags) {
        result := ComCall(3, this, "uint", dwSetupFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSetupFlags 
     * @param {Integer} dwUpgradeFomBuildNo 
     * @returns {HRESULT} 
     */
    Upgrade(dwSetupFlags, dwUpgradeFomBuildNo) {
        result := ComCall(4, this, "uint", dwSetupFlags, "uint", dwUpgradeFomBuildNo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwAnswerFile 
     * @param {PWSTR} pszwAnswerSections 
     * @returns {HRESULT} 
     */
    ReadAnswerFile(pszwAnswerFile, pszwAnswerSections) {
        pszwAnswerFile := pszwAnswerFile is String ? StrPtr(pszwAnswerFile) : pszwAnswerFile
        pszwAnswerSections := pszwAnswerSections is String ? StrPtr(pszwAnswerSections) : pszwAnswerSections

        result := ComCall(5, this, "ptr", pszwAnswerFile, "ptr", pszwAnswerSections, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Removing() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
