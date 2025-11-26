#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADs interface defines the basic object features, that is, properties and methods, of any ADSI object.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iads
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADs
     * @type {Guid}
     */
    static IID => Guid("{fd8256d0-fd15-11ce-abc4-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Class", "get_GUID", "get_ADsPath", "get_Parent", "get_Schema", "GetInfo", "SetInfo", "Get", "Put", "GetEx", "PutEx", "GetInfoEx"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * @type {BSTR} 
     */
    GUID {
        get => this.get_GUID()
    }

    /**
     * @type {BSTR} 
     */
    ADsPath {
        get => this.get_ADsPath()
    }

    /**
     * @type {BSTR} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    Schema {
        get => this.get_Schema()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Class() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GUID() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ADsPath() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Parent() {
        retval := BSTR()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Schema() {
        retval := BSTR()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Loads into the property cache values of the supported properties of this ADSI object from the underlying directory store.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-getinfo
     */
    GetInfo() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * The IADs::SetInfo method saves the cached property values of the ADSI object to the underlying directory store.
     * @returns {HRESULT} This method supports the standard return values, including S_OK for a successful operation. For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-setinfo
     */
    SetInfo() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a property of a given name from the property cache.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the value of the property. For a multi-valued property, <i>pvProp</i> is a variant array of <b>VARIANT</b>, unless the property is a binary type. In this latter case, <i>pvProp</i> is a variant array of bytes (VT_U1 or VT_ARRAY). For the property that refers to an object, <i>pvProp</i> is a VT_DISPATCH pointer to the object referred to.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-get
     */
    Get(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvProp := VARIANT()
        result := ComCall(15, this, "ptr", bstrName, "ptr", pvProp, "HRESULT")
        return pvProp
    }

    /**
     * Sets the values of an attribute in the ADSI attribute cache.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @param {VARIANT} vProp Contains a <b>VARIANT</b> that specifies the new values of the property.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information, and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-put
     */
    Put(bstrName, vProp) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "ptr", vProp, "HRESULT")
        return result
    }

    /**
     * Retrieves, from the property cache, property values of a given attribute.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that receives the value, or values, of the property.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-getex
     */
    GetEx(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvProp := VARIANT()
        result := ComCall(17, this, "ptr", bstrName, "ptr", pvProp, "HRESULT")
        return pvProp
    }

    /**
     * Modifies the values of an attribute in the ADSI attribute cache.
     * @param {Integer} lnControlCode Control code that  indicates the mode of modification: Append, Replace, Remove, and Delete. For more information and a list of values, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_property_operation_enum">ADS_PROPERTY_OPERATION_ENUM</a>.
     * @param {BSTR} bstrName Contains a <b>BSTR</b> that specifies the property name.
     * @param {VARIANT} vProp Contains a <b>VARIANT</b> array that contains the new value or values of the property. A single-valued property is represented as an array with a single element. If <i>InControlCode</i> is set to <b>ADS_PROPERTY_CLEAR</b>, the value of the property specified by <i>vProp</i> is irrelevant.
     * @returns {HRESULT} This method supports  standard return values, as well as the following.
     *       
     * 
     * For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-putex
     */
    PutEx(lnControlCode, bstrName, vProp) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(18, this, "int", lnControlCode, "ptr", bstrName, "ptr", vProp, "HRESULT")
        return result
    }

    /**
     * The IADs::GetInfoEx method loads the values of specified properties of the ADSI object from the underlying directory store into the property cache.
     * @param {VARIANT} vProperties Array of null-terminated Unicode string entries that list the properties to load into the Active Directory property cache. Each property name must match one in this object's schema class definition.
     * @param {Integer} lnReserved Reserved for future use. Must be set to zero.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iads-getinfoex
     */
    GetInfoEx(vProperties, lnReserved) {
        result := ComCall(19, this, "ptr", vProperties, "int", lnReserved, "HRESULT")
        return result
    }
}
