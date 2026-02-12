#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CERT_STORE_PROV_FIND_CRL extends IUnknown {

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
     * @param {HCERTSTOREPROV} hStoreProv 
     * @param {Pointer<CERT_STORE_PROV_FIND_INFO>} pFindInfo 
     * @param {Pointer<CRL_CONTEXT>} pPrevCrlContext 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Void>>} ppvStoreProvFindInfo 
     * @param {Pointer<Pointer<CRL_CONTEXT>>} ppProvCrlContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hStoreProv, pFindInfo, pPrevCrlContext, dwFlags, ppvStoreProvFindInfo, ppProvCrlContext) {
        hStoreProv := hStoreProv is Win32Handle ? NumGet(hStoreProv, "ptr") : hStoreProv

        ppvStoreProvFindInfoMarshal := ppvStoreProvFindInfo is VarRef ? "ptr*" : "ptr"
        ppProvCrlContextMarshal := ppProvCrlContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hStoreProv, "ptr", pFindInfo, "ptr", pPrevCrlContext, "uint", dwFlags, ppvStoreProvFindInfoMarshal, ppvStoreProvFindInfo, ppProvCrlContextMarshal, ppProvCrlContext, "int")
        return result
    }
}
