#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Initializes the provider.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</b> function is currently called by only the Secure Channel (Schannel) security service provider (SSP). The Cryptography API (CAPI) will internally call your custom provider if, beginning with Windows 8, you specify the name of the security principal in the <i>pszPrincipal</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acquirecredentialshandlea">AcquireCredentialsHandle</a> function.
 * 
 * When you implement this function, remember to fill the  <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_object_locator_provider_table">CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE</a> function table with pointers to the following functions implemented by your provider:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_release">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_password">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</a>
 * </li>
 * </ul>
 * You must call <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptregisterdefaultoidfunction">CryptRegisterDefaultOIDFunction</a> to register the provider in the Windows registry.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE extends IUnknown {

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
     * @param {Pointer<PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH>} pfnFlush 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<Integer>} pdwExpectedObjectCount 
     * @param {Pointer<Pointer<CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE>>} ppFuncTable 
     * @param {Pointer<Pointer<Void>>} ppPluginContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pfnFlush, pContext, pdwExpectedObjectCount, ppFuncTable, ppPluginContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pdwExpectedObjectCountMarshal := pdwExpectedObjectCount is VarRef ? "uint*" : "ptr"
        ppFuncTableMarshal := ppFuncTable is VarRef ? "ptr*" : "ptr"
        ppPluginContextMarshal := ppPluginContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pfnFlush, pContextMarshal, pContext, pdwExpectedObjectCountMarshal, pdwExpectedObjectCount, ppFuncTableMarshal, ppFuncTable, ppPluginContextMarshal, ppPluginContext, "int")
        return result
    }
}
