#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateIdentity.ahk" { IUpdateIdentity }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\OperationResultCode.ahk" { OperationResultCode }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStringCollection.ahk" { IStringCollection }
#Import ".\UpdateOperation.ahk" { UpdateOperation }
#Import ".\ServerSelection.ahk" { ServerSelection }

/**
 * Represents the recorded history of an update. (IUpdateHistoryEntry)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatehistoryentry
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateHistoryEntry extends IDispatch {
    /**
     * The interface identifier for IUpdateHistoryEntry
     * @type {Guid}
     */
    static IID := Guid("{be56a644-af0e-4e0e-a311-c1d8e695cbff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateHistoryEntry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Operation           : IntPtr
        get_ResultCode          : IntPtr
        get_HResult             : IntPtr
        get_Date                : IntPtr
        get_UpdateIdentity      : IntPtr
        get_Title               : IntPtr
        get_Description         : IntPtr
        get_UnmappedResultCode  : IntPtr
        get_ClientApplicationID : IntPtr
        get_ServerSelection     : IntPtr
        get_ServiceID           : IntPtr
        get_UninstallationSteps : IntPtr
        get_UninstallationNotes : IntPtr
        get_SupportUrl          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateHistoryEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UpdateOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * @type {OperationResultCode} 
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
     * @type {ServerSelection} 
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
     * @returns {UpdateOperation} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_operation
     */
    get_Operation() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an OperationResultCode value that specifies the result of an operation on an update. (IUpdateHistoryEntry.get_ResultCode)
     * @returns {OperationResultCode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the HRESULT value that is returned from the operation on an update.
     * @remarks
     * The returned value is a mapped exception code. To retrieve the actual exception code, use the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry-get_unmappedresultcode">UnmappedResultCode</a> property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_hresult
     */
    get_HResult() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the date and the time an update was applied.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_date
     */
    get_Date() {
        result := ComCall(10, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the IUpdateIdentity interface that contains the identity of the update.
     * @returns {IUpdateIdentity} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_updateidentity
     */
    get_UpdateIdentity() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateIdentity(retval)
    }

    /**
     * Gets the title of an update.
     * @remarks
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   </li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_title
     */
    get_Title() {
        retval := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the description of an update.
     * @remarks
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.</li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_description
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the unmapped result code that is returned from an operation on an update.
     * @remarks
     * The returned value is an unmapped result code. To retrieve a mapped exception code, use the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry-get_hresult">HResult</a> property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_unmappedresultcode
     */
    get_UnmappedResultCode() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the identifier of the client application that processed an update.
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the ServerSelection value that indicates which server provided an update.
     * @returns {ServerSelection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_serverselection
     */
    get_ServerSelection() {
        result := ComCall(16, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the service identifier of an update service that is not a Windows update.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the IStringCollection interface that contains the uninstallation steps for an update.
     * @remarks
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   </li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_uninstallationsteps
     */
    get_UninstallationSteps() {
        result := ComCall(18, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets the uninstallation notes of an update.
     * @remarks
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.</li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_uninstallationnotes
     */
    get_UninstallationNotes() {
        retval := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a hyperlink to the language-specific support information for an update.
     * @remarks
     * The information that   this property returns is for the default user interface (UI) language of the user. However, note the following: 
     * 
     * <ul>
     * <li>If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   </li>
     * <li>If the default language of the computer is unavailable, WUA uses the language that the provider of the  update recommends.</li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry-get_supporturl
     */
    get_SupportUrl() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateHistoryEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Operation := CallbackCreate(GetMethod(implObj, "get_Operation"), flags, 2)
        this.vtbl.get_ResultCode := CallbackCreate(GetMethod(implObj, "get_ResultCode"), flags, 2)
        this.vtbl.get_HResult := CallbackCreate(GetMethod(implObj, "get_HResult"), flags, 2)
        this.vtbl.get_Date := CallbackCreate(GetMethod(implObj, "get_Date"), flags, 2)
        this.vtbl.get_UpdateIdentity := CallbackCreate(GetMethod(implObj, "get_UpdateIdentity"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_UnmappedResultCode := CallbackCreate(GetMethod(implObj, "get_UnmappedResultCode"), flags, 2)
        this.vtbl.get_ClientApplicationID := CallbackCreate(GetMethod(implObj, "get_ClientApplicationID"), flags, 2)
        this.vtbl.get_ServerSelection := CallbackCreate(GetMethod(implObj, "get_ServerSelection"), flags, 2)
        this.vtbl.get_ServiceID := CallbackCreate(GetMethod(implObj, "get_ServiceID"), flags, 2)
        this.vtbl.get_UninstallationSteps := CallbackCreate(GetMethod(implObj, "get_UninstallationSteps"), flags, 2)
        this.vtbl.get_UninstallationNotes := CallbackCreate(GetMethod(implObj, "get_UninstallationNotes"), flags, 2)
        this.vtbl.get_SupportUrl := CallbackCreate(GetMethod(implObj, "get_SupportUrl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Operation)
        CallbackFree(this.vtbl.get_ResultCode)
        CallbackFree(this.vtbl.get_HResult)
        CallbackFree(this.vtbl.get_Date)
        CallbackFree(this.vtbl.get_UpdateIdentity)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_UnmappedResultCode)
        CallbackFree(this.vtbl.get_ClientApplicationID)
        CallbackFree(this.vtbl.get_ServerSelection)
        CallbackFree(this.vtbl.get_ServiceID)
        CallbackFree(this.vtbl.get_UninstallationSteps)
        CallbackFree(this.vtbl.get_UninstallationNotes)
        CallbackFree(this.vtbl.get_SupportUrl)
    }
}
