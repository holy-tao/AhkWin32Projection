#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SslExpandTrafficKeysFn extends IUnknown {

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
     * @param {NCRYPT_KEY_HANDLE} hBaseKey 
     * @param {NCRYPT_HASH_HANDLE} hHashValue 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phClientTrafficKey 
     * @param {Pointer<NCRYPT_KEY_HANDLE>} phServerTrafficKey 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
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
    Invoke(hSslProvider, hBaseKey, hHashValue, phClientTrafficKey, phServerTrafficKey, pParameterList, dwFlags) {
        hSslProvider := hSslProvider is Win32Handle ? NumGet(hSslProvider, "ptr") : hSslProvider
        hBaseKey := hBaseKey is Win32Handle ? NumGet(hBaseKey, "ptr") : hBaseKey
        hHashValue := hHashValue is Win32Handle ? NumGet(hHashValue, "ptr") : hHashValue

        result := ComCall(3, this, "ptr", hSslProvider, "ptr", hBaseKey, "ptr", hHashValue, "ptr", phClientTrafficKey, "ptr", phServerTrafficKey, "ptr", pParameterList, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
