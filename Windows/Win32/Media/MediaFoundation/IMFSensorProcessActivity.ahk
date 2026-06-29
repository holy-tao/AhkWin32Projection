#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFSensorDeviceMode.ahk" { MFSensorDeviceMode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the activity of a process associated with a sensor.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensorprocessactivity
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorProcessActivity extends IUnknown {
    /**
     * The interface identifier for IMFSensorProcessActivity
     * @type {Guid}
     */
    static IID := Guid("{39dc7f4a-b141-4719-813c-a7f46162a2b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorProcessActivity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProcessId      : IntPtr
        GetStreamingState : IntPtr
        GetStreamingMode  : IntPtr
        GetReportTime     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorProcessActivity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID of the process with which the activity is associated.
     * @returns {Integer} Receives the process ID.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getprocessid
     */
    GetProcessId() {
        result := ComCall(3, this, "uint*", &pPID := 0, "HRESULT")
        return pPID
    }

    /**
     * Gets a value indicating whether the sensor is currently streaming.
     * @returns {BOOL} Receives a value indicating whether the sensor is currently streaming.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getstreamingstate
     */
    GetStreamingState() {
        result := ComCall(4, this, BOOL.Ptr, &pfStreaming := 0, "HRESULT")
        return pfStreaming
    }

    /**
     * Gets the streaming mode of the sensor process.
     * @returns {MFSensorDeviceMode} Receives a value from the MFSensorDeviceMode enumeration specifying the streaming mode of the sensor process.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getstreamingmode
     */
    GetStreamingMode() {
        result := ComCall(5, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * Gets the time associated with the sensor activity report.
     * @returns {FILETIME} Receives the time associated with the sensor activity report.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getreporttime
     */
    GetReportTime() {
        pft := FILETIME()
        result := ComCall(6, this, FILETIME.Ptr, pft, "HRESULT")
        return pft
    }

    Query(iid) {
        if (IMFSensorProcessActivity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProcessId := CallbackCreate(GetMethod(implObj, "GetProcessId"), flags, 2)
        this.vtbl.GetStreamingState := CallbackCreate(GetMethod(implObj, "GetStreamingState"), flags, 2)
        this.vtbl.GetStreamingMode := CallbackCreate(GetMethod(implObj, "GetStreamingMode"), flags, 2)
        this.vtbl.GetReportTime := CallbackCreate(GetMethod(implObj, "GetReportTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProcessId)
        CallbackFree(this.vtbl.GetStreamingState)
        CallbackFree(this.vtbl.GetStreamingMode)
        CallbackFree(this.vtbl.GetReportTime)
    }
}
