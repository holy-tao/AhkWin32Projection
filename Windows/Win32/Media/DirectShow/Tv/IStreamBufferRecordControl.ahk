#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IStreamBufferRecordControl interface is used to control stream buffer Recording objects.Use the IStreamBufferSink::CreateRecorder method on the Stream Buffer Sink filter to create new Recording objects.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecordControl)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambufferrecordcontrol
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferRecordControl extends IUnknown {
    /**
     * The interface identifier for IStreamBufferRecordControl
     * @type {Guid}
     */
    static IID := Guid("{ba9b6c99-f3c7-4ff2-92db-cfdd4851bf31}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferRecordControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start              : IntPtr
        Stop               : IntPtr
        GetRecordingStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferRecordControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Start method starts the recording.
     * @remarks
     * The start time must be less than or equal to the stop time.
     * @param {Pointer<Integer>} prtStart Pointer to a variable that contains the start time. The time is relative to the current stream time, in 100-nanosecond units. The value zero represents now; negative values are in the past; and positive values are in the future.
     * 
     * For content recordings, the time must be a value between 0 and 5 seconds (50000000), inclusive. Negative times are not valid.
     * 
     * For reference recordings, negative times are valid if they fall within existing content. If the time given in <i>prtStart</i> is earlier than the earliest valid content, the actual start time of the content is used instead. This value is returned in <i>prtStart</i> when the method returns.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * Invalid time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordcontrol-start
     */
    Start(prtStart) {
        prtStartMarshal := prtStart is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, prtStartMarshal, prtStart, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the recording and closes the file.
     * @remarks
     * The stop time must be greater than or equal to the start time.
     * @param {Integer} rtStop Specifies when the recording stops. The time is relative to the current stream time, in 100-nanosecond units. The value zero represents now; negative values are in the past; and positive values are in the future.
     * 
     * For content recordings, the valid range is from 0 to 5 seconds (50000000), inclusive. Negative times are not valid.
     * 
     * For reference recordings, a negative time is valid if it falls within valid recorded content.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordcontrol-stop
     */
    Stop(rtStop) {
        result := ComCall(4, this, "int64", rtStop, "HRESULT")
        return result
    }

    /**
     * The GetRecordingStatus method retrieves the status of the recording.
     * @remarks
     * This method reports the status of the <b>Start</b> and <b>Stop</b> methods, which themselves are asynchronous.
     * @param {Pointer<HRESULT>} phResult Pointer to a variable that receives an <b>HRESULT</b> value. The <b>HRESULT</b> value indicates the current status of writing or closing the file. This parameter can be <b>NULL</b>.
     * @param {Pointer<BOOL>} pbStarted Pointer to a variable that receives a Boolean value, indicating whether the recording has started,
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>The recording has started.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>The recording has not started.</td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<BOOL>} pbStopped Pointer to a variable that receives a Boolean value, indicating whether recording has been stopped.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>The recording has stopped.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>The recording has not stopped, or has not started yet.</td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordcontrol-getrecordingstatus
     */
    GetRecordingStatus(phResult, pbStarted, pbStopped) {
        phResultMarshal := phResult is VarRef ? "int*" : "ptr"
        pbStartedMarshal := pbStarted is VarRef ? "int*" : "ptr"
        pbStoppedMarshal := pbStopped is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, phResultMarshal, phResult, pbStartedMarshal, pbStarted, pbStoppedMarshal, pbStopped, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferRecordControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 2)
        this.vtbl.GetRecordingStatus := CallbackCreate(GetMethod(implObj, "GetRecordingStatus"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.GetRecordingStatus)
    }
}
