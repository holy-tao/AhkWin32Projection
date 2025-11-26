#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSensorActivityReport.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to IMFSensorActivityReport objects that describe the current activity of a sensor.
 * @remarks
 * 
 * Register to receive sensor activities reports by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreportcallback">IMFSensorActivitiesReportCallback</a> interface and passing the implementation into <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesensoractivitymonitor">MFCreateSensorActivityMonitor</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensoractivitiesreport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorActivitiesReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorActivitiesReport
     * @type {Guid}
     */
    static IID => Guid("{683f7a5e-4a19-43cd-b1a9-dbf4ab3f7777}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetActivityReport", "GetActivityReportByDeviceName"]

    /**
     * Gets the count of IMFSensorActivityReport objects that are available to be retrieved.
     * @returns {Integer} The count of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> objects that are available to be retrieved.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivitiesreport-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Retrieves an IMFSensorActivityReport based on the specified index.
     * @param {Integer} Index The index of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> to retrieve. This value must be less than the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensoractivitiesreport-getcount">GetCount</a>.
     * @returns {IMFSensorActivityReport} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> associated with the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivitiesreport-getactivityreport
     */
    GetActivityReport(Index) {
        result := ComCall(4, this, "uint", Index, "ptr*", &sensorActivityReport := 0, "HRESULT")
        return IMFSensorActivityReport(sensorActivityReport)
    }

    /**
     * Retrieves an IMFSensorActivityReport based on the specified device name.
     * @param {PWSTR} SymbolicName The symbolic name of the sensor for which the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> is retrieved.
     * @returns {IMFSensorActivityReport} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivityreport">IMFSensorActivityReport</a> associated with the sensor with the specified symbolic name.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivitiesreport-getactivityreportbydevicename
     */
    GetActivityReportByDeviceName(SymbolicName) {
        SymbolicName := SymbolicName is String ? StrPtr(SymbolicName) : SymbolicName

        result := ComCall(5, this, "ptr", SymbolicName, "ptr*", &sensorActivityReport := 0, "HRESULT")
        return IMFSensorActivityReport(sensorActivityReport)
    }
}
