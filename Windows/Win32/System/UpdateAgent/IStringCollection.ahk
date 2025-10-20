#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_item
     */
    get_Item(index, retval) {
        result := ComCall(7, this, "int", index, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_count
     */
    get_Count(retval) {
        result := ComCall(10, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_readonly
     */
    get_ReadOnly(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-add
     */
    Add(value, retval) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, "ptr", value, "int*", retval, "HRESULT")
        return result
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
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-copy
     */
    Copy(retval) {
        result := ComCall(14, this, "ptr*", retval, "HRESULT")
        return result
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
