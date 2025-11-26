#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRunningTask.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides a collection that is used to control running tasks.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-irunningtaskcollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRunningTaskCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRunningTaskCollection
     * @type {Guid}
     */
    static IID => Guid("{6a67614b-6828-4fec-aa54-6d52e8f1f2db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtaskcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {IRunningTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtaskcollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtaskcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }
}
