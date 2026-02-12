#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves an object.
 * @remarks
 * The <b>PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET</b> callback function is currently called by only the Secure Channel (Schannel) security package. You can return an object that encapsulates one of the following:
 * 
 * <ul>
 * <li>A personal information exchange (PFX) byte array</li>
 * <li>A certificate store.</li>
 * <li>A generic BLOB. This is not currently supported by Schannel.</li>
 * </ul>
 * When this function is first called, Schannel submits a DNS host name in the <i>pNameBlob</i> argument to specify the host for which the object is intended. Your provider must process the name (match wild cards, build a file path, and so on) to determine what object to find.
 * 
 * Because many host names can be mapped to one object, your provider can use the <i>ppIdentifier</i> parameter to return an internally defined identifier that can be used in subsequent calls by the cryptography API (CAPI) functions to the provider. The provider can then use the identifier to assist in finding the appropriate object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_object_locator_provider_get
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET extends IUnknown {

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
     * @param {Integer} dwNameType 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pNameBlob 
     * @param {Pointer<Pointer<Integer>>} ppbContent 
     * @param {Pointer<Integer>} pcbContent 
     * @param {Pointer<PWSTR>} ppwszPassword 
     * @param {Pointer<Pointer<CRYPT_INTEGER_BLOB>>} ppIdentifier 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pPluginContext, pIdentifier, dwNameType, pNameBlob, ppbContent, pcbContent, ppwszPassword, ppIdentifier) {
        pPluginContextMarshal := pPluginContext is VarRef ? "ptr" : "ptr"
        ppbContentMarshal := ppbContent is VarRef ? "ptr*" : "ptr"
        pcbContentMarshal := pcbContent is VarRef ? "uint*" : "ptr"
        ppwszPasswordMarshal := ppwszPassword is VarRef ? "ptr*" : "ptr"
        ppIdentifierMarshal := ppIdentifier is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pPluginContextMarshal, pPluginContext, "ptr", pIdentifier, "uint", dwNameType, "ptr", pNameBlob, ppbContentMarshal, ppbContent, pcbContentMarshal, pcbContent, ppwszPasswordMarshal, ppwszPassword, ppIdentifierMarshal, ppIdentifier, "int")
        return result
    }
}
