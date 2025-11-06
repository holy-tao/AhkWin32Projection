#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IReferenceTrackerManager.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-connectfromtrackersource
     */
    ConnectFromTrackerSource() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-disconnectfromtrackersource
     */
    DisconnectFromTrackerSource() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFindReferenceTargetsCallback} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-findtrackertargets
     */
    FindTrackerTargets(callback) {
        result := ComCall(5, this, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IReferenceTrackerManager} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-getreferencetrackermanager
     */
    GetReferenceTrackerManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "HRESULT")
        return IReferenceTrackerManager(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-addreffromtrackersource
     */
    AddRefFromTrackerSource() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-releasefromtrackersource
     */
    ReleaseFromTrackerSource() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetracker-pegfromtrackersource
     */
    PegFromTrackerSource() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
