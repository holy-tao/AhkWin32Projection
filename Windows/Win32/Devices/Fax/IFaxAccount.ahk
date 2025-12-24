#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxAccountFolders.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a fax account on the fax server.
 * @remarks
 * 
 * A default implementation of <b>IFaxAccount</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccount">FaxAccount</a> object. The interface and the object are supported only on Windows Vista or later.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccount
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccount extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccount
     * @type {Guid}
     */
    static IID => Guid("{68535b33-5dc4-4086-be26-b76f9b711006}")

    /**
     * The class identifier for FaxAccount
     * @type {Guid}
     */
    static CLSID => Guid("{a7e0647f-4524-4464-a56d-b9fe666f715e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccountName", "get_Folders", "ListenToAccountEvents", "get_RegisteredEvents"]

    /**
     * @type {BSTR} 
     */
    AccountName {
        get => this.get_AccountName()
    }

    /**
     * @type {IFaxAccountFolders} 
     */
    Folders {
        get => this.get_Folders()
    }

    /**
     * @type {Integer} 
     */
    RegisteredEvents {
        get => this.get_RegisteredEvents()
    }

    /**
     * Retrieves the name of a particular fax account on the server.
     * @remarks
     * 
     * If the account is not in the local domain, the format of name returned  is &lt;domain_name&gt;\&lt;user_name&gt;.
     * 
     * If the account is in the domain but not on the server, the format name returned is &lt;computer_name&gt;\&lt;user_name&gt; where &lt;computer_name&gt; is the name of the server that holds the account.
     * 
     * If the account is on the same server as the fax server, just the &lt;user_name&gt; of the account is returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccount-get_accountname
     */
    get_AccountName() {
        pbstrAccountName := BSTR()
        result := ComCall(7, this, "ptr", pbstrAccountName, "HRESULT")
        return pbstrAccountName
    }

    /**
     * Represents the folders of the account, including the incoming and outgoing archives and the incoming and outgoing queues.
     * @returns {IFaxAccountFolders} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccount-get_folders
     */
    get_Folders() {
        result := ComCall(8, this, "ptr*", &ppFolders := 0, "HRESULT")
        return IFaxAccountFolders(ppFolders)
    }

    /**
     * Sets the flags of a FAX_ACCOUNT_EVENTS_TYPE_ENUM variable that represents the events for which the account is listening.
     * @param {Integer} EventTypes Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_account_events_type_enum">FAX_ACCOUNT_EVENTS_TYPE_ENUM</a></b>
     * 
     * A variable that specifies the types of events for which the account is listening.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccount-listentoaccountevents
     */
    ListenToAccountEvents(EventTypes) {
        result := ComCall(9, this, "int", EventTypes, "HRESULT")
        return result
    }

    /**
     * A set of flags indicating the type of events for which the account is listening.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxaccount-get_registeredevents
     */
    get_RegisteredEvents() {
        result := ComCall(10, this, "int*", &pRegisteredEvents := 0, "HRESULT")
        return pRegisteredEvents
    }
}
