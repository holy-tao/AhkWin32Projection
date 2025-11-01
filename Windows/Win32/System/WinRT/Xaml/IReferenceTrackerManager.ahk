#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingstarted
     */
    ReferenceTrackingStarted() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} findFailed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-findtrackertargetscompleted
     */
    FindTrackerTargetsCompleted(findFailed) {
        result := ComCall(4, this, "char", findFailed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-referencetrackingcompleted
     */
    ReferenceTrackingCompleted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IReferenceTrackerHost} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackermanager-setreferencetrackerhost
     */
    SetReferenceTrackerHost(value) {
        result := ComCall(6, this, "ptr", value, "HRESULT")
        return result
    }
}
