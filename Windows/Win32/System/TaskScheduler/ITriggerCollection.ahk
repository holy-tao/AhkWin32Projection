#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITrigger.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods that are used to add to, remove from, and get the triggers of a task.
 * @remarks
 * 
 * When reading or writing XML for a task, the triggers for the task are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-triggers-tasktype-element">Triggers</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itriggercollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITriggerCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITriggerCollection
     * @type {Guid}
     */
    static IID => Guid("{85df5081-1b24-4f32-878a-d9d14df4cb77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Create", "Remove", "Clear"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itriggercollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ITrigger} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itriggercollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &ppTrigger := 0, "HRESULT")
        return ITrigger(ppTrigger)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itriggercollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {ITrigger} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itriggercollection-create
     */
    Create(type) {
        result := ComCall(10, this, "int", type, "ptr*", &ppTrigger := 0, "HRESULT")
        return ITrigger(ppTrigger)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itriggercollection-remove
     */
    Remove(index) {
        result := ComCall(11, this, "ptr", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itriggercollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
