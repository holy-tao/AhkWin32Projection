#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugPlmClient2 extends IUnknown {
    /**
     * The interface identifier for IDebugPlmClient2
     * @type {Guid}
     */
    static IID := Guid("{597c980d-e7bd-4309-962c-9d9b69a7372c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugPlmClient2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LaunchPlmPackageForDebugWide : IntPtr
        LaunchPlmBgTaskForDebugWide  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugPlmClient2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} Timeout 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} AppName 
     * @param {PWSTR} Arguments 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @returns {HRESULT} 
     */
    LaunchPlmPackageForDebugWide(Server, Timeout, PackageFullName, AppName, Arguments, ProcessId, ThreadId) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        AppName := AppName is String ? StrPtr(AppName) : AppName
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", Server, "uint", Timeout, "ptr", PackageFullName, "ptr", AppName, "ptr", Arguments, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} Timeout 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} BackgroundTaskId 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @returns {HRESULT} 
     */
    LaunchPlmBgTaskForDebugWide(Server, Timeout, PackageFullName, BackgroundTaskId, ProcessId, ThreadId) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        BackgroundTaskId := BackgroundTaskId is String ? StrPtr(BackgroundTaskId) : BackgroundTaskId

        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", Server, "uint", Timeout, "ptr", PackageFullName, "ptr", BackgroundTaskId, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugPlmClient2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LaunchPlmPackageForDebugWide := CallbackCreate(GetMethod(implObj, "LaunchPlmPackageForDebugWide"), flags, 8)
        this.vtbl.LaunchPlmBgTaskForDebugWide := CallbackCreate(GetMethod(implObj, "LaunchPlmBgTaskForDebugWide"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LaunchPlmPackageForDebugWide)
        CallbackFree(this.vtbl.LaunchPlmBgTaskForDebugWide)
    }
}
