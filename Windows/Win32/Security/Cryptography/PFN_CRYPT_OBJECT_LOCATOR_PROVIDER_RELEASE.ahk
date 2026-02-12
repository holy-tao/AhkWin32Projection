#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases the provider.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE</b> callback function is currently called by only the Secure Channel (Schannel) security package. This function is called once for every call made to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_initialize">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE</a>.
 * 
 * The provider is not expected to release all memory for all objects but should clean itself if the <i>dwReason</i> parameter is set to <b>CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP</b> or <b>CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD</b>.
 * 
 * This function must block so that  calls to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_flush">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH</a> can complete.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_release
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE extends IUnknown {

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
     * @param {Integer} dwReason 
     * @param {Pointer<Void>} pPluginContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwReason, pPluginContext) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", dwReason, pPluginContextMarshal, pPluginContext)
    }
}
