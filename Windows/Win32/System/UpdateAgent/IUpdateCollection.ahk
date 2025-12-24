#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdate.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IUpdateCollection.ahk
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
     * Gets or sets an IUpdate interface in a collection.
     * @param {Integer} index 
     * @returns {IUpdate} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &retval := 0, "HRESULT")
        return IUpdate(retval)
    }

    /**
     * Gets or sets an IUpdate interface in a collection.
     * @param {Integer} index 
     * @param {IUpdate} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-put_item
     */
    put_Item(index, value) {
        result := ComCall(8, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets an IEnumVARIANT interface that can be used to enumerate the collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * Gets the number of elements in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the update collection is read-only.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Adds an item to the collection.
     * @param {IUpdate} value An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface to be added to the collection.
     * @returns {Integer} The index of the added interface in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-add
     */
    Add(value) {
        result := ComCall(12, this, "ptr", value, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Removes all the elements from the collection.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Creates a shallow read/write copy of the collection.
     * @returns {IUpdateCollection} A shallow read/write copy of the collection.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-copy
     */
    Copy() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Inserts an item into the collection at the specified position.
     * @param {Integer} index The position at which a new interface will be inserted.
     * @param {IUpdate} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface that will be inserted.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter value is invalid or <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALIDINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An index is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-insert
     */
    Insert(index, value) {
        result := ComCall(15, this, "int", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Removes the item at the specified index from the collection.
     * @param {Integer} index The index of the interface to be removed.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALIDINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An index is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(16, this, "int", index, "HRESULT")
        return result
    }
}
