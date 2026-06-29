#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugOutputStream.ahk" { IDebugOutputStream }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugPlmClient3 extends IUnknown {
    /**
     * The interface identifier for IDebugPlmClient3
     * @type {Guid}
     */
    static IID := Guid("{d4a5dbd1-ca02-4d90-856a-2a92bfd0f20f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugPlmClient3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LaunchPlmPackageForDebugWide  : IntPtr
        LaunchPlmBgTaskForDebugWide   : IntPtr
        QueryPlmPackageWide           : IntPtr
        QueryPlmPackageList           : IntPtr
        EnablePlmPackageDebugWide     : IntPtr
        DisablePlmPackageDebugWide    : IntPtr
        SuspendPlmPackageWide         : IntPtr
        ResumePlmPackageWide          : IntPtr
        TerminatePlmPackageWide       : IntPtr
        LaunchAndDebugPlmAppWide      : IntPtr
        ActivateAndDebugPlmBgTaskWide : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugPlmClient3.Vtbl()
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

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @param {IDebugOutputStream} Stream 
     * @returns {HRESULT} 
     */
    QueryPlmPackageWide(Server, PackageFullName, Stream) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(5, this, "uint", Server, "ptr", PackageFullName, "ptr", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {IDebugOutputStream} Stream 
     * @returns {HRESULT} 
     */
    QueryPlmPackageList(Server, Stream) {
        result := ComCall(6, this, "uint", Server, "ptr", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    EnablePlmPackageDebugWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(7, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    DisablePlmPackageDebugWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(8, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    SuspendPlmPackageWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(9, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    ResumePlmPackageWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(10, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    TerminatePlmPackageWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(11, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} AppName 
     * @param {PWSTR} Arguments 
     * @returns {HRESULT} 
     */
    LaunchAndDebugPlmAppWide(Server, PackageFullName, AppName, Arguments) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        AppName := AppName is String ? StrPtr(AppName) : AppName
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(12, this, "uint", Server, "ptr", PackageFullName, "ptr", AppName, "ptr", Arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} BackgroundTaskId 
     * @returns {HRESULT} 
     */
    ActivateAndDebugPlmBgTaskWide(Server, PackageFullName, BackgroundTaskId) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        BackgroundTaskId := BackgroundTaskId is String ? StrPtr(BackgroundTaskId) : BackgroundTaskId

        result := ComCall(13, this, "uint", Server, "ptr", PackageFullName, "ptr", BackgroundTaskId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugPlmClient3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LaunchPlmPackageForDebugWide := CallbackCreate(GetMethod(implObj, "LaunchPlmPackageForDebugWide"), flags, 8)
        this.vtbl.LaunchPlmBgTaskForDebugWide := CallbackCreate(GetMethod(implObj, "LaunchPlmBgTaskForDebugWide"), flags, 7)
        this.vtbl.QueryPlmPackageWide := CallbackCreate(GetMethod(implObj, "QueryPlmPackageWide"), flags, 4)
        this.vtbl.QueryPlmPackageList := CallbackCreate(GetMethod(implObj, "QueryPlmPackageList"), flags, 3)
        this.vtbl.EnablePlmPackageDebugWide := CallbackCreate(GetMethod(implObj, "EnablePlmPackageDebugWide"), flags, 3)
        this.vtbl.DisablePlmPackageDebugWide := CallbackCreate(GetMethod(implObj, "DisablePlmPackageDebugWide"), flags, 3)
        this.vtbl.SuspendPlmPackageWide := CallbackCreate(GetMethod(implObj, "SuspendPlmPackageWide"), flags, 3)
        this.vtbl.ResumePlmPackageWide := CallbackCreate(GetMethod(implObj, "ResumePlmPackageWide"), flags, 3)
        this.vtbl.TerminatePlmPackageWide := CallbackCreate(GetMethod(implObj, "TerminatePlmPackageWide"), flags, 3)
        this.vtbl.LaunchAndDebugPlmAppWide := CallbackCreate(GetMethod(implObj, "LaunchAndDebugPlmAppWide"), flags, 5)
        this.vtbl.ActivateAndDebugPlmBgTaskWide := CallbackCreate(GetMethod(implObj, "ActivateAndDebugPlmBgTaskWide"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LaunchPlmPackageForDebugWide)
        CallbackFree(this.vtbl.LaunchPlmBgTaskForDebugWide)
        CallbackFree(this.vtbl.QueryPlmPackageWide)
        CallbackFree(this.vtbl.QueryPlmPackageList)
        CallbackFree(this.vtbl.EnablePlmPackageDebugWide)
        CallbackFree(this.vtbl.DisablePlmPackageDebugWide)
        CallbackFree(this.vtbl.SuspendPlmPackageWide)
        CallbackFree(this.vtbl.ResumePlmPackageWide)
        CallbackFree(this.vtbl.TerminatePlmPackageWide)
        CallbackFree(this.vtbl.LaunchAndDebugPlmAppWide)
        CallbackFree(this.vtbl.ActivateAndDebugPlmBgTaskWide)
    }
}
