#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A free-threaded interface that can be exposed by an object to allow operations to be performed on a background thread.
 * @remarks
 * Implement <b>IRunnableTask</b> if your namespace extension is free-threaded, and you want to allow a task such as icon extraction to be managed by a scheduler. Only the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-run">Run</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-isrunning">IsRunning</a> methods must be implemented. If you do not want to implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-kill">Kill</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-resume">Resume</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-suspend">Suspend</a>, simply have them return E_NOTIMPL.
 * 
 * If you are using <b>IRunnableTask</b> to extract an image on a background thread, that is, if the object exposes <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a>, then <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-run">Run</a> is not necessary, as the system will use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iextractimage-extract">IExtractImage::Extract</a> to manage the task. The other methods (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-kill">Kill</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-resume">Resume</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-suspend">Suspend</a>) are optional in this case, but will be used by the system if they are implemented.
 * 
 * You do not call this interface directly. <b>IRunnableTask</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * <b>IRunnableTask</b> implements <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> as well as the five listed methods.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-irunnabletask
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IRunnableTask extends IUnknown {
    /**
     * The interface identifier for IRunnableTask
     * @type {Guid}
     */
    static IID := Guid("{85788d00-6807-11d0-b810-00c04fd706ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRunnableTask interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Run       : IntPtr
        Kill      : IntPtr
        Suspend   : IntPtr
        Resume    : IntPtr
        IsRunning : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRunnableTask.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests that a task begin.
     * @remarks
     * The return value of this method only tells you whether the execution of the task completed or is suspended. Any other errors that the implementer needs to communicate to the caller must be provided through other channels, such as a callback function.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following two codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Execution is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Execution is suspended.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-run
     */
    Run() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Requests that a task be stopped.
     * @remarks
     * Implementation of this method is optional. If you do not wish to support this functionality, create a token implementation that simply returns E_NOTIMPL.
     * @param {BOOL} bWait Type: <b>BOOL</b>
     * 
     * Not currently used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-kill
     */
    Kill(bWait) {
        result := ComCall(4, this, BOOL, bWait, "HRESULT")
        return result
    }

    /**
     * Requests that a task be suspended.
     * @remarks
     * Implementation of this method is optional. If you do not wish to support this functionality, create a token implementation that simply returns E_NOTIMPL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return S_OK if successful, or standard COM-defined error codes otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-suspend
     */
    Suspend() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Requests that a task resume.
     * @remarks
     * Implementation of this method is optional. If you do not wish to support this functionality, create a token implementation that simply returns E_NOTIMPL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or standard COM-defined error codes otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Requests information on the state of a task, such as thumbnail extraction.
     * @remarks
     * This method must be implemented.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * Returns one of the following values to indicate the current execution state.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IRTIR_TASK_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extraction has not yet started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IRTIR_TASK_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IRTIR_TASK_SUSPENDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task is suspended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IRTIR_TASK_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-irunnabletask-kill">IRunnableTask::Kill</a> has been called on the thread, but the thread has not yet completely shut down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IRTIR_TASK_FINISHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task is finished.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-isrunning
     */
    IsRunning() {
        result := ComCall(7, this, UInt32)
        return result
    }

    Query(iid) {
        if (IRunnableTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Run := CallbackCreate(GetMethod(implObj, "Run"), flags, 1)
        this.vtbl.Kill := CallbackCreate(GetMethod(implObj, "Kill"), flags, 2)
        this.vtbl.Suspend := CallbackCreate(GetMethod(implObj, "Suspend"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.IsRunning := CallbackCreate(GetMethod(implObj, "IsRunning"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Run)
        CallbackFree(this.vtbl.Kill)
        CallbackFree(this.vtbl.Suspend)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.IsRunning)
    }
}
