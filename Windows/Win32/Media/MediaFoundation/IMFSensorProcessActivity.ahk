#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the activity of a process associated with a sensor.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorprocessactivity
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorProcessActivity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorProcessActivity
     * @type {Guid}
     */
    static IID => Guid("{39dc7f4a-b141-4719-813c-a7f46162a2b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProcessId", "GetStreamingState", "GetStreamingMode", "GetReportTime"]

    /**
     * Gets the ID of the process with which the activity is associated.
     * @returns {Integer} Receives the process ID.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprocessactivity-getprocessid
     */
    GetProcessId() {
        result := ComCall(3, this, "uint*", &pPID := 0, "HRESULT")
        return pPID
    }

    /**
     * Gets a value indicating whether the sensor is currently streaming.
     * @returns {BOOL} Receives a value indicating whether the sensor is currently streaming.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprocessactivity-getstreamingstate
     */
    GetStreamingState() {
        result := ComCall(4, this, "int*", &pfStreaming := 0, "HRESULT")
        return pfStreaming
    }

    /**
     * Gets the streaming mode of the sensor process.
     * @returns {Integer} Receives the process ID.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprocessactivity-getstreamingmode
     */
    GetStreamingMode() {
        result := ComCall(5, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * Gets the time associated with the sensor activity report.
     * @returns {FILETIME} Receives the time associated with the sensor activity report.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprocessactivity-getreporttime
     */
    GetReportTime() {
        pft := FILETIME()
        result := ComCall(6, this, "ptr", pft, "HRESULT")
        return pft
    }
}
