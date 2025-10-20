#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICredentialProviderCredential.ahk

/**
 * Exposes methods for connecting and disconnecting IConnectableCredentialProviderCredential objects.
 * @remarks
 * 
  * This interface is required for any credential provider that wants to connect to the network.
  * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a> interface, from which it inherits.
  * 
  * All tasks that might take an extended period of time, such as connecting to a network, should be handled with the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-connect">Connect</a> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-iconnectablecredentialprovidercredential
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IConnectableCredentialProviderCredential extends ICredentialProviderCredential{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectableCredentialProviderCredential
     * @type {Guid}
     */
    static IID => Guid("{9387928b-ac75-4bf9-8ab2-2b93c4a55290}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect"]

    /**
     * 
     * @param {IQueryContinueWithStatus} pqcws 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-connect
     */
    Connect(pqcws) {
        result := ComCall(20, this, "ptr", pqcws, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-disconnect
     */
    Disconnect() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
