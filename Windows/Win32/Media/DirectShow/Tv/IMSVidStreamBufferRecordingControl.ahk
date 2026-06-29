#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\RecordingType.ahk" { RecordingType }

/**
 * The IMSVidStreamBufferRecordingControl interface enables an application to manage a stream buffer recording object through the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferRecordingControl)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambufferrecordingcontrol
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferRecordingControl extends IDispatch {
    /**
     * The interface identifier for IMSVidStreamBufferRecordingControl
     * @type {Guid}
     */
    static IID := Guid("{160621aa-bbbc-4326-a824-c395aebc6e74}")

    /**
     * The class identifier for MSVidStreamBufferRecordingControl
     * @type {Guid}
     */
    static CLSID := Guid("{caafdd83-cefc-4e3d-ba03-175f17a24f91}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferRecordingControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StartTime          : IntPtr
        put_StartTime          : IntPtr
        get_StopTime           : IntPtr
        put_StopTime           : IntPtr
        get_RecordingStopped   : IntPtr
        get_RecordingStarted   : IntPtr
        get_RecordingType      : IntPtr
        get_RecordingAttribute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferRecordingControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {RecordingType} 
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_starttime
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-put_starttime
     */
    put_StartTime(rtStart) {
        result := ComCall(8, this, "int", rtStart, "HRESULT")
        return result
    }

    /**
     * The get_StopTime method retrieves the stop time of the recording.
     * @returns {Integer} Pointer to a variable that receives the stop time, in hundredths of seconds.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_stoptime
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-put_stoptime
     */
    put_StopTime(rtStop) {
        result := ComCall(10, this, "int", rtStop, "HRESULT")
        return result
    }

    /**
     * The get_RecordingStopped method queries whether the recording has stopped.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingstopped
     */
    get_RecordingStopped() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &phResult := 0, "HRESULT")
        return phResult
    }

    /**
     * The get_RecordingStarted method queries whether the recording has started.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingstarted
     */
    get_RecordingStarted() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &phResult := 0, "HRESULT")
        return phResult
    }

    /**
     * The get_RecordingType method retrieves the type of recording, either content recording or reference recording.
     * @returns {RecordingType} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingtype
     */
    get_RecordingType() {
        result := ComCall(13, this, "int*", &dwType := 0, "HRESULT")
        return dwType
    }

    /**
     * The get_RecordingAttribute method retrieves the stream buffer Recording object that is controlled by this interface.
     * @remarks
     * The caller must release the returned <b>IUnknown</b> pointer.
     * @returns {IUnknown} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/recording-object">Recording</a> object's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingattribute
     */
    get_RecordingAttribute() {
        result := ComCall(14, this, "ptr*", &pRecordingAttribute := 0, "HRESULT")
        return IUnknown(pRecordingAttribute)
    }

    Query(iid) {
        if (IMSVidStreamBufferRecordingControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.put_StartTime := CallbackCreate(GetMethod(implObj, "put_StartTime"), flags, 2)
        this.vtbl.get_StopTime := CallbackCreate(GetMethod(implObj, "get_StopTime"), flags, 2)
        this.vtbl.put_StopTime := CallbackCreate(GetMethod(implObj, "put_StopTime"), flags, 2)
        this.vtbl.get_RecordingStopped := CallbackCreate(GetMethod(implObj, "get_RecordingStopped"), flags, 2)
        this.vtbl.get_RecordingStarted := CallbackCreate(GetMethod(implObj, "get_RecordingStarted"), flags, 2)
        this.vtbl.get_RecordingType := CallbackCreate(GetMethod(implObj, "get_RecordingType"), flags, 2)
        this.vtbl.get_RecordingAttribute := CallbackCreate(GetMethod(implObj, "get_RecordingAttribute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.put_StartTime)
        CallbackFree(this.vtbl.get_StopTime)
        CallbackFree(this.vtbl.put_StopTime)
        CallbackFree(this.vtbl.get_RecordingStopped)
        CallbackFree(this.vtbl.get_RecordingStarted)
        CallbackFree(this.vtbl.get_RecordingType)
        CallbackFree(this.vtbl.get_RecordingAttribute)
    }
}
