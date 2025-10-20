#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsFaxNumber interface provides methods for an ADSI client to access the Facsimile Telephone Number attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsfaxnumber
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_TelephoneNumber(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTelephoneNumber 
     * @returns {HRESULT} 
     */
    put_TelephoneNumber(bstrTelephoneNumber) {
        bstrTelephoneNumber := bstrTelephoneNumber is String ? BSTR.Alloc(bstrTelephoneNumber).Value : bstrTelephoneNumber

        result := ComCall(8, this, "ptr", bstrTelephoneNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Parameters(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vParameters 
     * @returns {HRESULT} 
     */
    put_Parameters(vParameters) {
        result := ComCall(10, this, "ptr", vParameters, "HRESULT")
        return result
    }
}
