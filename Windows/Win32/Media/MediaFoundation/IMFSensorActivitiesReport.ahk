#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMFSensorActivityReport.ahk" { IMFSensorActivityReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to IMFSensorActivityReport objects that describe the current activity of a sensor.
 * @remarks
 * Register to receive sensor activities reports by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreportcallback">IMFSensorActivitiesReportCallback</a> interface and passing the implementation into <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesensoractivitymonitor">MFCreateSensorActivityMonitor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensoractivitiesreport
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorActivitiesReport extends IUnknown {
    /**
     * The interface identifier for IMFSensorActivitiesReport
     * @type {Guid}
     */
    static IID := Guid("{683f7a5e-4a19-43cd-b1a9-dbf4ab3f7777}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorActivitiesReport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount                      : IntPtr
        GetActivityReport             : IntPtr
        GetActivityReportByDeviceName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorActivitiesReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of IMFSensorActivityReport objects that are available to be retrieved.
     * @returns {Integer} The count of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> objects that are available to be retrieved.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivitiesreport-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Retrieves an IMFSensorActivityReport based on the specified index.
     * @param {Integer} Index The index of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> to retrieve. This value must be less than the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensoractivitiesreport-getcount">GetCount</a>.
     * @returns {IMFSensorActivityReport} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> associated with the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivitiesreport-getactivityreport
     */
    GetActivityReport(Index) {
        result := ComCall(4, this, "uint", Index, "ptr*", &sensorActivityReport := 0, "HRESULT")
        return IMFSensorActivityReport(sensorActivityReport)
    }

    /**
     * Retrieves an IMFSensorActivityReport based on the specified device name.
     * @param {PWSTR} SymbolicName The symbolic name of the sensor for which the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> is retrieved.
     * @returns {IMFSensorActivityReport} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> associated with the sensor with the specified symbolic name.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensoractivitiesreport-getactivityreportbydevicename
     */
    GetActivityReportByDeviceName(SymbolicName) {
        SymbolicName := SymbolicName is String ? StrPtr(SymbolicName) : SymbolicName

        result := ComCall(5, this, "ptr", SymbolicName, "ptr*", &sensorActivityReport := 0, "HRESULT")
        return IMFSensorActivityReport(sensorActivityReport)
    }

    Query(iid) {
        if (IMFSensorActivitiesReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetActivityReport := CallbackCreate(GetMethod(implObj, "GetActivityReport"), flags, 3)
        this.vtbl.GetActivityReportByDeviceName := CallbackCreate(GetMethod(implObj, "GetActivityReportByDeviceName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetActivityReport)
        CallbackFree(this.vtbl.GetActivityReportByDeviceName)
    }
}
