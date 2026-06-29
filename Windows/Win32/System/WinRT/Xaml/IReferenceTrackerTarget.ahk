#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines an interface implemented by a garbage collector object referenced from XAML.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IReferenceTrackerTarget extends IUnknown {
    /**
     * The interface identifier for IReferenceTrackerTarget
     * @type {Guid}
     */
    static IID := Guid("{64bd43f8-bfee-4ec4-b7eb-2935158dae21}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReferenceTrackerTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRefFromReferenceTracker  : IntPtr
        ReleaseFromReferenceTracker : IntPtr
        Peg                         : IntPtr
        Unpeg                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReferenceTrackerTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that the reference tracker is returning the target XAML object(s) from previous calls to FindTrackerTargets. Note that the reference is held by the reference tracker object in lieu of IUnknown::AddRef.
     * @remarks
     * When the XAML framework keeps this reference in lieu of a COM reference, it indicates that the framework must call your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-peg">Peg</a> to ensure that the target does not get collected.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-addreffromreferencetracker
     */
    AddRefFromReferenceTracker() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Releases the XAML object reference marked in a previous call to AddRefFromReferenceTracker.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nf-windows-ui-xaml-hosting-referencetracker-ireferencetrackertarget-releasefromreferencetracker
     */
    ReleaseFromReferenceTracker() {
        result := ComCall(4, this, UInt32)
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

    Query(iid) {
        if (IReferenceTrackerTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRefFromReferenceTracker := CallbackCreate(GetMethod(implObj, "AddRefFromReferenceTracker"), flags, 1)
        this.vtbl.ReleaseFromReferenceTracker := CallbackCreate(GetMethod(implObj, "ReleaseFromReferenceTracker"), flags, 1)
        this.vtbl.Peg := CallbackCreate(GetMethod(implObj, "Peg"), flags, 1)
        this.vtbl.Unpeg := CallbackCreate(GetMethod(implObj, "Unpeg"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRefFromReferenceTracker)
        CallbackFree(this.vtbl.ReleaseFromReferenceTracker)
        CallbackFree(this.vtbl.Peg)
        CallbackFree(this.vtbl.Unpeg)
    }
}
