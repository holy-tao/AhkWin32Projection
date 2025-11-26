#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a generic name-value pair.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509namevaluepair
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509NameValuePair extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509NameValuePair
     * @type {Guid}
     */
    static IID => Guid("{728ab33f-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Value", "get_Name"]

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Initializes the object from strings that contain the name and associated value.
     * @param {BSTR} strName A <b>BSTR</b> variable that contains the name.
     * @param {BSTR} strValue A <b>BSTR</b> variable that contains the value.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509namevaluepair-initialize
     */
    Initialize(strName, strValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(7, this, "ptr", strName, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the value portion of the name-value pair.
     * @remarks
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509namevaluepair-initialize">Initialize</a> method before calling this property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509namevaluepair-get_value
     */
    get_Value() {
        pValue := BSTR()
        result := ComCall(8, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the name portion of the name-value pair.
     * @remarks
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509namevaluepair-initialize">Initialize</a> method before calling this property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509namevaluepair-get_name
     */
    get_Name() {
        pValue := BSTR()
        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
