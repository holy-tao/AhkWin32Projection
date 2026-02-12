#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases the password used to encrypt a personal information exchange (PFX) byte array.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</b> function is currently called by only the Secure Channel (Schannel) security package. Schannel calls <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</a> to retrieve a PFX byte array and then calls <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD</b> after the byte array has been processed but before calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_identifier">PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_free_password
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD extends IUnknown {

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
     * @param {PWSTR} pwszPassword 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pPluginContext, pwszPassword) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pPluginContextMarshal, pPluginContext, "ptr", pwszPassword)
    }
}
