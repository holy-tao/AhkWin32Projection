#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ScheduledTileNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileUpdater extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileUpdater
     * @type {Guid}
     */
    static IID => Guid("{0942a48b-1d91-44ec-9243-c1e821c29a20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update", "Clear", "EnableNotificationQueue", "get_Setting", "AddToSchedule", "RemoveFromSchedule", "GetScheduledTileNotifications", "StartPeriodicUpdate", "StartPeriodicUpdateAtTime", "StopPeriodicUpdate", "StartPeriodicUpdateBatch", "StartPeriodicUpdateBatchAtTime"]

    /**
     * @type {Integer} 
     */
    Setting {
        get => this.get_Setting()
    }

    /**
     * Learn more about: Update constructor
     * @param {TileNotification} notification_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/update-constructor
     */
    Update(notification_) {
        result := ComCall(6, this, "ptr", notification_, "int")
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
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} enable 
     * @returns {HRESULT} 
     */
    EnableNotificationQueue(enable) {
        result := ComCall(8, this, "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Setting() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {ScheduledTileNotification} scheduledTile 
     * @returns {HRESULT} 
     */
    AddToSchedule(scheduledTile) {
        result := ComCall(10, this, "ptr", scheduledTile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ScheduledTileNotification} scheduledTile 
     * @returns {HRESULT} 
     */
    RemoveFromSchedule(scheduledTile) {
        result := ComCall(11, this, "ptr", scheduledTile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<ScheduledTileNotification>} 
     */
    GetScheduledTileNotifications() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ScheduledTileNotification, result_)
    }

    /**
     * 
     * @param {Uri} tileContent 
     * @param {Integer} requestedInterval 
     * @returns {HRESULT} 
     */
    StartPeriodicUpdate(tileContent, requestedInterval) {
        result := ComCall(13, this, "ptr", tileContent, "int", requestedInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} tileContent 
     * @param {DateTime} startTime 
     * @param {Integer} requestedInterval 
     * @returns {HRESULT} 
     */
    StartPeriodicUpdateAtTime(tileContent, startTime, requestedInterval) {
        result := ComCall(14, this, "ptr", tileContent, "ptr", startTime, "int", requestedInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopPeriodicUpdate() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<Uri>} tileContents 
     * @param {Integer} requestedInterval 
     * @returns {HRESULT} 
     */
    StartPeriodicUpdateBatch(tileContents, requestedInterval) {
        result := ComCall(16, this, "ptr", tileContents, "int", requestedInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<Uri>} tileContents 
     * @param {DateTime} startTime 
     * @param {Integer} requestedInterval 
     * @returns {HRESULT} 
     */
    StartPeriodicUpdateBatchAtTime(tileContents, startTime, requestedInterval) {
        result := ComCall(17, this, "ptr", tileContents, "ptr", startTime, "int", requestedInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
