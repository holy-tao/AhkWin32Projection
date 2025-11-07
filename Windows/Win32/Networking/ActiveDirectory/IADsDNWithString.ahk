#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsDNWithString interface provides methods for an ADSI client to associate a distinguished name (DN) to a string value.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsdnwithstring
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsDNWithString extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsDNWithString
     * @type {Guid}
     */
    static IID => Guid("{370df02e-f934-11d2-ba96-00c04fb6d0d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StringValue", "put_StringValue", "get_DNString", "put_DNString"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_StringValue() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrStringValue 
     * @returns {HRESULT} 
     */
    put_StringValue(bstrStringValue) {
        bstrStringValue := bstrStringValue is String ? BSTR.Alloc(bstrStringValue).Value : bstrStringValue

        result := ComCall(8, this, "ptr", bstrStringValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DNString() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDNString 
     * @returns {HRESULT} 
     */
    put_DNString(bstrDNString) {
        bstrDNString := bstrDNString is String ? BSTR.Alloc(bstrDNString).Value : bstrDNString

        result := ComCall(10, this, "ptr", bstrDNString, "HRESULT")
        return result
    }
}
