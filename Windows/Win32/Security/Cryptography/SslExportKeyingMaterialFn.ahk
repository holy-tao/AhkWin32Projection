#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SslExportKeyingMaterialFn extends IUnknown {

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
     * @param {NCRYPT_KEY_HANDLE} hMasterKey 
     * @param {PSTR} sLabel 
     * @param {Pointer} pbRandoms 
     * @param {Integer} cbRandoms 
     * @param {Pointer} pbContextValue 
     * @param {Integer} cbContextValue 
     * @param {Pointer} pbOutput 
     * @param {Integer} cbOutput 
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
    Invoke(hSslProvider, hMasterKey, sLabel, pbRandoms, cbRandoms, pbContextValue, cbContextValue, pbOutput, cbOutput, dwFlags) {
        hSslProvider := hSslProvider is Win32Handle ? NumGet(hSslProvider, "ptr") : hSslProvider
        hMasterKey := hMasterKey is Win32Handle ? NumGet(hMasterKey, "ptr") : hMasterKey
        sLabel := sLabel is String ? StrPtr(sLabel) : sLabel

        result := ComCall(3, this, "ptr", hSslProvider, "ptr", hMasterKey, "ptr", sLabel, "ptr", pbRandoms, "uint", cbRandoms, "ptr", pbContextValue, "ushort", cbContextValue, "ptr", pbOutput, "uint", cbOutput, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
