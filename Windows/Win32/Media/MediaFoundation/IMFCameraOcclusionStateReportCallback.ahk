#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereportcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateReportCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraOcclusionStateReportCallback
     * @type {Guid}
     */
    static IID => Guid("{6e5841c7-3889-4019-9035-783fb19b5948}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnOcclusionStateReport"]

    /**
     * 
     * @param {IMFCameraOcclusionStateReport} occlusionStateReport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport
     */
    OnOcclusionStateReport(occlusionStateReport) {
        result := ComCall(3, this, "ptr", occlusionStateReport, "HRESULT")
        return result
    }
}
