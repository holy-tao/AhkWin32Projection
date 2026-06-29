#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IReferenceTrackerHost.ahk" { IReferenceTrackerHost }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the interface for a XAML object reference manager. Implement this interface to manage instances of IReferenceTracker on XAML objects.
 * @remarks
 * Obtain a reference to an implementation of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-getreferencetrackermanager">IReferenceTracker::GetReferenceTrackerManager</a> on a XAML object that implements <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetracker">IReferenceTracker</a>.
 * 
 * There is only one instance of <b>IReferenceTrackerManager</b> for a process, and it may be called from any thread.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IReferenceTrackerManager extends IUnknown {
    /**
     * The interface identifier for IReferenceTrackerManager
     * @type {Guid}
     */
    static IID := Guid("{3cf184b4-7ccb-4dda-8455-7e6ce99a3298}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReferenceTrackerManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReferenceTrackingStarted    : IntPtr
        FindTrackerTargetsCompleted : IntPtr
        ReferenceTrackingCompleted  : IntPtr
        SetReferenceTrackerHost     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReferenceTrackerManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that a garbage collector is performing a collection; when the collection is finished, the garbage collector calls FindTrackerTargetsCompleted.
     * @remarks
     * When this method is called, XAML blocks all threads where it is attempting to update tracked references.  Between calls to <b>ReferenceTrackingStarted</b> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingcompleted">ReferenceTrackingCompleted</a>, XAML does not make any calls to reference tracker target objects other than <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-unpeg">Unpeg</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingstarted
     */
    ReferenceTrackingStarted() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Indicates that a garbage collection system has finished making all the calls it needs to IReferenceTracker::FindTrackerTargets; by this time, XAML has pegged all reference tracker targets that it wants to protect.
     * @param {Integer} findFailed 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-findtrackertargetscompleted
     */
    FindTrackerTargetsCompleted(findFailed) {
        result := ComCall(4, this, "char", findFailed, "HRESULT")
        return result
    }

    /**
     * Indicates that a garbage collection system has finished with its collection process; at this point, XAML unblocks threads attempting to update tracked references.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingcompleted
     */
    ReferenceTrackingCompleted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Registers an IReferenceTrackerHost interface with XAML.
     * @param {IReferenceTrackerHost} value 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-setreferencetrackerhost
     */
    SetReferenceTrackerHost(value) {
        result := ComCall(6, this, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IReferenceTrackerManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReferenceTrackingStarted := CallbackCreate(GetMethod(implObj, "ReferenceTrackingStarted"), flags, 1)
        this.vtbl.FindTrackerTargetsCompleted := CallbackCreate(GetMethod(implObj, "FindTrackerTargetsCompleted"), flags, 2)
        this.vtbl.ReferenceTrackingCompleted := CallbackCreate(GetMethod(implObj, "ReferenceTrackingCompleted"), flags, 1)
        this.vtbl.SetReferenceTrackerHost := CallbackCreate(GetMethod(implObj, "SetReferenceTrackerHost"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReferenceTrackingStarted)
        CallbackFree(this.vtbl.FindTrackerTargetsCompleted)
        CallbackFree(this.vtbl.ReferenceTrackingCompleted)
        CallbackFree(this.vtbl.SetReferenceTrackerHost)
    }
}
