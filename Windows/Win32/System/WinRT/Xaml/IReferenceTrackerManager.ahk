#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Defines the interface for a XAML object reference manager. Implement this interface to manage instances of IReferenceTracker on XAML objects.
 * @remarks
 * Obtain a reference to an implementation of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-getreferencetrackermanager">IReferenceTracker::GetReferenceTrackerManager</a> on a XAML object that implements <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetracker">IReferenceTracker</a>.
 * 
 * There is only one instance of <b>IReferenceTrackerManager</b> for a process, and it may be called from any thread.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTrackerManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceTrackerManager
     * @type {Guid}
     */
    static IID => Guid("{3cf184b4-7ccb-4dda-8455-7e6ce99a3298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReferenceTrackingStarted", "FindTrackerTargetsCompleted", "ReferenceTrackingCompleted", "SetReferenceTrackerHost"]

    /**
     * Indicates that a garbage collector is performing a collection; when the collection is finished, the garbage collector calls FindTrackerTargetsCompleted.
     * @remarks
     * When this method is called, XAML blocks all threads where it is attempting to update tracked references.  Between calls to <b>ReferenceTrackingStarted</b> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingcompleted">ReferenceTrackingCompleted</a>, XAML does not make any calls to reference tracker target objects other than <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-unpeg">Unpeg</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingstarted
     */
    ReferenceTrackingStarted() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates that a garbage collection system has finished making all the calls it needs to IReferenceTracker::FindTrackerTargets; by this time, XAML has pegged all reference tracker targets that it wants to protect.
     * @param {Integer} findFailed 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-findtrackertargetscompleted
     */
    FindTrackerTargetsCompleted(findFailed) {
        result := ComCall(4, this, "char", findFailed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates that a garbage collection system has finished with its collection process; at this point, XAML unblocks threads attempting to update tracked references.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingcompleted
     */
    ReferenceTrackingCompleted() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers an IReferenceTrackerHost interface with XAML.
     * @param {IReferenceTrackerHost} value 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-setreferencetrackerhost
     */
    SetReferenceTrackerHost(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
