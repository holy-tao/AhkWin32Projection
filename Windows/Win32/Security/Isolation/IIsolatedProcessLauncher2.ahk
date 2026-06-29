#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IIsolatedProcessLauncher.ahk" { IIsolatedProcessLauncher }

/**
 * @namespace Windows.Win32.Security.Isolation
 */
export default struct IIsolatedProcessLauncher2 extends IIsolatedProcessLauncher {
    /**
     * The interface identifier for IIsolatedProcessLauncher2
     * @type {Guid}
     */
    static IID := Guid("{780e4416-5e72-4123-808e-66dc6479feef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsolatedProcessLauncher2 interfaces
    */
    struct Vtbl extends IIsolatedProcessLauncher.Vtbl {
        LaunchProcess2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsolatedProcessLauncher2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} process 
     * @param {PWSTR} arguments 
     * @param {PWSTR} workingDirectory 
     * @param {Pointer<Guid>} correlationGuid 
     * @returns {HRESULT} 
     */
    LaunchProcess2(process, arguments, workingDirectory, correlationGuid) {
        process := process is String ? StrPtr(process) : process
        arguments := arguments is String ? StrPtr(arguments) : arguments
        workingDirectory := workingDirectory is String ? StrPtr(workingDirectory) : workingDirectory

        result := ComCall(8, this, "ptr", process, "ptr", arguments, "ptr", workingDirectory, Guid.Ptr, correlationGuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIsolatedProcessLauncher2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LaunchProcess2 := CallbackCreate(GetMethod(implObj, "LaunchProcess2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LaunchProcess2)
    }
}
