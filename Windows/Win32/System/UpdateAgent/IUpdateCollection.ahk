#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents an ordered list of updates.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateCollection coclass. Use the Microsoft.Update.UpdateColl program identifier to create the object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatecollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateCollection
     * @type {Guid}
     */
    static IID => Guid("{07f7438c-7709-4ca5-b518-91279288134e}")

    /**
     * The class identifier for UpdateCollection
     * @type {Guid}
     */
    static CLSID => Guid("{13639463-00db-4646-803d-528026140d88}")

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
     * @param {Pointer<IUpdate>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-get_item
     */
    get_Item(index, retval) {
        result := ComCall(7, this, "int", index, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IUpdate} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-put_item
     */
    put_Item(index, value) {
        result := ComCall(8, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-get_count
     */
    get_Count(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-get_readonly
     */
    get_ReadOnly(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUpdate} value 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-add
     */
    Add(value, retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", value, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-copy
     */
    Copy(retval) {
        result := ComCall(14, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IUpdate} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-insert
     */
    Insert(index, value) {
        result := ComCall(15, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(16, this, "int", index, "HRESULT")
        return result
    }
}
