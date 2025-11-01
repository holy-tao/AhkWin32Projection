#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRRuntimeHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRRuntimeHost
     * @type {Guid}
     */
    static IID => Guid("{90f1a06c-7712-4762-86b5-7a5eba6bdb02}")

    /**
     * The class identifier for CLRRuntimeHost
     * @type {Guid}
     */
    static CLSID => Guid("{90f1a06e-7712-4762-86b5-7a5eba6bdb02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "SetHostControl", "GetCLRControl", "UnloadAppDomain", "ExecuteInAppDomain", "GetCurrentAppDomainId", "ExecuteApplication", "ExecuteInDefaultAppDomain"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHostControl} pHostControl 
     * @returns {HRESULT} 
     */
    SetHostControl(pHostControl) {
        result := ComCall(5, this, "ptr", pHostControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICLRControl>} pCLRControl 
     * @returns {HRESULT} 
     */
    GetCLRControl(pCLRControl) {
        result := ComCall(6, this, "ptr*", pCLRControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {BOOL} fWaitUntilDone 
     * @returns {HRESULT} 
     */
    UnloadAppDomain(dwAppDomainId, fWaitUntilDone) {
        result := ComCall(7, this, "uint", dwAppDomainId, "int", fWaitUntilDone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<FExecuteInAppDomainCallback>} pCallback 
     * @param {Pointer<Void>} cookie 
     * @returns {HRESULT} 
     */
    ExecuteInAppDomain(dwAppDomainId, pCallback, cookie) {
        cookieMarshal := cookie is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwAppDomainId, "ptr", pCallback, cookieMarshal, cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAppDomainId 
     * @returns {HRESULT} 
     */
    GetCurrentAppDomainId(pdwAppDomainId) {
        pdwAppDomainIdMarshal := pdwAppDomainId is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwAppDomainIdMarshal, pdwAppDomainId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAppFullName 
     * @param {Integer} dwManifestPaths 
     * @param {Pointer<PWSTR>} ppwzManifestPaths 
     * @param {Integer} dwActivationData 
     * @param {Pointer<PWSTR>} ppwzActivationData 
     * @param {Pointer<Integer>} pReturnValue 
     * @returns {HRESULT} 
     */
    ExecuteApplication(pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, pReturnValue) {
        pwzAppFullName := pwzAppFullName is String ? StrPtr(pwzAppFullName) : pwzAppFullName

        pReturnValueMarshal := pReturnValue is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "ptr", pwzAppFullName, "uint", dwManifestPaths, "ptr", ppwzManifestPaths, "uint", dwActivationData, "ptr", ppwzActivationData, pReturnValueMarshal, pReturnValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAssemblyPath 
     * @param {PWSTR} pwzTypeName 
     * @param {PWSTR} pwzMethodName 
     * @param {PWSTR} pwzArgument 
     * @param {Pointer<Integer>} pReturnValue 
     * @returns {HRESULT} 
     */
    ExecuteInDefaultAppDomain(pwzAssemblyPath, pwzTypeName, pwzMethodName, pwzArgument, pReturnValue) {
        pwzAssemblyPath := pwzAssemblyPath is String ? StrPtr(pwzAssemblyPath) : pwzAssemblyPath
        pwzTypeName := pwzTypeName is String ? StrPtr(pwzTypeName) : pwzTypeName
        pwzMethodName := pwzMethodName is String ? StrPtr(pwzMethodName) : pwzMethodName
        pwzArgument := pwzArgument is String ? StrPtr(pwzArgument) : pwzArgument

        pReturnValueMarshal := pReturnValue is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pwzAssemblyPath, "ptr", pwzTypeName, "ptr", pwzMethodName, "ptr", pwzArgument, pReturnValueMarshal, pReturnValue, "HRESULT")
        return result
    }
}
