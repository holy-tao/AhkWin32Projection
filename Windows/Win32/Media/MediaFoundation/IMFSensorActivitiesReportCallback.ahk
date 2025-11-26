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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivitiesReport"]

    /**
     * Raised by the media pipeline when a new IMFSensorActivitiesReport is available.
     * @param {IMFSensorActivitiesReport} sensorActivitiesReport Receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreport">IMFSensorActivitiesReport</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensoractivitiesreportcallback-onactivitiesreport
     */
    OnActivitiesReport(sensorActivitiesReport) {
        result := ComCall(3, this, "ptr", sensorActivitiesReport, "HRESULT")
        return result
    }
}
