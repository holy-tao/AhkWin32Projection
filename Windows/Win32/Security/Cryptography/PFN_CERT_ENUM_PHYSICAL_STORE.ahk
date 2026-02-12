#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The CertEnumPhysicalStoreCallback callback function formats and presents information on each physical store found by a call to CertEnumPhysicalStore.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_cert_enum_physical_store
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CERT_ENUM_PHYSICAL_STORE extends IUnknown {

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
     * @param {PWSTR} pwszStoreName 
     * @param {Pointer<CERT_PHYSICAL_STORE_INFO>} pStoreInfo 
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
    Invoke(pvSystemStore, dwFlags, pwszStoreName, pStoreInfo, pvArg) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pwszStoreName := pwszStoreName is String ? StrPtr(pwszStoreName) : pwszStoreName

        pvSystemStoreMarshal := pvSystemStore is VarRef ? "ptr" : "ptr"
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvSystemStoreMarshal, pvSystemStore, "uint", dwFlags, "ptr", pwszStoreName, "ptr", pStoreInfo, "ptr", pvReserved, pvArgMarshal, pvArg, "int")
        return result
    }
}
