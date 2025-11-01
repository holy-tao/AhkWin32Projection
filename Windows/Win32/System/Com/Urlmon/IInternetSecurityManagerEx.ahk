#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetSecurityManager.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetSecurityManagerEx extends IInternetSecurityManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetSecurityManagerEx
     * @type {Guid}
     */
    static IID => Guid("{f164edf1-cc7c-4f0d-9a94-34222625c393}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessUrlActionEx"]

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    ProcessUrlActionEx(pwszUrl, dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved, pdwOutFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pwszUrl, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }
}
