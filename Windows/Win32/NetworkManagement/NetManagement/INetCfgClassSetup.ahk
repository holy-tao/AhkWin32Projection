#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetCfgComponent.ahk
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
     * @returns {INetCfgComponent} 
     */
    SelectAndInstall(hwndParent, pOboToken) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pOboToken, "ptr*", &ppnccItem := 0, "HRESULT")
        return INetCfgComponent(ppnccItem)
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Install element specifies values used by Windows Media Player to install an online store.
     * @remarks
     * If any of the required attributes are missing or not available, Windows Media Player setup will not attempt to download and install the online store provider code. Setup will configure the offline default values as specified in the **ServiceInfo** document. **ServiceInfo** can be used when not connected to the Internet by passing the default provider name and the **ServiceInfo** information as command-line parameters. See [Redistributing Windows Media Player Software](redistributing-windows-media-player-software.md) for details about command-line options.
     * 
     * > [!Note]  
     * > Use of this element requires that you sign a redistribution agreement with Microsoft. Contact your business representative for details.
     * @param {PWSTR} pszwInfId 
     * @param {Pointer<OBO_TOKEN>} pOboToken 
     * @param {Integer} dwSetupFlags 
     * @param {Integer} dwUpgradeFromBuildNo 
     * @param {PWSTR} pszwAnswerFile 
     * @param {PWSTR} pszwAnswerSections 
     * @returns {INetCfgComponent} 
     * @see https://learn.microsoft.com/windows/win32/WMP/install-element
     */
    Install(pszwInfId, pOboToken, dwSetupFlags, dwUpgradeFromBuildNo, pszwAnswerFile, pszwAnswerSections) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId
        pszwAnswerFile := pszwAnswerFile is String ? StrPtr(pszwAnswerFile) : pszwAnswerFile
        pszwAnswerSections := pszwAnswerSections is String ? StrPtr(pszwAnswerSections) : pszwAnswerSections

        result := ComCall(4, this, "ptr", pszwInfId, "ptr", pOboToken, "uint", dwSetupFlags, "uint", dwUpgradeFromBuildNo, "ptr", pszwAnswerFile, "ptr", pszwAnswerSections, "ptr*", &ppnccItem := 0, "HRESULT")
        return INetCfgComponent(ppnccItem)
    }

    /**
     * 
     * @param {INetCfgComponent} pComponent 
     * @param {Pointer<OBO_TOKEN>} pOboToken 
     * @param {Pointer<PWSTR>} pmszwRefs 
     * @returns {HRESULT} 
     */
    DeInstall(pComponent, pOboToken, pmszwRefs) {
        pmszwRefsMarshal := pmszwRefs is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pComponent, "ptr", pOboToken, pmszwRefsMarshal, pmszwRefs, "HRESULT")
        return result
    }
}
