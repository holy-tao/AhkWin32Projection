#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IReferenceTrackerTarget.ahk" { IReferenceTrackerTarget }
#Import ".\XAML_REFERENCETRACKER_DISCONNECT.ahk" { XAML_REFERENCETRACKER_DISCONNECT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines an interface that provides the global services used by the garbage collection (GC) system used by the XAML framework.
 * @remarks
 * An implementation of this interface must be registered with the XAML framework by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-setreferencetrackerhost">IReferenceTrackerManager::SetReferenceTrackerHost</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IReferenceTrackerHost extends IUnknown {
    /**
     * The interface identifier for IReferenceTrackerHost
     * @type {Guid}
     */
    static IID := Guid("{29a71c6a-3c42-4416-a39d-e2825a07a773}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReferenceTrackerHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DisconnectUnusedReferenceSources     : IntPtr
        ReleaseDisconnectedReferenceSources  : IntPtr
        NotifyEndOfReferenceTrackingOnThread : IntPtr
        GetTrackerTarget                     : IntPtr
        AddMemoryPressure                    : IntPtr
        RemoveMemoryPressure                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReferenceTrackerHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests that the host perform a garbage collection and remove all unnecessary reference sources.
     * @remarks
     * This method is expected to potentially cause the reference source to call <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-disconnectfromtrackersource">IReferenceTracker::DisconnectFromTrackerSource</a>, but it is not necessary to call <b>IUnknown::Release</b> immediately on the tracker source.  In the CLR, this call triggers a garbage collection, but not a <b>WaitForPendingFinalizers</b>.  When flags is one, the garbage collection is executed in the <b>GCCollectionMode.Optimized</b> state.
     * @param {XAML_REFERENCETRACKER_DISCONNECT} options May be 0 or 1; 1 indicates that an application suspend is in progress.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-disconnectunusedreferencesources
     */
    DisconnectUnusedReferenceSources(options) {
        result := ComCall(3, this, XAML_REFERENCETRACKER_DISCONNECT, options, "HRESULT")
        return result
    }

    /**
     * Requests that the host call IUnknown::Release on any reference tracker objects that have been disconnected by a reference source.
     * @remarks
     * It is not necessary for the <b>Release</b> calls to come in on the same thread.
     * In this call, the CLR calls <b>WaitForPendingFinalizers</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-releasedisconnectedreferencesources
     */
    ReleaseDisconnectedReferenceSources() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Notifies the host that reference tracking is no longer available on the calling thread; XAML calls this when the FrameworkView is uninitialized.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-notifyendofreferencetrackingonthread
     */
    NotifyEndOfReferenceTrackingOnThread() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Requests the host to provide a reference tracker target that references a reference tracker source. This tracker target then controls the lifetime of the tracker source.
     * @remarks
     * For example, after calling this method, calling <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> on the tracker target will prevent the tracker source from being collected.
     * @param {IUnknown} unknown The reference tracker source.
     * @returns {IReferenceTrackerTarget} The reference tracker target.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-gettrackertarget
     */
    GetTrackerTarget(unknown) {
        result := ComCall(6, this, "ptr", unknown, "ptr*", &newReference := 0, "HRESULT")
        return IReferenceTrackerTarget(newReference)
    }

    /**
     * Informs the host of increased memory allocations since the last notification. The CLR uses this to inform the algorithm that determines when to run a garbage collection.
     * @param {Integer} bytesAllocated The number of bytes currently allocated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-addmemorypressure
     */
    AddMemoryPressure(bytesAllocated) {
        result := ComCall(7, this, "uint", bytesAllocated, "HRESULT")
        return result
    }

    /**
     * Informs the host of reduced memory allocations since the last notification.
     * @param {Integer} bytesAllocated The number of bytes currently allocated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-removememorypressure
     */
    RemoveMemoryPressure(bytesAllocated) {
        result := ComCall(8, this, "uint", bytesAllocated, "HRESULT")
        return result
    }

    Query(iid) {
        if (IReferenceTrackerHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DisconnectUnusedReferenceSources := CallbackCreate(GetMethod(implObj, "DisconnectUnusedReferenceSources"), flags, 2)
        this.vtbl.ReleaseDisconnectedReferenceSources := CallbackCreate(GetMethod(implObj, "ReleaseDisconnectedReferenceSources"), flags, 1)
        this.vtbl.NotifyEndOfReferenceTrackingOnThread := CallbackCreate(GetMethod(implObj, "NotifyEndOfReferenceTrackingOnThread"), flags, 1)
        this.vtbl.GetTrackerTarget := CallbackCreate(GetMethod(implObj, "GetTrackerTarget"), flags, 3)
        this.vtbl.AddMemoryPressure := CallbackCreate(GetMethod(implObj, "AddMemoryPressure"), flags, 2)
        this.vtbl.RemoveMemoryPressure := CallbackCreate(GetMethod(implObj, "RemoveMemoryPressure"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DisconnectUnusedReferenceSources)
        CallbackFree(this.vtbl.ReleaseDisconnectedReferenceSources)
        CallbackFree(this.vtbl.NotifyEndOfReferenceTrackingOnThread)
        CallbackFree(this.vtbl.GetTrackerTarget)
        CallbackFree(this.vtbl.AddMemoryPressure)
        CallbackFree(this.vtbl.RemoveMemoryPressure)
    }
}
