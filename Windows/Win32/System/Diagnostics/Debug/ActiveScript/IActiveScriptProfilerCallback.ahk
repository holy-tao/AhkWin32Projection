#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\PROFILER_SCRIPT_TYPE.ahk" { PROFILER_SCRIPT_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerCallback extends IUnknown {
    /**
     * The interface identifier for IActiveScriptProfilerCallback
     * @type {Guid}
     */
    static IID := Guid("{740eca23-7d9d-42e5-ba9d-f8b24b1c7a9b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize       : IntPtr
        Shutdown         : IntPtr
        ScriptCompiled   : IntPtr
        FunctionCompiled : IntPtr
        OnFunctionEnter  : IntPtr
        OnFunctionExit   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {Integer} dwContext 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(dwContext) {
        result := ComCall(3, this, "uint", dwContext, "HRESULT")
        return result
    }

    /**
     * Stops the collector. If the collector is running as a service, stopping the service is the better approach.
     * @param {HRESULT} hrReason 
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-shutdown
     */
    Shutdown(hrReason) {
        result := ComCall(4, this, "int", hrReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scriptId 
     * @param {PROFILER_SCRIPT_TYPE} type 
     * @param {IUnknown} pIDebugDocumentContext 
     * @returns {HRESULT} 
     */
    ScriptCompiled(scriptId, type, pIDebugDocumentContext) {
        result := ComCall(5, this, "int", scriptId, PROFILER_SCRIPT_TYPE, type, "ptr", pIDebugDocumentContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} functionId 
     * @param {Integer} scriptId 
     * @param {PWSTR} pwszFunctionName 
     * @param {PWSTR} pwszFunctionNameHint 
     * @param {IUnknown} pIDebugDocumentContext 
     * @returns {HRESULT} 
     */
    FunctionCompiled(functionId, scriptId, pwszFunctionName, pwszFunctionNameHint, pIDebugDocumentContext) {
        pwszFunctionName := pwszFunctionName is String ? StrPtr(pwszFunctionName) : pwszFunctionName
        pwszFunctionNameHint := pwszFunctionNameHint is String ? StrPtr(pwszFunctionNameHint) : pwszFunctionNameHint

        result := ComCall(6, this, "int", functionId, "int", scriptId, "ptr", pwszFunctionName, "ptr", pwszFunctionNameHint, "ptr", pIDebugDocumentContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scriptId 
     * @param {Integer} functionId 
     * @returns {HRESULT} 
     */
    OnFunctionEnter(scriptId, functionId) {
        result := ComCall(7, this, "int", scriptId, "int", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scriptId 
     * @param {Integer} functionId 
     * @returns {HRESULT} 
     */
    OnFunctionExit(scriptId, functionId) {
        result := ComCall(8, this, "int", scriptId, "int", functionId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 2)
        this.vtbl.ScriptCompiled := CallbackCreate(GetMethod(implObj, "ScriptCompiled"), flags, 4)
        this.vtbl.FunctionCompiled := CallbackCreate(GetMethod(implObj, "FunctionCompiled"), flags, 6)
        this.vtbl.OnFunctionEnter := CallbackCreate(GetMethod(implObj, "OnFunctionEnter"), flags, 3)
        this.vtbl.OnFunctionExit := CallbackCreate(GetMethod(implObj, "OnFunctionExit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Shutdown)
        CallbackFree(this.vtbl.ScriptCompiled)
        CallbackFree(this.vtbl.FunctionCompiled)
        CallbackFree(this.vtbl.OnFunctionEnter)
        CallbackFree(this.vtbl.OnFunctionExit)
    }
}
