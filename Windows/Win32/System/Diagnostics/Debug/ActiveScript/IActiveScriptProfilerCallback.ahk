#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerCallback
     * @type {Guid}
     */
    static IID => Guid("{740eca23-7d9d-42e5-ba9d-f8b24b1c7a9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Shutdown", "ScriptCompiled", "FunctionCompiled", "OnFunctionEnter", "OnFunctionExit"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(dwContext) {
        result := ComCall(3, this, "uint", dwContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrReason 
     * @returns {HRESULT} 
     */
    Shutdown(hrReason) {
        result := ComCall(4, this, "int", hrReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scriptId 
     * @param {Integer} type 
     * @param {IUnknown} pIDebugDocumentContext 
     * @returns {HRESULT} 
     */
    ScriptCompiled(scriptId, type, pIDebugDocumentContext) {
        result := ComCall(5, this, "int", scriptId, "int", type, "ptr", pIDebugDocumentContext, "HRESULT")
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
}
