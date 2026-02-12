#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NCRYPT_KEY_HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SslImportMasterKeyFn extends IUnknown {

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
     * @param {NCRYPT_PROV_HANDLE} hSslProvider 
     * @param {NCRYPT_KEY_HANDLE} hPrivateKey 
     * @param {Integer} dwProtocol 
     * @param {Integer} dwCipherSuite 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Pointer} pbEncryptedKey 
     * @param {Integer} cbEncryptedKey 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSslProvider, hPrivateKey, dwProtocol, dwCipherSuite, pParameterList, pbEncryptedKey, cbEncryptedKey, dwFlags) {
        hSslProvider := hSslProvider is Win32Handle ? NumGet(hSslProvider, "ptr") : hSslProvider
        hPrivateKey := hPrivateKey is Win32Handle ? NumGet(hPrivateKey, "ptr") : hPrivateKey

        phMasterKey := NCRYPT_KEY_HANDLE()
        result := ComCall(3, this, "ptr", hSslProvider, "ptr", hPrivateKey, "ptr", phMasterKey, "uint", dwProtocol, "uint", dwCipherSuite, "ptr", pParameterList, "ptr", pbEncryptedKey, "uint", cbEncryptedKey, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phMasterKey
    }
}
