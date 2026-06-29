#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OBO_TOKEN.ahk" { OBO_TOKEN }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgClassSetup extends IUnknown {
    /**
     * The interface identifier for INetCfgClassSetup
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae9d-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgClassSetup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SelectAndInstall : IntPtr
        Install          : IntPtr
        DeInstall        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgClassSetup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<OBO_TOKEN>} pOboToken 
     * @returns {INetCfgComponent} 
     */
    SelectAndInstall(hwndParent, pOboToken) {
        result := ComCall(3, this, HWND, hwndParent, OBO_TOKEN.Ptr, pOboToken, "ptr*", &ppnccItem := 0, "HRESULT")
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

        result := ComCall(4, this, "ptr", pszwInfId, OBO_TOKEN.Ptr, pOboToken, "uint", dwSetupFlags, "uint", dwUpgradeFromBuildNo, "ptr", pszwAnswerFile, "ptr", pszwAnswerSections, "ptr*", &ppnccItem := 0, "HRESULT")
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

        result := ComCall(5, this, "ptr", pComponent, OBO_TOKEN.Ptr, pOboToken, pmszwRefsMarshal, pmszwRefs, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgClassSetup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SelectAndInstall := CallbackCreate(GetMethod(implObj, "SelectAndInstall"), flags, 4)
        this.vtbl.Install := CallbackCreate(GetMethod(implObj, "Install"), flags, 8)
        this.vtbl.DeInstall := CallbackCreate(GetMethod(implObj, "DeInstall"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SelectAndInstall)
        CallbackFree(this.vtbl.Install)
        CallbackFree(this.vtbl.DeInstall)
    }
}
