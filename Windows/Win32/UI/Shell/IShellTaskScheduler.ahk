#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRunnableTask.ahk" { IRunnableTask }

/**
 * IShellTaskScheduler may be altered or unavailable.
 * @remarks
 * This interface does not need to be free-threaded unless the items in the queue interact with the scheduler as well as the main execution thread on which the task scheduler was created.
 * 
 * This interface's class identifier (CLSID) is CLSID_ShellTaskScheduler, and its IID is IID_IShellTaskScheduler.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b><b>IShellTaskScheduler</b> was declared in Shlobj.h.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelltaskscheduler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellTaskScheduler extends IUnknown {
    /**
     * The interface identifier for IShellTaskScheduler
     * @type {Guid}
     */
    static IID := Guid("{6ccb7be0-6807-11d0-b810-00c04fd706ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellTaskScheduler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddTask     : IntPtr
        RemoveTasks : IntPtr
        CountTasks  : IntPtr
        Status      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellTaskScheduler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a task to the scheduler's background queue.
     * @param {IRunnableTask} prt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irunnabletask">IRunnableTask</a>*</b>
     * 
     * A pointer to an instance of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irunnabletask">IRunnableTask</a> interface representing the task to add to the queue.
     * @param {Pointer<Guid>} rtoid Type: <b>REFTASKOWNERID</b>
     * 
     * A GUID identifying the owner of the task. This information can be used to group tasks for later <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-counttasks">counting</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-removetasks">removal</a> by owner.
     * @param {Pointer} _lParam Type: <b>DWORD_PTR</b>
     * 
     * A pointer to a user-defined <b>DWORD</b> value allowing the task to be identified within the tasks owned by <i>rtoid</i>. This is used to identify single tasks or to subgroup them, for instance associating the task with a particular item such as an item in a ListView. This parameter can be zero.
     * @param {Integer} dwPriority Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-addtask
     */
    AddTask(prt, rtoid, _lParam, dwPriority) {
        result := ComCall(3, this, "ptr", prt, Guid.Ptr, rtoid, "ptr", _lParam, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * Removes tasks from the scheduler's background queue.
     * @param {Pointer<Guid>} rtoid Type: <b>REFTASKOWNERID</b>
     * 
     * A GUID identifying the owner of the tasks to remove.
     * @param {Pointer} _lParam Type: <b>DWORD_PTR</b>
     * 
     * A pointer to a user-defined <b>DWORD</b> value that allows the task to be identified within the tasks owned by <i>rtoid</i>. Set this value to 0 to remove all tasks for the owner specified by <i>rtoid</i>.
     * @param {BOOL} bWaitIfRunning Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if you want a currently running task to complete before removing it, <b>FALSE</b> otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-removetasks
     */
    RemoveTasks(rtoid, _lParam, bWaitIfRunning) {
        result := ComCall(4, this, Guid.Ptr, rtoid, "ptr", _lParam, BOOL, bWaitIfRunning, "HRESULT")
        return result
    }

    /**
     * Counts tasks with the same owner ID in the scheduler's queue.
     * @param {Pointer<Guid>} rtoid Type: <b>REFTASKOWNERID</b>
     * 
     * A GUID identifying the owner of the tasks. Supplying a specific ID will count only those tasks tagged with that owner ID. To count all items in the queue, pass TOID_NULL.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-counttasks
     */
    CountTasks(rtoid) {
        result := ComCall(5, this, Guid.Ptr, rtoid, UInt32)
        return result
    }

    /**
     * Sets the release status and background thread timeout for the current task.
     * @param {Integer} dwReleaseStatus Type: <b>DWORD</b>
     * 
     * The following flag or 0.
     * @param {Integer} dwThreadTimeout Type: <b>DWORD</b>
     * 
     * Not used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-status
     */
    Status(dwReleaseStatus, dwThreadTimeout) {
        result := ComCall(6, this, "uint", dwReleaseStatus, "uint", dwThreadTimeout, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellTaskScheduler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTask := CallbackCreate(GetMethod(implObj, "AddTask"), flags, 5)
        this.vtbl.RemoveTasks := CallbackCreate(GetMethod(implObj, "RemoveTasks"), flags, 4)
        this.vtbl.CountTasks := CallbackCreate(GetMethod(implObj, "CountTasks"), flags, 2)
        this.vtbl.Status := CallbackCreate(GetMethod(implObj, "Status"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTask)
        CallbackFree(this.vtbl.RemoveTasks)
        CallbackFree(this.vtbl.CountTasks)
        CallbackFree(this.vtbl.Status)
    }
}
