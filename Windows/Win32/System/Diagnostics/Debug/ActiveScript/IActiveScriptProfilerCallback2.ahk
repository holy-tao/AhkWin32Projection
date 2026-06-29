#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IActiveScriptProfilerCallback.ahk" { IActiveScriptProfilerCallback }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROFILER_SCRIPT_TYPE.ahk" { PROFILER_SCRIPT_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerCallback2 extends IActiveScriptProfilerCallback {
    /**
     * The interface identifier for IActiveScriptProfilerCallback2
     * @type {Guid}
     */
    static IID := Guid("{31b7f8ad-a637-409c-b22f-040995b6103d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerCallback2 interfaces
    */
    struct Vtbl extends IActiveScriptProfilerCallback.Vtbl {
        OnFunctionEnterByName : IntPtr
        OnFunctionExitByName  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszFunctionName 
     * @param {PROFILER_SCRIPT_TYPE} type 
     * @returns {HRESULT} 
     */
    OnFunctionEnterByName(pwszFunctionName, type) {
        pwszFunctionName := pwszFunctionName is String ? StrPtr(pwszFunctionName) : pwszFunctionName

        result := ComCall(9, this, "ptr", pwszFunctionName, PROFILER_SCRIPT_TYPE, type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFunctionName 
     * @param {PROFILER_SCRIPT_TYPE} type 
     * @returns {HRESULT} 
     */
    OnFunctionExitByName(pwszFunctionName, type) {
        pwszFunctionName := pwszFunctionName is String ? StrPtr(pwszFunctionName) : pwszFunctionName

        result := ComCall(10, this, "ptr", pwszFunctionName, PROFILER_SCRIPT_TYPE, type, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnFunctionEnterByName := CallbackCreate(GetMethod(implObj, "OnFunctionEnterByName"), flags, 3)
        this.vtbl.OnFunctionExitByName := CallbackCreate(GetMethod(implObj, "OnFunctionExitByName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnFunctionEnterByName)
        CallbackFree(this.vtbl.OnFunctionExitByName)
    }
}
