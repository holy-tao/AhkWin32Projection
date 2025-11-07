#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IReferenceTrackerTarget.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost
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
     * 
     * @param {Integer} options 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-disconnectunusedreferencesources
     */
    DisconnectUnusedReferenceSources(options) {
        result := ComCall(3, this, "int", options, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-releasedisconnectedreferencesources
     */
    ReleaseDisconnectedReferenceSources() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-notifyendofreferencetrackingonthread
     */
    NotifyEndOfReferenceTrackingOnThread() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} unknown 
     * @returns {IReferenceTrackerTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-gettrackertarget
     */
    GetTrackerTarget(unknown) {
        result := ComCall(6, this, "ptr", unknown, "ptr*", &newReference := 0, "HRESULT")
        return IReferenceTrackerTarget(newReference)
    }

    /**
     * 
     * @param {Integer} bytesAllocated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-addmemorypressure
     */
    AddMemoryPressure(bytesAllocated) {
        result := ComCall(7, this, "uint", bytesAllocated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bytesAllocated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackerhost-removememorypressure
     */
    RemoveMemoryPressure(bytesAllocated) {
        result := ComCall(8, this, "uint", bytesAllocated, "HRESULT")
        return result
    }
}
