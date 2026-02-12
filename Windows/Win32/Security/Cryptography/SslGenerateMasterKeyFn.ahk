#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SslGenerateMasterKeyFn extends IUnknown {

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
     * @param {NCRYPT_KEY_HANDLE} hPublicKey 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phMasterKey 
     * @param {Integer} dwProtocol 
     * @param {Integer} dwCipherSuite 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Pointer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSslProvider, hPrivateKey, hPublicKey, phMasterKey, dwProtocol, dwCipherSuite, pParameterList, pbOutput, cbOutput, pcbResult, dwFlags) {
        hSslProvider := hSslProvider is Win32Handle ? NumGet(hSslProvider, "ptr") : hSslProvider
        hPrivateKey := hPrivateKey is Win32Handle ? NumGet(hPrivateKey, "ptr") : hPrivateKey
        hPublicKey := hPublicKey is Win32Handle ? NumGet(hPublicKey, "ptr") : hPublicKey

        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hSslProvider, "ptr", hPrivateKey, "ptr", hPublicKey, "ptr", phMasterKey, "uint", dwProtocol, "uint", dwCipherSuite, "ptr", pParameterList, "ptr", pbOutput, "uint", cbOutput, pcbResultMarshal, pcbResult, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
