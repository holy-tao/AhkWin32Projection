#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgClassSetup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgClassSetup
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae9d-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectAndInstall", "Install", "DeInstall"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<OBO_TOKEN>} pOboToken 
     * @param {Pointer<INetCfgComponent>} ppnccItem 
     * @returns {HRESULT} 
     */
    SelectAndInstall(hwndParent, pOboToken, ppnccItem) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pOboToken, "ptr*", ppnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwInfId 
     * @param {Pointer<OBO_TOKEN>} pOboToken 
     * @param {Integer} dwSetupFlags 
     * @param {Integer} dwUpgradeFromBuildNo 
     * @param {PWSTR} pszwAnswerFile 
     * @param {PWSTR} pszwAnswerSections 
     * @param {Pointer<INetCfgComponent>} ppnccItem 
     * @returns {HRESULT} 
     */
    Install(pszwInfId, pOboToken, dwSetupFlags, dwUpgradeFromBuildNo, pszwAnswerFile, pszwAnswerSections, ppnccItem) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId
        pszwAnswerFile := pszwAnswerFile is String ? StrPtr(pszwAnswerFile) : pszwAnswerFile
        pszwAnswerSections := pszwAnswerSections is String ? StrPtr(pszwAnswerSections) : pszwAnswerSections

        result := ComCall(4, this, "ptr", pszwInfId, "ptr", pOboToken, "uint", dwSetupFlags, "uint", dwUpgradeFromBuildNo, "ptr", pszwAnswerFile, "ptr", pszwAnswerSections, "ptr*", ppnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pComponent 
     * @param {Pointer<OBO_TOKEN>} pOboToken 
     * @param {Pointer<PWSTR>} pmszwRefs 
     * @returns {HRESULT} 
     */
    DeInstall(pComponent, pOboToken, pmszwRefs) {
        result := ComCall(5, this, "ptr", pComponent, "ptr", pOboToken, "ptr", pmszwRefs, "HRESULT")
        return result
    }
}
