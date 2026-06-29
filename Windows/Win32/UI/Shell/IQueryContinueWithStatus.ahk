#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IQueryContinue.ahk" { IQueryContinue }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that provide a standard mechanism for credential providers to call QueryContinue while attempting to connect to the network to determine if they should continue these attempts.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-iquerycontinuewithstatus
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IQueryContinueWithStatus extends IQueryContinue {
    /**
     * The interface identifier for IQueryContinueWithStatus
     * @type {Guid}
     */
    static IID := Guid("{9090be5b-502b-41fb-bccc-0049a6c7254b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryContinueWithStatus interfaces
    */
    struct Vtbl extends IQueryContinue.Vtbl {
        SetStatusMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryContinueWithStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the credential provider to set status messages as it attempts to complete IConnectableCredentialProviderCredential::Connect.
     * @remarks
     * The Logon UI will display the status message during <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-iconnectablecredentialprovidercredential-connect">Connect</a>. This is especially useful during lengthy attempt to connect to inform the user of the status and continued attempts.
     * @param {PWSTR} psz Type: <b>LPCWSTR</b>
     * 
     * A pointer to the status message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-iquerycontinuewithstatus-setstatusmessage
     */
    SetStatusMessage(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(4, this, "ptr", psz, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueryContinueWithStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStatusMessage := CallbackCreate(GetMethod(implObj, "SetStatusMessage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStatusMessage)
    }
}
