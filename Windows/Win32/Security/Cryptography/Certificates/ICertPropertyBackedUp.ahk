#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertProperty.ahk

/**
 * Represents an external certificate property that identifies whether a certificate has been backed up and, if so, the date and time that it was saved.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertybackedup
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyBackedUp extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyBackedUp
     * @type {Guid}
     */
    static IID => Guid("{728ab338-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromCurrentTime", "Initialize", "get_BackedUpValue", "get_BackedUpTime"]

    /**
     * @type {VARIANT_BOOL} 
     */
    BackedUpValue {
        get => this.get_BackedUpValue()
    }

    /**
     * @type {Float} 
     */
    BackedUpTime {
        get => this.get_BackedUpTime()
    }

    /**
     * Initializes the property from a Boolean value and the current system date and time.
     * @param {VARIANT_BOOL} BackedUpValue A <b>VARIANT_BOOL</b> variable that identifies whether the certificate has been backed up.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified time is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertybackedup-initializefromcurrenttime
     */
    InitializeFromCurrentTime(BackedUpValue) {
        result := ComCall(14, this, "short", BackedUpValue, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a Boolean value and a date.
     * @param {VARIANT_BOOL} BackedUpValue A <b>VARIANT_BOOL</b> variable that identifies whether the certificate has been backed up.
     * @param {Float} Date A <b>DATE</b> variable that identifies when a certificate was last backed up.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified time is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertybackedup-initialize
     */
    Initialize(BackedUpValue, Date) {
        result := ComCall(15, this, "short", BackedUpValue, "double", Date, "HRESULT")
        return result
    }

    /**
     * Retrieves a Boolean value that identifies whether the certificate was backed up.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertybackedup-initialize">Initialize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertybackedup-initializefromcurrenttime">InitializeFromCurrentTime</a> method to set the <b>BackedUpValue</b> property value.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertybackedup-get_backedupvalue
     */
    get_BackedUpValue() {
        result := ComCall(16, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the date and time at which the certificate was backed up.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertybackedup-initialize">Initialize</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertybackedup-initializefromcurrenttime">InitializeFromCurrentTime</a> method to set the <b>BackedUpTime</b> value.
     * 
     * The date is stored as an 8-byte real value, representing a date between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * 
     * For dates between 1950 and 2049 inclusive, the date and time is encoded UTC-time in the form YYMMDDHHMMSS. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertybackedup-get_backeduptime
     */
    get_BackedUpTime() {
        result := ComCall(17, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }
}
