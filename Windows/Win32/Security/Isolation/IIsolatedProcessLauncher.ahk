#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Isolation
 */
export default struct IIsolatedProcessLauncher extends IUnknown {
    /**
     * The interface identifier for IIsolatedProcessLauncher
     * @type {Guid}
     */
    static IID := Guid("{1aa24232-9a91-4201-88cb-122f9d6522e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsolatedProcessLauncher interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LaunchProcess            : IntPtr
        ShareDirectory           : IntPtr
        GetContainerGuid         : IntPtr
        AllowSetForegroundAccess : IntPtr
        IsContainerRunning       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsolatedProcessLauncher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} process 
     * @param {PWSTR} arguments 
     * @param {PWSTR} workingDirectory 
     * @returns {HRESULT} 
     */
    LaunchProcess(process, arguments, workingDirectory) {
        process := process is String ? StrPtr(process) : process
        arguments := arguments is String ? StrPtr(arguments) : arguments
        workingDirectory := workingDirectory is String ? StrPtr(workingDirectory) : workingDirectory

        result := ComCall(3, this, "ptr", process, "ptr", arguments, "ptr", workingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} hostPath 
     * @param {PWSTR} containerPath 
     * @param {BOOL} readOnly 
     * @returns {HRESULT} 
     */
    ShareDirectory(hostPath, containerPath, readOnly) {
        hostPath := hostPath is String ? StrPtr(hostPath) : hostPath
        containerPath := containerPath is String ? StrPtr(containerPath) : containerPath

        result := ComCall(4, this, "ptr", hostPath, "ptr", containerPath, BOOL, readOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetContainerGuid() {
        guid := Guid()
        result := ComCall(5, this, Guid.Ptr, guid, "HRESULT")
        return guid
    }

    /**
     * 
     * @param {Integer} pid 
     * @returns {HRESULT} 
     */
    AllowSetForegroundAccess(pid) {
        result := ComCall(6, this, "uint", pid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsContainerRunning() {
        result := ComCall(7, this, BOOL.Ptr, &running := 0, "HRESULT")
        return running
    }

    Query(iid) {
        if (IIsolatedProcessLauncher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LaunchProcess := CallbackCreate(GetMethod(implObj, "LaunchProcess"), flags, 4)
        this.vtbl.ShareDirectory := CallbackCreate(GetMethod(implObj, "ShareDirectory"), flags, 4)
        this.vtbl.GetContainerGuid := CallbackCreate(GetMethod(implObj, "GetContainerGuid"), flags, 2)
        this.vtbl.AllowSetForegroundAccess := CallbackCreate(GetMethod(implObj, "AllowSetForegroundAccess"), flags, 2)
        this.vtbl.IsContainerRunning := CallbackCreate(GetMethod(implObj, "IsContainerRunning"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LaunchProcess)
        CallbackFree(this.vtbl.ShareDirectory)
        CallbackFree(this.vtbl.GetContainerGuid)
        CallbackFree(this.vtbl.AllowSetForegroundAccess)
        CallbackFree(this.vtbl.IsContainerRunning)
    }
}
