#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentSetup extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentSetup
     * @type {Guid}
     */
    static IID := Guid("{932238e3-bea1-11d0-9298-00c04fc99dcf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentSetup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Install        : IntPtr
        Upgrade        : IntPtr
        ReadAnswerFile : IntPtr
        Removing       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentSetup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Install element specifies values used by Windows Media Player to install an online store.
     * @remarks
     * If any of the required attributes are missing or not available, Windows Media Player setup will not attempt to download and install the online store provider code. Setup will configure the offline default values as specified in the **ServiceInfo** document. **ServiceInfo** can be used when not connected to the Internet by passing the default provider name and the **ServiceInfo** information as command-line parameters. See [Redistributing Windows Media Player Software](redistributing-windows-media-player-software.md) for details about command-line options.
     * 
     * > [!Note]  
     * > Use of this element requires that you sign a redistribution agreement with Microsoft. Contact your business representative for details.
     * @param {Integer} dwSetupFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/install-element
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

    Query(iid) {
        if (INetCfgComponentSetup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Install := CallbackCreate(GetMethod(implObj, "Install"), flags, 2)
        this.vtbl.Upgrade := CallbackCreate(GetMethod(implObj, "Upgrade"), flags, 3)
        this.vtbl.ReadAnswerFile := CallbackCreate(GetMethod(implObj, "ReadAnswerFile"), flags, 3)
        this.vtbl.Removing := CallbackCreate(GetMethod(implObj, "Removing"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Install)
        CallbackFree(this.vtbl.Upgrade)
        CallbackFree(this.vtbl.ReadAnswerFile)
        CallbackFree(this.vtbl.Removing)
    }
}
