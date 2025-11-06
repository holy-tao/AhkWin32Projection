#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxAccounts.ahk
#Include .\IFaxAccount.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for fax account management, including adding, removing, and retrieving fax accounts.
 * @remarks
 * 
  * A default implementation of <b>IFaxAccountSet</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountset">FaxAccountSet</a> object. The interface and the object are supported only on Windows Vista or later.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountset
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountSet
     * @type {Guid}
     */
    static IID => Guid("{7428fbae-841e-47b8-86f4-2288946dca1b}")

    /**
     * The class identifier for FaxAccountSet
     * @type {Guid}
     */
    static CLSID => Guid("{fbc23c4b-79e0-4291-bc56-c12e253bbf3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAccounts", "GetAccount", "AddAccount", "RemoveAccount"]

    /**
     * 
     * @returns {IFaxAccounts} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-getaccounts
     */
    GetAccounts() {
        result := ComCall(7, this, "ptr*", &ppFaxAccounts := 0, "HRESULT")
        return IFaxAccounts(ppFaxAccounts)
    }

    /**
     * 
     * @param {BSTR} bstrAccountName 
     * @returns {IFaxAccount} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-getaccount
     */
    GetAccount(bstrAccountName) {
        bstrAccountName := bstrAccountName is String ? BSTR.Alloc(bstrAccountName).Value : bstrAccountName

        result := ComCall(8, this, "ptr", bstrAccountName, "ptr*", &pFaxAccount := 0, "HRESULT")
        return IFaxAccount(pFaxAccount)
    }

    /**
     * 
     * @param {BSTR} bstrAccountName 
     * @returns {IFaxAccount} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-addaccount
     */
    AddAccount(bstrAccountName) {
        bstrAccountName := bstrAccountName is String ? BSTR.Alloc(bstrAccountName).Value : bstrAccountName

        result := ComCall(9, this, "ptr", bstrAccountName, "ptr*", &pFaxAccount := 0, "HRESULT")
        return IFaxAccount(pFaxAccount)
    }

    /**
     * 
     * @param {BSTR} bstrAccountName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountset-removeaccount
     */
    RemoveAccount(bstrAccountName) {
        bstrAccountName := bstrAccountName is String ? BSTR.Alloc(bstrAccountName).Value : bstrAccountName

        result := ComCall(10, this, "ptr", bstrAccountName, "HRESULT")
        return result
    }
}
