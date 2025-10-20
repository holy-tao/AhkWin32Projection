#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRMetaHostPolicy extends IUnknown{
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
     * 
     * @param {Integer} dwPolicyFlags 
     * @param {PWSTR} pwzBinary 
     * @param {Pointer<IStream>} pCfgStream 
     * @param {PWSTR} pwzVersion 
     * @param {Pointer<UInt32>} pcchVersion 
     * @param {PWSTR} pwzImageVersion 
     * @param {Pointer<UInt32>} pcchImageVersion 
     * @param {Pointer<UInt32>} pdwConfigFlags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppRuntime 
     * @returns {HRESULT} 
     */
    GetRequestedRuntime(dwPolicyFlags, pwzBinary, pCfgStream, pwzVersion, pcchVersion, pwzImageVersion, pcchImageVersion, pdwConfigFlags, riid, ppRuntime) {
        pwzBinary := pwzBinary is String ? StrPtr(pwzBinary) : pwzBinary
        pwzVersion := pwzVersion is String ? StrPtr(pwzVersion) : pwzVersion
        pwzImageVersion := pwzImageVersion is String ? StrPtr(pwzImageVersion) : pwzImageVersion

        result := ComCall(3, this, "int", dwPolicyFlags, "ptr", pwzBinary, "ptr", pCfgStream, "ptr", pwzVersion, "uint*", pcchVersion, "ptr", pwzImageVersion, "uint*", pcchImageVersion, "uint*", pdwConfigFlags, "ptr", riid, "ptr", ppRuntime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
