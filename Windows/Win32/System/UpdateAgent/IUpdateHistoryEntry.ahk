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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_operation
     */
    get_Operation() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_hresult
     */
    get_HResult() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_date
     */
    get_Date() {
        result := ComCall(10, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IUpdateIdentity} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_updateidentity
     */
    get_UpdateIdentity() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateIdentity(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_title
     */
    get_Title() {
        retval := BSTR()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_description
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_unmappedresultcode
     */
    get_UnmappedResultCode() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_serverselection
     */
    get_ServerSelection() {
        result := ComCall(16, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR()
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_uninstallationsteps
     */
    get_UninstallationSteps() {
        result := ComCall(18, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_uninstallationnotes
     */
    get_UninstallationNotes() {
        retval := BSTR()
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_supporturl
     */
    get_SupportUrl() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }
}
