#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsFaxNumber interface provides methods for an ADSI client to access the Facsimile Telephone Number attribute.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadsfaxnumber
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsFaxNumber extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsFaxNumber
     * @type {Guid}
     */
    static IID => Guid("{a910dea9-4680-11d1-a3b4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TelephoneNumber", "put_TelephoneNumber", "get_Parameters", "put_Parameters"]

    /**
     * @type {BSTR} 
     */
    TelephoneNumber {
        get => this.get_TelephoneNumber()
        set => this.put_TelephoneNumber(value)
    }

    /**
     * @type {VARIANT} 
     */
    Parameters {
        get => this.get_Parameters()
        set => this.put_Parameters(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TelephoneNumber() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrTelephoneNumber 
     * @returns {HRESULT} 
     */
    put_TelephoneNumber(bstrTelephoneNumber) {
        if(bstrTelephoneNumber is String) {
            pin := BSTR.Alloc(bstrTelephoneNumber)
            bstrTelephoneNumber := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrTelephoneNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Parameters() {
        retval := VARIANT()
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {VARIANT} vParameters 
     * @returns {HRESULT} 
     */
    put_Parameters(vParameters) {
        result := ComCall(10, this, "ptr", vParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
