#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidStreamBufferRecordingControl interface enables an application to manage a stream buffer recording object through the Video Control.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferRecordingControl)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambufferrecordingcontrol
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferRecordingControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferRecordingControl
     * @type {Guid}
     */
    static IID => Guid("{160621aa-bbbc-4326-a824-c395aebc6e74}")

    /**
     * The class identifier for MSVidStreamBufferRecordingControl
     * @type {Guid}
     */
    static CLSID => Guid("{caafdd83-cefc-4e3d-ba03-175f17a24f91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartTime", "put_StartTime", "get_StopTime", "put_StopTime", "get_RecordingStopped", "get_RecordingStarted", "get_RecordingType", "get_RecordingAttribute"]

    /**
     * @type {Integer} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {Integer} 
     */
    StopTime {
        get => this.get_StopTime()
        set => this.put_StopTime(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RecordingStopped {
        get => this.get_RecordingStopped()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RecordingStarted {
        get => this.get_RecordingStarted()
    }

    /**
     * @type {Integer} 
     */
    RecordingType {
        get => this.get_RecordingType()
    }

    /**
     * @type {IUnknown} 
     */
    RecordingAttribute {
        get => this.get_RecordingAttribute()
    }

    /**
     * The get_StartTime method retrieves the start time of the recording.
     * @returns {Integer} Pointer to a variable that receives the start time, in hundredths of seconds.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-get_starttime
     */
    get_StartTime() {
        result := ComCall(7, this, "int*", &rtStart := 0, "HRESULT")
        return rtStart
    }

    /**
     * The put_StartTime method sets the start time for the recording.
     * @param {Integer} rtStart Specifies the start time, in hundredths of seconds.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-put_starttime
     */
    put_StartTime(rtStart) {
        result := ComCall(8, this, "int", rtStart, "HRESULT")
        return result
    }

    /**
     * The get_StopTime method retrieves the stop time of the recording.
     * @returns {Integer} Pointer to a variable that receives the stop time, in hundredths of seconds.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-get_stoptime
     */
    get_StopTime() {
        result := ComCall(9, this, "int*", &rtStop := 0, "HRESULT")
        return rtStop
    }

    /**
     * The put_StopTime method sets the stop time for the recording.
     * @param {Integer} rtStop Specifies the stop time, in hundredths of seconds.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-put_stoptime
     */
    put_StopTime(rtStop) {
        result := ComCall(10, this, "int", rtStop, "HRESULT")
        return result
    }

    /**
     * The get_RecordingStopped method queries whether the recording has stopped.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingstopped
     */
    get_RecordingStopped() {
        result := ComCall(11, this, "short*", &phResult := 0, "HRESULT")
        return phResult
    }

    /**
     * The get_RecordingStarted method queries whether the recording has started.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingstarted
     */
    get_RecordingStarted() {
        result := ComCall(12, this, "short*", &phResult := 0, "HRESULT")
        return phResult
    }

    /**
     * The get_RecordingType method retrieves the type of recording, either content recording or reference recording.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingtype
     */
    get_RecordingType() {
        result := ComCall(13, this, "int*", &dwType := 0, "HRESULT")
        return dwType
    }

    /**
     * The get_RecordingAttribute method retrieves the stream buffer Recording object that is controlled by this interface.
     * @returns {IUnknown} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/recording-object">Recording</a> object's <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingattribute
     */
    get_RecordingAttribute() {
        result := ComCall(14, this, "ptr*", &pRecordingAttribute := 0, "HRESULT")
        return IUnknown(pRecordingAttribute)
    }
}
