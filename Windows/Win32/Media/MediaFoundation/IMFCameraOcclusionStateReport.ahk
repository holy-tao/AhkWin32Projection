#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the camera occlusion state associated with a state change detected by an IMFCameraOcclusionStateMonitor.
 * @remarks
 * An instance of this class is passed into [IMFCameraOcclusionStateReportCallback::OnOcclusionStateReport](nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport.md) callback. Register the callback interface when you create the camera occlusion state monitor with a call to [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereport
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraOcclusionStateReport extends IUnknown {
    /**
     * The interface identifier for IMFCameraOcclusionStateReport
     * @type {Guid}
     */
    static IID := Guid("{1640b2cf-74da-4462-a43b-b76d3bdc1434}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraOcclusionStateReport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOcclusionState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraOcclusionStateReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IMFCameraOcclusionStateReport::GetOcclusionState function gets the camera occlusion state associated with the occlusion state report.
     * @returns {Integer} A **DWORD** output parameter containing a value from the [MFCameraOcclusionState](ne-mfidl-mfcameraocclusionstate.md) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereport-getocclusionstate
     */
    GetOcclusionState() {
        result := ComCall(3, this, "uint*", &occlusionState := 0, "HRESULT")
        return occlusionState
    }

    Query(iid) {
        if (IMFCameraOcclusionStateReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOcclusionState := CallbackCreate(GetMethod(implObj, "GetOcclusionState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOcclusionState)
    }
}
