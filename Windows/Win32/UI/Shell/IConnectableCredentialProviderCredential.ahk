#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IQueryContinueWithStatus.ahk" { IQueryContinueWithStatus }
#Import ".\ICredentialProviderCredential.ahk" { ICredentialProviderCredential }

/**
 * Exposes methods for connecting and disconnecting IConnectableCredentialProviderCredential objects.
 * @remarks
 * This interface is required for any credential provider that wants to connect to the network.
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential">ICredentialProviderCredential</a> interface, from which it inherits.
 * 
 * All tasks that might take an extended period of time, such as connecting to a network, should be handled with the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-connect">Connect</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-iconnectablecredentialprovidercredential
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IConnectableCredentialProviderCredential extends ICredentialProviderCredential {
    /**
     * The interface identifier for IConnectableCredentialProviderCredential
     * @type {Guid}
     */
    static IID := Guid("{9387928b-ac75-4bf9-8ab2-2b93c4a55290}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConnectableCredentialProviderCredential interfaces
    */
    struct Vtbl extends ICredentialProviderCredential.Vtbl {
        Connect    : IntPtr
        Disconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConnectableCredentialProviderCredential.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Connects an IConnectableCredentialProviderCredential object. This method is called after the user clicks the Submit button within the Pre-Logon-Access Provider screen and before ICredentialProviderCredential::GetSerialization is called.
     * @remarks
     * When Logon  UI calls this method, it passes a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-iquerycontinuewithstatus">IQueryContinueWithStatus</a> instance. This object is used to query if the credential provider should continue attempt to connect to the network and to display status messages to the user while attempting to connect. Robust credential providers should periodically call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iquerycontinue-querycontinue">QueryContinue</a> during attempts to connect to a network to be able to respond to user input.
     * 
     * After a successful call to <b>Connect</b>, the Logon UI displays a <b>Disconnect</b> button to the user. If the user clicks <b>Disconnect</b>, the Logon UI calls <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-disconnect">Disconnect</a> on every credential provider that implements <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-iconnectablecredentialprovidercredential">IConnectableCredentialProviderCredential</a>.
     * @param {IQueryContinueWithStatus} pqcws Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-iquerycontinuewithstatus">IQueryContinueWithStatus</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-iquerycontinuewithstatus">IQueryContinueWithStatus</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-connect
     */
    Connect(pqcws) {
        result := ComCall(20, this, "ptr", pqcws, "HRESULT")
        return result
    }

    /**
     * Disconnects an IConnectableCredentialProviderCredential object.
     * @remarks
     * After a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-connect">Connect</a>, the Logon UI displays a <b>Disconnect</b> button to the user. If the user clicks <b>Disconnect</b>, the Logon UI calls <b>Disconnect</b> on every credential provider that implements <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-iconnectablecredentialprovidercredential">IConnectableCredentialProviderCredential</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-disconnect
     */
    Disconnect() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConnectableCredentialProviderCredential.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
    }
}
