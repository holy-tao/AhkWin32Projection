#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRMetaHostPolicy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRMetaHostPolicy
     * @type {Guid}
     */
    static IID => Guid("{e2190695-77b2-492e-8e14-c4b3a7fdd593}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRequestedRuntime"]

    /**
     * 
     * @param {Integer} dwPolicyFlags 
     * @param {PWSTR} pwzBinary 
     * @param {IStream} pCfgStream 
     * @param {PWSTR} pwzVersion 
     * @param {Pointer<Integer>} pcchVersion 
     * @param {PWSTR} pwzImageVersion 
     * @param {Pointer<Integer>} pcchImageVersion 
     * @param {Pointer<Integer>} pdwConfigFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetRequestedRuntime(dwPolicyFlags, pwzBinary, pCfgStream, pwzVersion, pcchVersion, pwzImageVersion, pcchImageVersion, pdwConfigFlags, riid) {
        pwzBinary := pwzBinary is String ? StrPtr(pwzBinary) : pwzBinary
        pwzVersion := pwzVersion is String ? StrPtr(pwzVersion) : pwzVersion
        pwzImageVersion := pwzImageVersion is String ? StrPtr(pwzImageVersion) : pwzImageVersion

        pcchVersionMarshal := pcchVersion is VarRef ? "uint*" : "ptr"
        pcchImageVersionMarshal := pcchImageVersion is VarRef ? "uint*" : "ptr"
        pdwConfigFlagsMarshal := pdwConfigFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "int", dwPolicyFlags, "ptr", pwzBinary, "ptr", pCfgStream, "ptr", pwzVersion, pcchVersionMarshal, pcchVersion, "ptr", pwzImageVersion, pcchImageVersionMarshal, pcchImageVersion, pdwConfigFlagsMarshal, pdwConfigFlags, "ptr", riid, "ptr*", &ppRuntime := 0, "HRESULT")
        return ppRuntime
    }
}
