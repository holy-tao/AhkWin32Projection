#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509EnrollmentStatus interface can be used to specify or retrieve detailed error information about a certificate enrollment transaction.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmentstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EnrollmentStatus
     * @type {Guid}
     */
    static IID => Guid("{728ab304-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AppendText", "get_Text", "put_Text", "get_Selected", "put_Selected", "get_Display", "put_Display", "get_Status", "put_Status", "get_Error", "put_Error", "get_ErrorText"]

    /**
     * @type {BSTR} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * @type {Integer} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * @type {Integer} 
     */
    Display {
        get => this.get_Display()
        set => this.put_Display(value)
    }

    /**
     * @type {Integer} 
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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-appendtext
     */
    AppendText(strText) {
        strText := strText is String ? BSTR.Alloc(strText).Value : strText

        result := ComCall(7, this, "ptr", strText, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains a message associated with the status of the enrollment process.
     * @remarks
     * 
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-appendtext">AppendText</a> method to add information to the message.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-get_text
     */
    get_Text() {
        pValue := BSTR()
        result := ComCall(8, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains a message associated with the status of the enrollment process.
     * @remarks
     * 
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-appendtext">AppendText</a> method to add information to the message.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-put_text
     */
    put_Text(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(9, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates whether an item can be used during the enrollment process.
     * @remarks
     * 
     * This property is currently used only to identify which cryptographic provider/algorithm pairs can be used to create a key. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses">GetCspStatuses</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-get_selected
     */
    get_Selected() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates whether an item can be used during the enrollment process.
     * @remarks
     * 
     * This property is currently used only to identify which cryptographic provider/algorithm pairs can be used to create a key. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses">GetCspStatuses</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-put_selected
     */
    put_Selected(Value) {
        result := ComCall(11, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates whether to display the status information in a user interface.
     * @remarks
     * 
     * This property is used by the Certificate Enrollment wizard to determine whether to display the item with which it is associated. Currently, setting this value does not affect enrollment behavior.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-get_display
     */
    get_Display() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates whether to display the status information in a user interface.
     * @remarks
     * 
     * This property is used by the Certificate Enrollment wizard to determine whether to display the item with which it is associated. Currently, setting this value does not affect enrollment behavior.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-put_display
     */
    put_Display(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates the status of the enrollment process.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-get_status
     */
    get_Status() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates the status of the enrollment process.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-put_status
     */
    put_Status(Value) {
        result := ComCall(15, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a value that identifies the error status of the certificate enrollment process.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-get_error
     */
    get_Error() {
        result := ComCall(16, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a value that identifies the error status of the certificate enrollment process.
     * @param {HRESULT} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-put_error
     */
    put_Error(Value) {
        result := ComCall(17, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains the message associated with the error result code returned by the Error property.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentstatus-get_errortext
     */
    get_ErrorText() {
        pValue := BSTR()
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
