#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IReferenceTrackerManager.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Defines the interface implemented by the XAML framework for managing XAML object references.
 * @remarks
 * This interface is implemented by most XAML framework objects. It is not defined as <b>agile</b>, nor does it marshal across apartments. Use it only from within the apartment of the XAML object that implements it.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetracker
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTracker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceTracker
     * @type {Guid}
     */
    static IID => Guid("{11d3b13a-180e-4789-a8be-7712882893e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectFromTrackerSource", "DisconnectFromTrackerSource", "FindTrackerTargets", "GetReferenceTrackerManager", "AddRefFromTrackerSource", "ReleaseFromTrackerSource", "PegFromTrackerSource"]

    /**
     * Indicates that a reference tracker source has created its first COM reference on a reference tracker object.
     * @remarks
     * This method is called, for example, when a runtime-callable wrapper is created to a XAML object, such as when a XAML object is returned as an <b>out</b> parameter argument.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-connectfromtrackersource
     */
    ConnectFromTrackerSource() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Indicates that a reference tracker source has stopped tracking a reference tracker.
     * @remarks
     * Calling this method does not indicate that the tracker source has released all COM references on the reference tracker.  
     * This method is called by the CLR during garbage collection when a runtime-callable wrapper is collected, but the XAML object does not get released until it is processed by the finalizer thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-disconnectfromtrackersource
     */
    DisconnectFromTrackerSource() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Finds out what reference tracker targets are reachable from a reference tracker source; must be called by a garbage collector between calls to ReferenceTrackingStarted and FindTrackerTargetsCompleted.
     * @param {IFindReferenceTargetsCallback} callback 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-findtrackertargets
     */
    FindTrackerTargets(callback) {
        result := ComCall(5, this, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * Gets an IReferenceTrackerManager interface from a XAML object.
     * @returns {IReferenceTrackerManager} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-getreferencetrackermanager
     */
    GetReferenceTrackerManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "HRESULT")
        return IReferenceTrackerManager(value)
    }

    /**
     * Indicates each time that a tracker source calls IUnknown::AddRef on the reference tracker; called after the AddRef call.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-addreffromtrackersource
     */
    AddRefFromTrackerSource() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Indicates each time that a tracker source calls IUnknown::Release on the reference tracker; must be called before the Release call.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-releasefromtrackersource
     */
    ReleaseFromTrackerSource() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Indicates that a tracker source is unable to protected a reference tracker object.
     * @remarks
     * This method is called by the CLR when it is returning a XAML object as an <b>out</b> parameter argument.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-pegfromtrackersource
     */
    PegFromTrackerSource() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
