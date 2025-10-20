#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides an asynchronous callback mechanism used by a credential provider to notify it of changes in the list of credentials or their fields.
 * @remarks
 * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * An implementation of <b>ICredentialProviderEvents</b> is provided for use by outside parties implementing a credential provider.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Outside parties do not need to implement <b>ICredentialProviderEvents</b> themselves.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialproviderevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderEvents
     * @type {Guid}
     */
    static IID => Guid("{34201e5a-a787-41a3-a5a4-bd6dcf2a854e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CredentialsChanged"]

    /**
     * 
     * @param {Pointer} upAdviseContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialproviderevents-credentialschanged
     */
    CredentialsChanged(upAdviseContext) {
        result := ComCall(3, this, "ptr", upAdviseContext, "HRESULT")
        return result
    }
}
