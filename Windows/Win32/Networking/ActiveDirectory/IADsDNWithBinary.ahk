#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsDNWithBinary interface provides methods for an ADSI client to associate a distinguished name (DN) with the GUID of an object.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsdnwithbinary
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsDNWithBinary extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsDNWithBinary
     * @type {Guid}
     */
    static IID => Guid("{7e99c0a2-f935-11d2-ba96-00c04fb6d0d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BinaryValue", "put_BinaryValue", "get_DNString", "put_DNString"]

    /**
     * @type {VARIANT} 
     */
    BinaryValue {
        get => this.get_BinaryValue()
        set => this.put_BinaryValue(value)
    }

    /**
     * @type {BSTR} 
     */
    DNString {
        get => this.get_DNString()
        set => this.put_DNString(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_BinaryValue() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vBinaryValue 
     * @returns {HRESULT} 
     */
    put_BinaryValue(vBinaryValue) {
        result := ComCall(8, this, "ptr", vBinaryValue, "HRESULT")
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
