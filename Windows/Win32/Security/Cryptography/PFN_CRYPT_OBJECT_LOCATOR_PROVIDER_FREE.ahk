#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases the object returned by the provider.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</b> function is currently called by only the Secure Channel (Schannel) security package. Schannel calls <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> to retrieve an object and then calls <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE</b> to remove the data returned by the <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</b> call from memory when it is no longer required.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE extends IUnknown {

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
     * @param {Pointer<Void>} pPluginContext 
     * @param {Pointer<Integer>} pbData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pPluginContext, pbData) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        ComCall(3, this, pPluginContextMarshal, pPluginContext, pbDataMarshal, pbData)
    }
}
