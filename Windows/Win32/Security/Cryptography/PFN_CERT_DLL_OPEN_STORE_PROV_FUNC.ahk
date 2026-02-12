#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by a store-provider and is used to open a store.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cert_dll_open_store_prov_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CERT_DLL_OPEN_STORE_PROV_FUNC extends IUnknown {

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
     * @param {PSTR} lpszStoreProvider 
     * @param {Integer} dwEncodingType 
     * @param {HCRYPTPROV_LEGACY} hCryptProv 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvPara 
     * @param {HCERTSTORE} hCertStore_ 
     * @param {Pointer<CERT_STORE_PROV_INFO>} pStoreProvInfo 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpszStoreProvider, dwEncodingType, hCryptProv, dwFlags, pvPara, hCertStore_, pStoreProvInfo) {
        lpszStoreProvider := lpszStoreProvider is String ? StrPtr(lpszStoreProvider) : lpszStoreProvider
        hCryptProv := hCryptProv is Win32Handle ? NumGet(hCryptProv, "ptr") : hCryptProv
        hCertStore_ := hCertStore_ is Win32Handle ? NumGet(hCertStore_, "ptr") : hCertStore_

        pvParaMarshal := pvPara is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", lpszStoreProvider, "uint", dwEncodingType, "ptr", hCryptProv, "uint", dwFlags, pvParaMarshal, pvPara, "ptr", hCertStore_, "ptr", pStoreProvInfo, "int")
        return result
    }
}
