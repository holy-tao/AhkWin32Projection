#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFSensorActivitiesReport.ahk" { IMFSensorActivitiesReport }

/**
 * Interface implemented by the client to receive callbacks when sensor activity reports are available.
 * @remarks
 * Register the callback by passing an implementation of this interface into <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesensoractivitymonitor">MFCreateSensorActivityMonitor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensoractivitiesreportcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorActivitiesReportCallback extends IUnknown {
    /**
     * The interface identifier for IMFSensorActivitiesReportCallback
     * @type {Guid}
     */
    static IID := Guid("{de5072ee-dbe3-46dc-8a87-b6f631194751}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorActivitiesReportCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnActivitiesReport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorActivitiesReportCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Raised by the media pipeline when a new IMFSensorActivitiesReport is available.
     * @param {IMFSensorActivitiesReport} sensorActivitiesReport Receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreport">IMFSensorActivitiesReport</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivitiesreportcallback-onactivitiesreport
     */
    OnActivitiesReport(sensorActivitiesReport) {
        result := ComCall(3, this, "ptr", sensorActivitiesReport, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSensorActivitiesReportCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnActivitiesReport := CallbackCreate(GetMethod(implObj, "OnActivitiesReport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnActivitiesReport)
    }
}
