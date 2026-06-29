#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo10.ahk" { ICorProfilerInfo10 }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo11 extends ICorProfilerInfo10 {
    /**
     * The interface identifier for ICorProfilerInfo11
     * @type {Guid}
     */
    static IID := Guid("{06398876-8987-4154-b621-40a00d6e4d04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo11 interfaces
    */
    struct Vtbl extends ICorProfilerInfo10.Vtbl {
        GetEnvironmentVariableA : IntPtr
        SetEnvironmentVariable  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo11.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the contents of the specified variable from the environment block of the calling process. (GetEnvironmentVariableA)
     * @remarks
     * This function can retrieve either a system environment variable or a user environment variable.
     * @param {PWSTR} szName 
     * @param {Integer} cchValue 
     * @param {PWSTR} szValue 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-getenvironmentvariablea
     */
    GetEnvironmentVariableA(szName, cchValue, szValue) {
        szName := szName is String ? StrPtr(szName) : szName
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(99, this, "ptr", szName, "uint", cchValue, "uint*", &pcchValue := 0, "ptr", szValue, "HRESULT")
        return pcchValue
    }

    /**
     * The SetEnvironmentVariable function (winbase.h) sets the contents of the specified environment variable for the current process.
     * @remarks
     * This function has no effect on the system environment variables or the environment variables of other processes.
     * @param {PWSTR} szName 
     * @param {PWSTR} szValue 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setenvironmentvariable
     */
    SetEnvironmentVariable(szName, szValue) {
        szName := szName is String ? StrPtr(szName) : szName
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(100, this, "ptr", szName, "ptr", szValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo11.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEnvironmentVariableA := CallbackCreate(GetMethod(implObj, "GetEnvironmentVariableA"), flags, 5)
        this.vtbl.SetEnvironmentVariable := CallbackCreate(GetMethod(implObj, "SetEnvironmentVariable"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEnvironmentVariableA)
        CallbackFree(this.vtbl.SetEnvironmentVariable)
    }
}
