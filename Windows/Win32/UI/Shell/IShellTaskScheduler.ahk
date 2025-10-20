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
     * 
     * @param {IRunnableTask} prt 
     * @param {Pointer<Guid>} rtoid 
     * @param {Pointer} lParam 
     * @param {Integer} dwPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-addtask
     */
    AddTask(prt, rtoid, lParam, dwPriority) {
        result := ComCall(3, this, "ptr", prt, "ptr", rtoid, "ptr", lParam, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rtoid 
     * @param {Pointer} lParam 
     * @param {BOOL} bWaitIfRunning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-removetasks
     */
    RemoveTasks(rtoid, lParam, bWaitIfRunning) {
        result := ComCall(4, this, "ptr", rtoid, "ptr", lParam, "int", bWaitIfRunning, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rtoid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelltaskscheduler-counttasks
     */
    CountTasks(rtoid) {
        result := ComCall(5, this, "ptr", rtoid, "uint")
        return result
    }

    /**
     * The Status enumeration indicates the result of a Windows GDI+ method call.
     * @remarks
     * 
     * If you construct a GDI+ object and then immediately call the 
     * 				<b>GetLastStatus</b> method of that object, you can determine whether the constructor succeeded or failed. In such cases, 
     * 				<b>GetLastStatus</b> might return <b><b>OutOfMemory</b></b> even though there was plenty of memory available to create the object. Several GDI+ constructors set the status to <b><b>OutOfMemory</b></b> when they fail regardless of the reason for failure.
     * 
     * @param {Integer} dwReleaseStatus 
     * @param {Integer} dwThreadTimeout 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/ne-gdiplustypes-status
     */
    Status(dwReleaseStatus, dwThreadTimeout) {
        result := ComCall(6, this, "uint", dwReleaseStatus, "uint", dwThreadTimeout, "HRESULT")
        return result
    }
}
