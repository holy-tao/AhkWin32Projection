#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases memory for an object identifier.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</b> function is currently called by only the Secure Channel (Schannel) security package. This function may be called for any of the following reasons:
 * 
 * <ul>
 * <li>An error occurred when processing the object returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> function.</li>
 * <li>The object returned by <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> is no longer needed.</li>
 * <li>An updated object has been retrieved and the original object is no longer required.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER extends IUnknown {

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
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pIdentifier 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pPluginContext, pIdentifier) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pPluginContextMarshal, pPluginContext, "ptr", pIdentifier)
    }
}
