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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccount-get_accountname
     */
    get_AccountName() {
        pbstrAccountName := BSTR()
        result := ComCall(7, this, "ptr", pbstrAccountName, "HRESULT")
        return pbstrAccountName
    }

    /**
     * 
     * @returns {IFaxAccountFolders} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccount-get_folders
     */
    get_Folders() {
        result := ComCall(8, this, "ptr*", &ppFolders := 0, "HRESULT")
        return IFaxAccountFolders(ppFolders)
    }

    /**
     * 
     * @param {Integer} EventTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccount-listentoaccountevents
     */
    ListenToAccountEvents(EventTypes) {
        result := ComCall(9, this, "int", EventTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccount-get_registeredevents
     */
    get_RegisteredEvents() {
        result := ComCall(10, this, "int*", &pRegisteredEvents := 0, "HRESULT")
        return pRegisteredEvents
    }
}
