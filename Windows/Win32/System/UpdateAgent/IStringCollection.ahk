#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IStringCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents an ordered list of strings.
 * @remarks
 * 
 * This interface can be instantiated by using the StringCollection coclass. Use the Microsoft.Update.StringColl program identifier to create the object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-istringcollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IStringCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStringCollection
     * @type {Guid}
     */
    static IID => Guid("{eff90582-2ddc-480f-a06d-60f3fbc362c3}")

    /**
     * The class identifier for StringCollection
     * @type {Guid}
     */
    static CLSID => Guid("{72c97d74-7c3b-40ae-b77d-abdb22eba6fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "put_Item", "get__NewEnum", "get_Count", "get_ReadOnly", "Add", "Clear", "Copy", "Insert", "RemoveAt"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_item
     */
    get_Item(index) {
        retval := BSTR()
        result := ComCall(7, this, "int", index, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} index 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-put_item
     */
    put_Item(index, value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-add
     */
    Add(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, "ptr", value, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-copy
     */
    Copy() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @param {Integer} index 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-insert
     */
    Insert(index, value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(16, this, "int", index, "HRESULT")
        return result
    }
}
