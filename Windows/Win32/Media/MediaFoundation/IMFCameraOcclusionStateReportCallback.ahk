#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCameraOcclusionStateReport.ahk" { IMFCameraOcclusionStateReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by applications to receive camera occlusion state change notifications.
 * @remarks
 * Register the callback interface when you create the camera occlusion state monitor with a call to [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereportcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraOcclusionStateReportCallback extends IUnknown {
    /**
     * The interface identifier for IMFCameraOcclusionStateReportCallback
     * @type {Guid}
     */
    static IID := Guid("{6e5841c7-3889-4019-9035-783fb19b5948}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraOcclusionStateReportCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnOcclusionStateReport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraOcclusionStateReportCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the system when the camera occlusion state changes.
     * @remarks
     * To avoid any possible circular locking situation do not call any IMFCameraOcclusionStateMonitor object methods from this callback function.
     * 
     * Register the callback interface by calling [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
     * @param {IMFCameraOcclusionStateReport} occlusionStateReport An [IMFCameraOcclusionStateReport](nn-mfidl-imfcameraocclusionstatereport.md) that can be used to obtain the new camera occlusion state.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport
     */
    OnOcclusionStateReport(occlusionStateReport) {
        result := ComCall(3, this, "ptr", occlusionStateReport, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCameraOcclusionStateReportCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnOcclusionStateReport := CallbackCreate(GetMethod(implObj, "OnOcclusionStateReport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnOcclusionStateReport)
    }
}
