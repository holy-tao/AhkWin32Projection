#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IsolatedAppLauncherTelemetryParameters.ahk" { IsolatedAppLauncherTelemetryParameters }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables apps to determine whether they are running in a Windows Defender Application Guard container (VM container environment).
 * @see https://learn.microsoft.com/windows/win32/api/isolatedapplauncher/nn-isolatedapplauncher-iisolatedapplauncher
 * @namespace Windows.Win32.Security.Isolation
 */
export default struct IIsolatedAppLauncher extends IUnknown {
    /**
     * The interface identifier for IIsolatedAppLauncher
     * @type {Guid}
     */
    static IID := Guid("{f686878f-7b42-4cc4-96fb-f4f3b6e3d24d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsolatedAppLauncher interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Launch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsolatedAppLauncher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} appUserModelId 
     * @param {PWSTR} arguments 
     * @param {Pointer<IsolatedAppLauncherTelemetryParameters>} telemetryParameters 
     * @returns {HRESULT} 
     */
    Launch(appUserModelId, arguments, telemetryParameters) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        arguments := arguments is String ? StrPtr(arguments) : arguments

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", arguments, IsolatedAppLauncherTelemetryParameters.Ptr, telemetryParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIsolatedAppLauncher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Launch := CallbackCreate(GetMethod(implObj, "Launch"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Launch)
    }
}
