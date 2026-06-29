#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugPlmClient extends IUnknown {
    /**
     * The interface identifier for IDebugPlmClient
     * @type {Guid}
     */
    static IID := Guid("{a02b66c4-aea3-4234-a9f7-fe4c383d4e29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugPlmClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LaunchPlmPackageForDebugWide : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugPlmClient.Vtbl()
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

    Query(iid) {
        if (IDebugPlmClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LaunchPlmPackageForDebugWide := CallbackCreate(GetMethod(implObj, "LaunchPlmPackageForDebugWide"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LaunchPlmPackageForDebugWide)
    }
}
