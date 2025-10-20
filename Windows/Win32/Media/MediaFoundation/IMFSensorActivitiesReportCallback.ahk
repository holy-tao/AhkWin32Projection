#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Interface implemented by the client to receive callbacks when sensor activity reports are available.
 * @remarks
 * 
  * Register the callback by passing an implementation of this interface into <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesensoractivitymonitor">MFCreateSensorActivityMonitor</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensoractivitiesreportcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorActivitiesReportCallback extends IUnknown{
    /**
     * The interface identifier for IMFSensorActivitiesReportCallback
     * @type {Guid}
     */
    static IID => Guid("{de5072ee-dbe3-46dc-8a87-b6f631194751}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFSensorActivitiesReport>} sensorActivitiesReport 
     * @returns {HRESULT} 
     */
    OnActivitiesReport(sensorActivitiesReport) {
        result := ComCall(3, this, "ptr", sensorActivitiesReport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
