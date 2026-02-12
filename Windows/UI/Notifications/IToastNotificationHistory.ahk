#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationHistory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationHistory
     * @type {Guid}
     */
    static IID => Guid("{5caddc63-01d3-4c97-986f-0533483fee14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveGroup", "RemoveGroupWithId", "RemoveGroupedTagWithId", "RemoveGroupedTag", "Remove2", "Clear", "ClearWithId"]

    /**
     * 
     * @param {HSTRING} group 
     * @returns {HRESULT} 
     */
    RemoveGroup(group) {
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group

        result := ComCall(6, this, "ptr", group, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} group 
     * @param {HSTRING} applicationId 
     * @returns {HRESULT} 
     */
    RemoveGroupWithId(group, applicationId) {
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", group, "ptr", applicationId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {HSTRING} tag 
     * @param {HSTRING} group 
     * @param {HSTRING} applicationId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    RemoveGroupedTagWithId(tag, group, applicationId) {
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(8, this, "ptr", tag, "ptr", group, "ptr", applicationId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {HSTRING} tag 
     * @param {HSTRING} group 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    RemoveGroupedTag(tag, group) {
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group

        result := ComCall(9, this, "ptr", tag, "ptr", group, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {HSTRING} tag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove2(tag) {
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag

        result := ComCall(10, this, "ptr", tag, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @param {HSTRING} applicationId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    ClearWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(12, this, "ptr", applicationId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
