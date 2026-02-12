#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCryptCreateClaimFn extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {NCRYPT_PROV_HANDLE} hProv 
     * @param {NCRYPT_KEY_HANDLE} hSubjectKey 
     * @param {NCRYPT_KEY_HANDLE} hAuthorityKey 
     * @param {Integer} dwClaimType 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Pointer} pbClaimBlob 
     * @param {Integer} cbClaimBlob 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProv, hSubjectKey, hAuthorityKey, dwClaimType, pParameterList, pbClaimBlob, cbClaimBlob, dwFlags) {
        hProv := hProv is Win32Handle ? NumGet(hProv, "ptr") : hProv
        hSubjectKey := hSubjectKey is Win32Handle ? NumGet(hSubjectKey, "ptr") : hSubjectKey
        hAuthorityKey := hAuthorityKey is Win32Handle ? NumGet(hAuthorityKey, "ptr") : hAuthorityKey

        result := ComCall(3, this, "ptr", hProv, "ptr", hSubjectKey, "ptr", hAuthorityKey, "uint", dwClaimType, "ptr", pParameterList, "ptr", pbClaimBlob, "uint", cbClaimBlob, "uint*", &pcbResult := 0, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbResult
    }
}
