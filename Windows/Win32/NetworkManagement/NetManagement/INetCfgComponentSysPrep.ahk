#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\INetCfgSysPrep.ahk" { INetCfgSysPrep }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgComponentSysPrep extends IUnknown {
    /**
     * The interface identifier for INetCfgComponentSysPrep
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae9a-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgComponentSysPrep interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SaveAdapterParameters    : IntPtr
        RestoreAdapterParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgComponentSysPrep.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {INetCfgSysPrep} pncsp 
     * @param {PWSTR} pszwAnswerSections 
     * @param {Pointer<Guid>} pAdapterInstanceGuid 
     * @returns {HRESULT} 
     */
    SaveAdapterParameters(pncsp, pszwAnswerSections, pAdapterInstanceGuid) {
        pszwAnswerSections := pszwAnswerSections is String ? StrPtr(pszwAnswerSections) : pszwAnswerSections

        result := ComCall(3, this, "ptr", pncsp, "ptr", pszwAnswerSections, Guid.Ptr, pAdapterInstanceGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwAnswerFile 
     * @param {PWSTR} pszwAnswerSection 
     * @param {Pointer<Guid>} pAdapterInstanceGuid 
     * @returns {HRESULT} 
     */
    RestoreAdapterParameters(pszwAnswerFile, pszwAnswerSection, pAdapterInstanceGuid) {
        pszwAnswerFile := pszwAnswerFile is String ? StrPtr(pszwAnswerFile) : pszwAnswerFile
        pszwAnswerSection := pszwAnswerSection is String ? StrPtr(pszwAnswerSection) : pszwAnswerSection

        result := ComCall(4, this, "ptr", pszwAnswerFile, "ptr", pszwAnswerSection, Guid.Ptr, pAdapterInstanceGuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgComponentSysPrep.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SaveAdapterParameters := CallbackCreate(GetMethod(implObj, "SaveAdapterParameters"), flags, 4)
        this.vtbl.RestoreAdapterParameters := CallbackCreate(GetMethod(implObj, "RestoreAdapterParameters"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SaveAdapterParameters)
        CallbackFree(this.vtbl.RestoreAdapterParameters)
    }
}
