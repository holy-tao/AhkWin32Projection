#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ITypeLibRegistration extends IUnknown {
    /**
     * The interface identifier for ITypeLibRegistration
     * @type {Guid}
     */
    static IID := Guid("{76a3e735-02df-4a12-98eb-043ad3600af3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeLibRegistration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGuid        : IntPtr
        GetVersion     : IntPtr
        GetLcid        : IntPtr
        GetWin32Path   : IntPtr
        GetWin64Path   : IntPtr
        GetDisplayName : IntPtr
        GetFlags       : IntPtr
        GetHelpDir     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeLibRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetGuid() {
        pGuid := Guid()
        result := ComCall(3, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getversionexa">GetVersionEx</a> function was developed because many existing applications err when examining the packed <b>DWORD</b> value returned by 
     * <b>GetVersion</b>, transposing the major and minor version numbers. 
     * <b>GetVersionEx</b> forces applications to explicitly examine each element of version information. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa">VerifyVersionInfo</a> eliminates further potential for error by comparing the required system version with the current system version for you.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        pVersion := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pVersion, "HRESULT")
        return pVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLcid() {
        result := ComCall(5, this, "uint*", &pLcid := 0, "HRESULT")
        return pLcid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetWin32Path() {
        pWin32Path := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pWin32Path, "HRESULT")
        return pWin32Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetWin64Path() {
        pWin64Path := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pWin64Path, "HRESULT")
        return pWin64Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pDisplayName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pDisplayName, "HRESULT")
        return pDisplayName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(9, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHelpDir() {
        pHelpDir := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pHelpDir, "HRESULT")
        return pHelpDir
    }

    Query(iid) {
        if (ITypeLibRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGuid := CallbackCreate(GetMethod(implObj, "GetGuid"), flags, 2)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 2)
        this.vtbl.GetLcid := CallbackCreate(GetMethod(implObj, "GetLcid"), flags, 2)
        this.vtbl.GetWin32Path := CallbackCreate(GetMethod(implObj, "GetWin32Path"), flags, 2)
        this.vtbl.GetWin64Path := CallbackCreate(GetMethod(implObj, "GetWin64Path"), flags, 2)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.GetHelpDir := CallbackCreate(GetMethod(implObj, "GetHelpDir"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGuid)
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.GetLcid)
        CallbackFree(this.vtbl.GetWin32Path)
        CallbackFree(this.vtbl.GetWin64Path)
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetHelpDir)
    }
}
