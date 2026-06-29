#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxAccountSet.ahk" { IFaxAccountSet }
#Import ".\IFaxSecurity2.ahk" { IFaxSecurity2 }
#Import ".\IFaxConfiguration.ahk" { IFaxConfiguration }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxServer.ahk" { IFaxServer }
#Import ".\IFaxAccount.ahk" { IFaxAccount }

/**
 * Inherits all the functionality of the IFaxServer interface and adds read-only properties for the server's configuration, account management, security objects, and the current account.
 * @remarks
 * In Windows Vista and later, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object provides a default implementation of the interface.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxserver2
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxServer2 extends IFaxServer {
    /**
     * The interface identifier for IFaxServer2
     * @type {Guid}
     */
    static IID := Guid("{571ced0f-5609-4f40-9176-547e3a72ca7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxServer2 interfaces
    */
    struct Vtbl extends IFaxServer.Vtbl {
        get_Configuration  : IntPtr
        get_CurrentAccount : IntPtr
        get_FaxAccountSet  : IntPtr
        get_Security2      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxServer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFaxConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * @type {IFaxAccount} 
     */
    CurrentAccount {
        get => this.get_CurrentAccount()
    }

    /**
     * @type {IFaxAccountSet} 
     */
    FaxAccountSet {
        get => this.get_FaxAccountSet()
    }

    /**
     * @type {IFaxSecurity2} 
     */
    Security2 {
        get => this.get_Security2()
    }

    /**
     * The IFaxServer2::Configuration property holds a IFaxConfiguration object. The object permits a fax client application to access information about the configuration of the connected fax server.
     * @returns {IFaxConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_configuration
     */
    get_Configuration() {
        result := ComCall(33, this, "ptr*", &ppFaxConfiguration := 0, "HRESULT")
        return IFaxConfiguration(ppFaxConfiguration)
    }

    /**
     * The IFaxServer2::CurrentAccount property returns the fax account for the user account that has connected to the fax server.
     * @returns {IFaxAccount} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_currentaccount
     */
    get_CurrentAccount() {
        result := ComCall(34, this, "ptr*", &ppCurrentAccount := 0, "HRESULT")
        return IFaxAccount(ppCurrentAccount)
    }

    /**
     * The IFaxServer2::FaxAccountSet property returns a IFaxAccountSet object used to manage the fax accounts on the fax server.
     * @returns {IFaxAccountSet} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_faxaccountset
     */
    get_FaxAccountSet() {
        result := ComCall(35, this, "ptr*", &ppFaxAccountSet := 0, "HRESULT")
        return IFaxAccountSet(ppFaxAccountSet)
    }

    /**
     * The IFaxServer2::Security2 property returns a IFaxSecurity2 object used to configure security on the fax server.
     * @returns {IFaxSecurity2} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_security2
     */
    get_Security2() {
        result := ComCall(36, this, "ptr*", &ppFaxSecurity2 := 0, "HRESULT")
        return IFaxSecurity2(ppFaxSecurity2)
    }

    Query(iid) {
        if (IFaxServer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Configuration := CallbackCreate(GetMethod(implObj, "get_Configuration"), flags, 2)
        this.vtbl.get_CurrentAccount := CallbackCreate(GetMethod(implObj, "get_CurrentAccount"), flags, 2)
        this.vtbl.get_FaxAccountSet := CallbackCreate(GetMethod(implObj, "get_FaxAccountSet"), flags, 2)
        this.vtbl.get_Security2 := CallbackCreate(GetMethod(implObj, "get_Security2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Configuration)
        CallbackFree(this.vtbl.get_CurrentAccount)
        CallbackFree(this.vtbl.get_FaxAccountSet)
        CallbackFree(this.vtbl.get_Security2)
    }
}
