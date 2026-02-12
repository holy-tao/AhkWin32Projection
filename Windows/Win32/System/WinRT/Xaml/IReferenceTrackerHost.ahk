#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IReferenceTrackerTarget.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Defines an interface that provides the global services used by the garbage collection (GC) system used by the XAML framework.
 * @remarks
 * An implementation of this interface must be registered with the XAML framework by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-setreferencetrackerhost">IReferenceTrackerManager::SetReferenceTrackerHost</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTrackerHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceTrackerHost
     * @type {Guid}
     */
    static IID => Guid("{29a71c6a-3c42-4416-a39d-e2825a07a773}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisconnectUnusedReferenceSources", "ReleaseDisconnectedReferenceSources", "NotifyEndOfReferenceTrackingOnThread", "GetTrackerTarget", "AddMemoryPressure", "RemoveMemoryPressure"]

    /**
     * Requests that the host perform a garbage collection and remove all unnecessary reference sources.
     * @remarks
     * This method is expected to potentially cause the reference source to call <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-disconnectfromtrackersource">IReferenceTracker::DisconnectFromTrackerSource</a>, but it is not necessary to call <b>IUnknown::Release</b> immediately on the tracker source.  In the CLR, this call triggers a garbage collection, but not a <b>WaitForPendingFinalizers</b>.  When flags is one, the garbage collection is executed in the <b>GCCollectionMode.Optimized</b> state.
     * @param {Integer} options May be 0 or 1; 1 indicates that an application suspend is in progress.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-disconnectunusedreferencesources
     */
    DisconnectUnusedReferenceSources(options) {
        result := ComCall(3, this, "int", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests that the host call IUnknown::Release on any reference tracker objects that have been disconnected by a reference source.
     * @remarks
     * It is not necessary for the <b>Release</b> calls to come in on the same thread.
     * In this call, the CLR calls <b>WaitForPendingFinalizers</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-releasedisconnectedreferencesources
     */
    ReleaseDisconnectedReferenceSources() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the host that reference tracking is no longer available on the calling thread; XAML calls this when the FrameworkView is uninitialized.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-notifyendofreferencetrackingonthread
     */
    NotifyEndOfReferenceTrackingOnThread() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests the host to provide a reference tracker target that references a reference tracker source. This tracker target then controls the lifetime of the tracker source.
     * @remarks
     * For example, after calling this method, calling <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> on the tracker target will prevent the tracker source from being collected.
     * @param {IUnknown} unknown The reference tracker source.
     * @returns {IReferenceTrackerTarget} The reference tracker target.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-gettrackertarget
     */
    GetTrackerTarget(unknown) {
        result := ComCall(6, this, "ptr", unknown, "ptr*", &newReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReferenceTrackerTarget(newReference)
    }

    /**
     * Informs the host of increased memory allocations since the last notification. The CLR uses this to inform the algorithm that determines when to run a garbage collection.
     * @param {Integer} bytesAllocated The number of bytes currently allocated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-addmemorypressure
     */
    AddMemoryPressure(bytesAllocated) {
        result := ComCall(7, this, "uint", bytesAllocated, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Informs the host of reduced memory allocations since the last notification.
     * @param {Integer} bytesAllocated The number of bytes currently allocated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-removememorypressure
     */
    RemoveMemoryPressure(bytesAllocated) {
        result := ComCall(8, this, "uint", bytesAllocated, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
