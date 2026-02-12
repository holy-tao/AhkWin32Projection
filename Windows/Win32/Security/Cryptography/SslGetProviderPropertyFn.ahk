#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SslGetProviderPropertyFn extends IUnknown {

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
     * @param {PWSTR} pszProperty 
     * @param {Pointer<Pointer<Integer>>} ppbOutput 
     * @param {Pointer<Integer>} pcbOutput 
     * @param {Pointer<Pointer<Void>>} ppEnumState 
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
    Invoke(hSslProvider, pszProperty, ppbOutput, pcbOutput, ppEnumState, dwFlags) {
        hSslProvider := hSslProvider is Win32Handle ? NumGet(hSslProvider, "ptr") : hSslProvider
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        ppbOutputMarshal := ppbOutput is VarRef ? "ptr*" : "ptr"
        pcbOutputMarshal := pcbOutput is VarRef ? "uint*" : "ptr"
        ppEnumStateMarshal := ppEnumState is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hSslProvider, "ptr", pszProperty, ppbOutputMarshal, ppbOutput, pcbOutputMarshal, pcbOutput, ppEnumStateMarshal, ppEnumState, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
