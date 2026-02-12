#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemRefreshableItem.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemRefresher extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemRefresher
     * @type {Guid}
     */
    static IID => Guid("{14d8250e-d9c2-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemRefresher
     * @type {Guid}
     */
    static CLSID => Guid("{d269bf5c-d9c1-11d3-b38f-00105a1f473a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "AddEnum", "Remove", "Refresh", "get_AutoReconnect", "put_AutoReconnect", "DeleteAll"]

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
    AutoReconnect {
        get => this.get_AutoReconnect()
        set => this.put_AutoReconnect(value)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pUnk)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} iIndex 
     * @returns {ISWbemRefreshableItem} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(iIndex) {
        result := ComCall(8, this, "int", iIndex, "ptr*", &objWbemRefreshableItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iCount
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsInstancePath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemRefreshableItem} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(objWbemServices, bsInstancePath, iFlags, objWbemNamedValueSet) {
        if(bsInstancePath is String) {
            pin := BSTR.Alloc(bsInstancePath)
            bsInstancePath := pin.Value
        }

        result := ComCall(10, this, "ptr", objWbemServices, "ptr", bsInstancePath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemRefreshableItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * 
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsClassName 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemRefreshableItem} 
     */
    AddEnum(objWbemServices, bsClassName, iFlags, objWbemNamedValueSet) {
        if(bsClassName is String) {
            pin := BSTR.Alloc(bsClassName)
            bsClassName := pin.Value
        }

        result := ComCall(11, this, "ptr", objWbemServices, "ptr", bsClassName, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemRefreshableItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemRefreshableItem(objWbemRefreshableItem)
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {Integer} iIndex 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(iIndex, iFlags) {
        result := ComCall(12, this, "int", iIndex, "int", iFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh(iFlags) {
        result := ComCall(13, this, "int", iFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AutoReconnect() {
        result := ComCall(14, this, "short*", &bCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bCount
    }

    /**
     * 
     * @param {VARIANT_BOOL} bCount 
     * @returns {HRESULT} 
     */
    put_AutoReconnect(bCount) {
        result := ComCall(15, this, "short", bCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpedit/nf-gpedit-deleteallgpolinks
     */
    DeleteAll() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
