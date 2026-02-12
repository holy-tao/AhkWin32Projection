#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCryptDeriveKeyFn extends IUnknown {

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
     * @param {NCRYPT_PROV_HANDLE} hProvider_ 
     * @param {NCRYPT_SECRET_HANDLE} hSharedSecret 
     * @param {PWSTR} pwszKDF 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Pointer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProvider_, hSharedSecret, pwszKDF, pParameterList, pbDerivedKey, cbDerivedKey, dwFlags) {
        hProvider_ := hProvider_ is Win32Handle ? NumGet(hProvider_, "ptr") : hProvider_
        hSharedSecret := hSharedSecret is Win32Handle ? NumGet(hSharedSecret, "ptr") : hSharedSecret
        pwszKDF := pwszKDF is String ? StrPtr(pwszKDF) : pwszKDF

        result := ComCall(3, this, "ptr", hProvider_, "ptr", hSharedSecret, "ptr", pwszKDF, "ptr", pParameterList, "ptr", pbDerivedKey, "uint", cbDerivedKey, "uint*", &pcbResult := 0, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbResult
    }
}
