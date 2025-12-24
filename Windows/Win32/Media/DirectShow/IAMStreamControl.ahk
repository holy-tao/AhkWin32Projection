#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AM_STREAM_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMStreamControl interface controls individual streams on a filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamstreamcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMStreamControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMStreamControl
     * @type {Guid}
     */
    static IID => Guid("{36b73881-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAt", "StopAt", "GetInfo"]

    /**
     * The StartAt method informs the pin when to start delivering data.
     * @param {Pointer<Integer>} ptStart Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> value that specifies when the pin should start delivering data. If the value is <b>MAXLONGLONG</b> (0x7FFFFFFFFFFFFFFF), the method cancels the previous start request. If <i>psStart</i> is <b>NULL</b>, the pin starts immediately when the graph runs.
     * 
     * For preview pins, only the values <b>NULL</b> and <b>MAXLONGLONG</b> are valid, because preview pins do not time stamp the samples they deliver.
     * @param {Integer} dwCookie Specifies a value to send along with the start notification. See Remarks.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the failure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamcontrol-startat
     */
    StartAt(ptStart, dwCookie) {
        ptStartMarshal := ptStart is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, ptStartMarshal, ptStart, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * The StopAt method informs the pin when to stop delivering data.
     * @param {Pointer<Integer>} ptStop Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> value that specifies when the pin should stop delivering data. If the value is <b>MAXLONGLONG</b> (0x7FFFFFFFFFFFFFFF), the method cancels any previous stop request. If <i>psStop</i> is <b>NULL</b>, the pin stops immediately.
     * 
     * For preview pins, only the values <b>NULL</b> and <b>MAXLONGLONG</b> are valid, because preview pins do not time stamp the samples they deliver.
     * @param {BOOL} bSendExtra Specifies a Boolean value that indicates whether to send an extra sample after the scheduled stop time. If <b>TRUE</b>, the pin sends one extra sample.
     * @param {Integer} dwCookie Specifies a value to send along with the start notification. See Remarks.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the failure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamcontrol-stopat
     */
    StopAt(ptStop, bSendExtra, dwCookie) {
        ptStopMarshal := ptStop is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, ptStopMarshal, ptStop, "int", bSendExtra, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * The GetInfo method retrieves information about the current stream-control settings, including the start and stop times.
     * @returns {AM_STREAM_INFO} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_stream_info">AM_STREAM_INFO</a> structure, allocated by the caller, that receives the current stream-control settings.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamcontrol-getinfo
     */
    GetInfo() {
        pInfo := AM_STREAM_INFO()
        result := ComCall(5, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }
}
