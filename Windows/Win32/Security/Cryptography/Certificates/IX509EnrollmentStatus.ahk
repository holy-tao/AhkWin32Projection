#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EnrollmentSelectionStatus.ahk" { EnrollmentSelectionStatus }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EnrollmentEnrollStatus.ahk" { EnrollmentEnrollStatus }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EnrollmentDisplayStatus.ahk" { EnrollmentDisplayStatus }

/**
 * The IX509EnrollmentStatus interface can be used to specify or retrieve detailed error information about a certificate enrollment transaction.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509enrollmentstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509EnrollmentStatus extends IDispatch {
    /**
     * The interface identifier for IX509EnrollmentStatus
     * @type {Guid}
     */
    static IID := Guid("{728ab304-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509EnrollmentStatus interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        AppendText    : IntPtr
        get_Text      : IntPtr
        put_Text      : IntPtr
        get_Selected  : IntPtr
        put_Selected  : IntPtr
        get_Display   : IntPtr
        put_Display   : IntPtr
        get_Status    : IntPtr
        put_Status    : IntPtr
        get_Error     : IntPtr
        put_Error     : IntPtr
        get_ErrorText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509EnrollmentStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * @type {EnrollmentSelectionStatus} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * @type {EnrollmentDisplayStatus} 
     */
    Display {
        get => this.get_Display()
        set => this.put_Display(value)
    }

    /**
     * @type {EnrollmentEnrollStatus} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * @type {HRESULT} 
     */
    Error {
        get => this.get_Error()
        set => this.put_Error(value)
    }

    /**
     * @type {BSTR} 
     */
    ErrorText {
        get => this.get_ErrorText()
    }

    /**
     * Appends a string to the status information contained in the Text property.
     * @param {BSTR} strText A <b>BSTR</b> variable that contains the text to add.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-appendtext
     */
    AppendText(strText) {
        strText := strText is String ? BSTR.Alloc(strText).Value : strText

        result := ComCall(7, this, BSTR, strText, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains a message associated with the status of the enrollment process. (Get)
     * @remarks
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-appendtext">AppendText</a> method to add information to the message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_text
     */
    get_Text() {
        pValue := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains a message associated with the status of the enrollment process. (Put)
     * @remarks
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-appendtext">AppendText</a> method to add information to the message.
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-put_text
     */
    put_Text(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(9, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates whether an item can be used during the enrollment process. (Get)
     * @remarks
     * This property is currently used only to identify which cryptographic provider/algorithm pairs can be used to create a key. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses">GetCspStatuses</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * @returns {EnrollmentSelectionStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected
     */
    get_Selected() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates whether an item can be used during the enrollment process. (Put)
     * @remarks
     * This property is currently used only to identify which cryptographic provider/algorithm pairs can be used to create a key. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses">GetCspStatuses</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * @param {EnrollmentSelectionStatus} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-put_selected
     */
    put_Selected(Value) {
        result := ComCall(11, this, EnrollmentSelectionStatus, Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates whether to display the status information in a user interface. (Get)
     * @remarks
     * This property is used by the Certificate Enrollment wizard to determine whether to display the item with which it is associated. Currently, setting this value does not affect enrollment behavior.
     * @returns {EnrollmentDisplayStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display
     */
    get_Display() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates whether to display the status information in a user interface. (Put)
     * @remarks
     * This property is used by the Certificate Enrollment wizard to determine whether to display the item with which it is associated. Currently, setting this value does not affect enrollment behavior.
     * @param {EnrollmentDisplayStatus} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-put_display
     */
    put_Display(Value) {
        result := ComCall(13, this, EnrollmentDisplayStatus, Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates the status of the enrollment process. (Get)
     * @returns {EnrollmentEnrollStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_status
     */
    get_Status() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates the status of the enrollment process. (Put)
     * @param {EnrollmentEnrollStatus} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-put_status
     */
    put_Status(Value) {
        result := ComCall(15, this, EnrollmentEnrollStatus, Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a value that identifies the error status of the certificate enrollment process. (Get)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_error
     */
    get_Error() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a value that identifies the error status of the certificate enrollment process. (Put)
     * @param {HRESULT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-put_error
     */
    put_Error(Value) {
        result := ComCall(17, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains the message associated with the error result code returned by the Error property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_errortext
     */
    get_ErrorText() {
        pValue := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509EnrollmentStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AppendText := CallbackCreate(GetMethod(implObj, "AppendText"), flags, 2)
        this.vtbl.get_Text := CallbackCreate(GetMethod(implObj, "get_Text"), flags, 2)
        this.vtbl.put_Text := CallbackCreate(GetMethod(implObj, "put_Text"), flags, 2)
        this.vtbl.get_Selected := CallbackCreate(GetMethod(implObj, "get_Selected"), flags, 2)
        this.vtbl.put_Selected := CallbackCreate(GetMethod(implObj, "put_Selected"), flags, 2)
        this.vtbl.get_Display := CallbackCreate(GetMethod(implObj, "get_Display"), flags, 2)
        this.vtbl.put_Display := CallbackCreate(GetMethod(implObj, "put_Display"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.put_Status := CallbackCreate(GetMethod(implObj, "put_Status"), flags, 2)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
        this.vtbl.put_Error := CallbackCreate(GetMethod(implObj, "put_Error"), flags, 2)
        this.vtbl.get_ErrorText := CallbackCreate(GetMethod(implObj, "get_ErrorText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AppendText)
        CallbackFree(this.vtbl.get_Text)
        CallbackFree(this.vtbl.put_Text)
        CallbackFree(this.vtbl.get_Selected)
        CallbackFree(this.vtbl.put_Selected)
        CallbackFree(this.vtbl.get_Display)
        CallbackFree(this.vtbl.put_Display)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.put_Status)
        CallbackFree(this.vtbl.get_Error)
        CallbackFree(this.vtbl.put_Error)
        CallbackFree(this.vtbl.get_ErrorText)
    }
}
