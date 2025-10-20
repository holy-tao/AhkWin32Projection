#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtaskcollection-get_count
     */
    get_Count(pCount) {
        result := ComCall(7, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IRunningTask>} ppRunningTask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtaskcollection-get_item
     */
    get_Item(index, ppRunningTask) {
        result := ComCall(8, this, "ptr", index, "ptr*", ppRunningTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtaskcollection-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
