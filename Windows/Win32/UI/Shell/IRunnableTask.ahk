#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A free-threaded interface that can be exposed by an object to allow operations to be performed on a background thread.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-irunnabletask
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IRunnableTask extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRunnableTask
     * @type {Guid}
     */
    static IID => Guid("{85788d00-6807-11d0-b810-00c04fd706ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Run", "Kill", "Suspend", "Resume", "IsRunning"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-run
     */
    Run() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bWait 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-kill
     */
    Kill(bWait) {
        result := ComCall(4, this, "int", bWait, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-suspend
     */
    Suspend() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irunnabletask-isrunning
     */
    IsRunning() {
        result := ComCall(7, this, "uint")
        return result
    }
}
