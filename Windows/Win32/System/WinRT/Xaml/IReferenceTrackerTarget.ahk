#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Defines an interface implemented by a garbage collector object referenced from XAML.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTrackerTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceTrackerTarget
     * @type {Guid}
     */
    static IID => Guid("{64bd43f8-bfee-4ec4-b7eb-2935158dae21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRefFromReferenceTracker", "ReleaseFromReferenceTracker", "Peg", "Unpeg"]

    /**
     * Indicates that the reference tracker is returning the target XAML object(s) from previous calls to FindTrackerTargets. Note that the reference is held by the reference tracker object in lieu of IUnknown::AddRef.
     * @remarks
     * When the XAML framework keeps this reference in lieu of a COM reference, it indicates that the framework must call your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> to ensure that the target does not get collected.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-addreffromreferencetracker
     */
    AddRefFromReferenceTracker() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Releases the XAML object reference marked in a previous call to AddRefFromReferenceTracker.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-releasefromreferencetracker
     */
    ReleaseFromReferenceTracker() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Marks that the reference tracker target is in use by the XAML framework, and should not be collected.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg
     */
    Peg() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Marks that the reference tracker target is no longer in use by the XAML framework, and can be collected.
     * @remarks
     * <div class="alert"><b>Note</b>  You do not need to have parity between calls to <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> and <b>Unpeg</b>. A single call to <b>Unpeg</b> will remove the marker set in all previous calls to <b>Peg</b>.</div>
     * <div> </div>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-unpeg
     */
    Unpeg() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
