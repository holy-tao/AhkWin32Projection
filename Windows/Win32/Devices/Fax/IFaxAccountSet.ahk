#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxAccounts.ahk" { IFaxAccounts }
#Import ".\IFaxAccount.ahk" { IFaxAccount }

/**
 * Provides methods for fax account management, including adding, removing, and retrieving fax accounts.
 * @remarks
 * A default implementation of <b>IFaxAccountSet</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountset">FaxAccountSet</a> object. The interface and the object are supported only on Windows Vista or later.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountset
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountSet extends IDispatch {
    /**
     * The interface identifier for IFaxAccountSet
     * @type {Guid}
     */
    static IID := Guid("{7428fbae-841e-47b8-86f4-2288946dca1b}")

    /**
     * The class identifier for FaxAccountSet
     * @type {Guid}
     */
    static CLSID := Guid("{fbc23c4b-79e0-4291-bc56-c12e253bbf3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountSet interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetAccounts   : IntPtr
        GetAccount    : IntPtr
        AddAccount    : IntPtr
        RemoveAccount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccountSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an IFaxAccounts object that represents all the fax accounts on the fax server.
     * @returns {IFaxAccounts} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccounts">IFaxAccounts</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccounts">IFaxAccounts</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-getaccounts
     */
    GetAccounts() {
        result := ComCall(7, this, "ptr*", &ppFaxAccounts := 0, "HRESULT")
        return IFaxAccounts(ppFaxAccounts)
    }

    /**
     * Returns an IFaxAccount object by using the account name.
     * @remarks
     * <i>bstrAccountName</i> must be of the form &lt;domainName&gt;\&lt;username&gt; or just &lt;username&gt; for local users.
     * @param {BSTR} bstrAccountName Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the name of the account to return.
     * @returns {IFaxAccount} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-getaccount
     */
    GetAccount(bstrAccountName) {
        bstrAccountName := bstrAccountName is String ? BSTR.Alloc(bstrAccountName).Value : bstrAccountName

        result := ComCall(8, this, BSTR, bstrAccountName, "ptr*", &pFaxAccount := 0, "HRESULT")
        return IFaxAccount(pFaxAccount)
    }

    /**
     * Adds a fax account to the fax server and returns the new IFaxAccount object.
     * @remarks
     * <i>bstrAccountName</i> must be of the form &lt;domainName&gt;\&lt;username&gt; or just &lt;username&gt; for local users.
     * 
     * When the new account is returned, all its values except the name are set to defaults.
     * @param {BSTR} bstrAccountName Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains a name for the new account.
     * @returns {IFaxAccount} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-addaccount
     */
    AddAccount(bstrAccountName) {
        bstrAccountName := bstrAccountName is String ? BSTR.Alloc(bstrAccountName).Value : bstrAccountName

        result := ComCall(9, this, BSTR, bstrAccountName, "ptr*", &pFaxAccount := 0, "HRESULT")
        return IFaxAccount(pFaxAccount)
    }

    /**
     * Removes a fax account from the fax server.
     * @remarks
     * <i>bstrAccountName</i> must be of the form &lt;domainName&gt;\&lt;username&gt; or just &lt;username&gt; for local users.
     * @param {BSTR} bstrAccountName Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the name of the account to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-removeaccount
     */
    RemoveAccount(bstrAccountName) {
        bstrAccountName := bstrAccountName is String ? BSTR.Alloc(bstrAccountName).Value : bstrAccountName

        result := ComCall(10, this, BSTR, bstrAccountName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxAccountSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAccounts := CallbackCreate(GetMethod(implObj, "GetAccounts"), flags, 2)
        this.vtbl.GetAccount := CallbackCreate(GetMethod(implObj, "GetAccount"), flags, 3)
        this.vtbl.AddAccount := CallbackCreate(GetMethod(implObj, "AddAccount"), flags, 3)
        this.vtbl.RemoveAccount := CallbackCreate(GetMethod(implObj, "RemoveAccount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAccounts)
        CallbackFree(this.vtbl.GetAccount)
        CallbackFree(this.vtbl.AddAccount)
        CallbackFree(this.vtbl.RemoveAccount)
    }
}
