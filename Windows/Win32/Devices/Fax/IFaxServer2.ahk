#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxConfiguration.ahk
#Include .\IFaxAccount.ahk
#Include .\IFaxAccountSet.ahk
#Include .\IFaxSecurity2.ahk
#Include .\IFaxServer.ahk

/**
 * Inherits all the functionality of the IFaxServer interface and adds read-only properties for the server's configuration, account management, security objects, and the current account.
 * @remarks
 * 
 * In Windows Vista and later, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object provides a default implementation of the interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxserver2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServer2 extends IFaxServer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxServer2
     * @type {Guid}
     */
    static IID => Guid("{571ced0f-5609-4f40-9176-547e3a72ca7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "get_CurrentAccount", "get_FaxAccountSet", "get_Security2"]

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
     * 
     * @returns {IFaxConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_configuration
     */
    get_Configuration() {
        result := ComCall(33, this, "ptr*", &ppFaxConfiguration := 0, "HRESULT")
        return IFaxConfiguration(ppFaxConfiguration)
    }

    /**
     * 
     * @returns {IFaxAccount} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_currentaccount
     */
    get_CurrentAccount() {
        result := ComCall(34, this, "ptr*", &ppCurrentAccount := 0, "HRESULT")
        return IFaxAccount(ppCurrentAccount)
    }

    /**
     * 
     * @returns {IFaxAccountSet} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_faxaccountset
     */
    get_FaxAccountSet() {
        result := ComCall(35, this, "ptr*", &ppFaxAccountSet := 0, "HRESULT")
        return IFaxAccountSet(ppFaxAccountSet)
    }

    /**
     * 
     * @returns {IFaxSecurity2} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxserver2-get_security2
     */
    get_Security2() {
        result := ComCall(36, this, "ptr*", &ppFaxSecurity2 := 0, "HRESULT")
        return IFaxSecurity2(ppFaxSecurity2)
    }
}
