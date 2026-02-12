#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The CertEnumSystemStoreCallback callback function formats and presents information on each system store found by a call to CertEnumSystemStore.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cert_enum_system_store
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CERT_ENUM_SYSTEM_STORE extends IUnknown {

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
     * @param {Pointer<Void>} pvSystemStore 
     * @param {Integer} dwFlags 
     * @param {Pointer<CERT_SYSTEM_STORE_INFO>} pStoreInfo 
     * @param {Pointer<Void>} pvArg 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvSystemStore, dwFlags, pStoreInfo, pvArg) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pvSystemStoreMarshal := pvSystemStore is VarRef ? "ptr" : "ptr"
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvSystemStoreMarshal, pvSystemStore, "uint", dwFlags, "ptr", pStoreInfo, "ptr", pvReserved, pvArgMarshal, pvArg, "int")
        return result
    }
}
