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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-getinfo
     */
    GetInfo() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-setinfo
     */
    SetInfo() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-get
     */
    Get(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvProp := VARIANT()
        result := ComCall(15, this, "ptr", bstrName, "ptr", pvProp, "HRESULT")
        return pvProp
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} vProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-put
     */
    Put(bstrName, vProp) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "ptr", vProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-getex
     */
    GetEx(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvProp := VARIANT()
        result := ComCall(17, this, "ptr", bstrName, "ptr", pvProp, "HRESULT")
        return pvProp
    }

    /**
     * 
     * @param {Integer} lnControlCode 
     * @param {BSTR} bstrName 
     * @param {VARIANT} vProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-putex
     */
    PutEx(lnControlCode, bstrName, vProp) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(18, this, "int", lnControlCode, "ptr", bstrName, "ptr", vProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vProperties 
     * @param {Integer} lnReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iads-getinfoex
     */
    GetInfoEx(vProperties, lnReserved) {
        result := ComCall(19, this, "ptr", vProperties, "int", lnReserved, "HRESULT")
        return result
    }
}
