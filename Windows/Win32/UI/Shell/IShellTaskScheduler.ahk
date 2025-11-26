#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IShellTaskScheduler may be altered or unavailable.
 * @remarks
 * 
 * This interface does not need to be free-threaded unless the items in the queue interact with the scheduler as well as the main execution thread on which the task scheduler was created.
 * 
 * This interface's class identifier (CLSID) is CLSID_ShellTaskScheduler, and its IID is IID_IShellTaskScheduler.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b><b>IShellTaskScheduler</b> was declared in Shlobj.h.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishelltaskscheduler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellTaskScheduler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellTaskScheduler
     * @type {Guid}
     */
    static IID => Guid("{6ccb7be0-6807-11d0-b810-00c04fd706ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTask", "RemoveTasks", "CountTasks", "Status"]

    /**
     * Adds a task to the scheduler's background queue.
     * @param {IRunnableTask} prt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irunnabletask">IRunnableTask</a>*</b>
     * 
     * A pointer to an instance of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irunnabletask">IRunnableTask</a> interface representing the task to add to the queue.
     * @param {Pointer<Guid>} rtoid Type: <b>REFTASKOWNERID</b>
     * 
     * A GUID identifying the owner of the task. This information can be used to group tasks for later <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-counttasks">counting</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-removetasks">removal</a> by owner.
     * @param {Pointer} lParam Type: <b>DWORD_PTR</b>
     * 
     * A pointer to a user-defined <b>DWORD</b> value allowing the task to be identified within the tasks owned by <i>rtoid</i>. This is used to identify single tasks or to subgroup them, for instance associating the task with a particular item such as an item in a ListView. This parameter can be zero.
     * @param {Integer} dwPriority Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-addtask
     */
    AddTask(prt, rtoid, lParam, dwPriority) {
        result := ComCall(3, this, "ptr", prt, "ptr", rtoid, "ptr", lParam, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * Removes tasks from the scheduler's background queue.
     * @param {Pointer<Guid>} rtoid Type: <b>REFTASKOWNERID</b>
     * 
     * A GUID identifying the owner of the tasks to remove.
     * @param {Pointer} lParam Type: <b>DWORD_PTR</b>
     * 
     * A pointer to a user-defined <b>DWORD</b> value that allows the task to be identified within the tasks owned by <i>rtoid</i>. Set this value to 0 to remove all tasks for the owner specified by <i>rtoid</i>.
     * @param {BOOL} bWaitIfRunning Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if you want a currently running task to complete before removing it, <b>FALSE</b> otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-removetasks
     */
    RemoveTasks(rtoid, lParam, bWaitIfRunning) {
        result := ComCall(4, this, "ptr", rtoid, "ptr", lParam, "int", bWaitIfRunning, "HRESULT")
        return result
    }

    /**
     * Counts tasks with the same owner ID in the scheduler's queue.
     * @param {Pointer<Guid>} rtoid Type: <b>REFTASKOWNERID</b>
     * 
     * A GUID identifying the owner of the tasks. Supplying a specific ID will count only those tasks tagged with that owner ID. To count all items in the queue, pass TOID_NULL.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-counttasks
     */
    CountTasks(rtoid) {
        result := ComCall(5, this, "ptr", rtoid, "uint")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-status
     */
    Status(dwReleaseStatus, dwThreadTimeout) {
        result := ComCall(6, this, "uint", dwReleaseStatus, "uint", dwThreadTimeout, "HRESULT")
        return result
    }
}
