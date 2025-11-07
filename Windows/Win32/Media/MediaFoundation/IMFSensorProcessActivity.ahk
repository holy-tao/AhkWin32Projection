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
     * Retrieves the process identifier of the specified process.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessid
     */
    GetProcessId() {
        result := ComCall(3, this, "uint*", &pPID := 0, "HRESULT")
        return pPID
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getstreamingstate
     */
    GetStreamingState() {
        result := ComCall(4, this, "int*", &pfStreaming := 0, "HRESULT")
        return pfStreaming
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getstreamingmode
     */
    GetStreamingMode() {
        result := ComCall(5, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprocessactivity-getreporttime
     */
    GetReportTime() {
        pft := FILETIME()
        result := ComCall(6, this, "ptr", pft, "HRESULT")
        return pft
    }
}
