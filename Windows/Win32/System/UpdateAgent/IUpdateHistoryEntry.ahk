#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateIdentity.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IStringCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the recorded history of an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatehistoryentry
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateHistoryEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateHistoryEntry
     * @type {Guid}
     */
    static IID => Guid("{be56a644-af0e-4e0e-a311-c1d8e695cbff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Operation", "get_ResultCode", "get_HResult", "get_Date", "get_UpdateIdentity", "get_Title", "get_Description", "get_UnmappedResultCode", "get_ClientApplicationID", "get_ServerSelection", "get_ServiceID", "get_UninstallationSteps", "get_UninstallationNotes", "get_SupportUrl"]

    /**
     * @type {Integer} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * @type {Integer} 
     */
    HResult {
        get => this.get_HResult()
    }

    /**
     * @type {Float} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * @type {IUpdateIdentity} 
     */
    UpdateIdentity {
        get => this.get_UpdateIdentity()
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Integer} 
     */
    UnmappedResultCode {
        get => this.get_UnmappedResultCode()
    }

    /**
     * @type {BSTR} 
     */
    ClientApplicationID {
        get => this.get_ClientApplicationID()
    }

    /**
     * @type {Integer} 
     */
    ServerSelection {
        get => this.get_ServerSelection()
    }

    /**
     * @type {BSTR} 
     */
    ServiceID {
        get => this.get_ServiceID()
    }

    /**
     * @type {IStringCollection} 
     */
    UninstallationSteps {
        get => this.get_UninstallationSteps()
    }

    /**
     * @type {BSTR} 
     */
    UninstallationNotes {
        get => this.get_UninstallationNotes()
    }

    /**
     * @type {BSTR} 
     */
    SupportUrl {
        get => this.get_SupportUrl()
    }

    /**
     * Gets an UpdateOperation value that specifies the operation on an update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_operation
     */
    get_Operation() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an OperationResultCode value that specifies the result of an operation on an update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the HRESULT value that is returned from the operation on an update.
     * @remarks
     * 
     * The returned value is a mapped exception code. To retrieve the actual exception code, use the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry-get_unmappedresultcode">UnmappedResultCode</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_hresult
     */
    get_HResult() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the date and the time an update was applied.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_date
     */
    get_Date() {
        result := ComCall(10, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the IUpdateIdentity interface that contains the identity of the update.
     * @returns {IUpdateIdentity} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_updateidentity
     */
    get_UpdateIdentity() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateIdentity(retval)
    }

    /**
     * Gets the title of an update.
     * @remarks
     * 
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   </li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_title
     */
    get_Title() {
        retval := BSTR()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the description of an update.
     * @remarks
     * 
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.</li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_description
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the unmapped result code that is returned from an operation on an update.
     * @remarks
     * 
     * The returned value is an unmapped result code. To retrieve a mapped exception code, use the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry-get_hresult">HResult</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_unmappedresultcode
     */
    get_UnmappedResultCode() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the identifier of the client application that processed an update.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the ServerSelection value that indicates which server provided an update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_serverselection
     */
    get_ServerSelection() {
        result := ComCall(16, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the service identifier of an update service that is not a Windows update.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR()
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the IStringCollection interface that contains the uninstallation steps for an update.
     * @remarks
     * 
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   </li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * 
     * 
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_uninstallationsteps
     */
    get_UninstallationSteps() {
        result := ComCall(18, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets the uninstallation notes of an update.
     * @remarks
     * 
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.</li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_uninstallationnotes
     */
    get_UninstallationNotes() {
        retval := BSTR()
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a hyperlink to the language-specific support information for an update.
     * @remarks
     * 
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   </li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry-get_supporturl
     */
    get_SupportUrl() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }
}
