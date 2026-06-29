#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidInputDevice.ahk" { IMSVidInputDevice }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\PositionModeList.ahk" { PositionModeList }

/**
 * The IMSVidPlayback interface controls a Video Control playback device.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidPlayback)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidplayback
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidPlayback extends IMSVidInputDevice {
    /**
     * The interface identifier for IMSVidPlayback
     * @type {Guid}
     */
    static IID := Guid("{37b03538-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidPlayback interfaces
    */
    struct Vtbl extends IMSVidInputDevice.Vtbl {
        get_EnableResetOnStop : IntPtr
        put_EnableResetOnStop : IntPtr
        Run                   : IntPtr
        Pause                 : IntPtr
        Stop                  : IntPtr
        get_CanStep           : IntPtr
        Step                  : IntPtr
        put_Rate              : IntPtr
        get_Rate              : IntPtr
        put_CurrentPosition   : IntPtr
        get_CurrentPosition   : IntPtr
        put_PositionMode      : IntPtr
        get_PositionMode      : IntPtr
        get_Length            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidPlayback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableResetOnStop {
        get => this.get_EnableResetOnStop()
        set => this.put_EnableResetOnStop(value)
    }

    /**
     * @type {Float} 
     */
    Rate {
        get => this.get_Rate()
        set => this.put_Rate(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentPosition {
        get => this.get_CurrentPosition()
        set => this.put_CurrentPosition(value)
    }

    /**
     * @type {PositionModeList} 
     */
    PositionMode {
        get => this.get_PositionMode()
        set => this.put_PositionMode(value)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * The get_EnableResetOnStop method indicates how playback will resume if the graph is rebuilt.
     * @remarks
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-put_enableresetonstop">IMSVidPlayback::put_EnableResetOnStop</a>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_enableresetonstop
     */
    get_EnableResetOnStop() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_EnableResetOnStop method indicates how playback will resume if the graph is rebuilt.
     * @remarks
     * In some situations, the filter graph may be torn down and rebuilt during play. For example, this can happen if the monitor resolution changes or the screen saver starts. The <b>put_EnableResetOnStop</b> property specifies whether the Video Control should resume playback where it was interrupted, or should restart at the beginning of the source.
     * 
     * By default, playback resumes from the point where it was interrupted. If <i>newVal</i> is VARIANT_TRUE, however, the Video Control will issue a seek command back to time zero. Note that setting this parameter to VARIANT_TRUE does not guarantee that the seek command will succeed. The seek command might fail, depending on the source.
     * @param {VARIANT_BOOL} newVal 
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_enableresetonstop
     */
    put_EnableResetOnStop(newVal) {
        result := ComCall(19, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * The Run method runs the playback device.
     * @remarks
     * This method allows for direct control of the source. However, if the underlying source filter is controlled using the standard DirectShow <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-imediacontrol">IMediaControl</a> interface, this method returns E_NOTIMPL.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-run
     */
    Run() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the playback device.
     * @remarks
     * This method allows for direct control of the source. However, if the underlying source filter is controlled using the standard DirectShow <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-imediacontrol">IMediaControl</a> interface, this method returns E_NOTIMPL.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-pause
     */
    Pause() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the playback device.
     * @remarks
     * This method allows for direct control of the source. However, if the underlying source filter is controlled using the standard DirectShow <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-imediacontrol">IMediaControl</a> interface, this method returns E_NOTIMPL.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-stop
     */
    Stop() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The get_CanStep method queries whether the input source can step frame by frame.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @param {VARIANT_BOOL} fBackwards 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_canstep
     */
    get_CanStep(fBackwards) {
        result := ComCall(23, this, VARIANT_BOOL, fBackwards, VARIANT_BOOL.Ptr, &pfCan := 0, "HRESULT")
        return pfCan
    }

    /**
     * The Step method steps through the video stream by a specified number of frames.
     * @remarks
     * Although a negative value for <i>lStep</i> is defined as stepping backward, that functionality is currently not implemented, and the method returns E_NOTIMPL.
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @param {Integer} lStep Specifies how many frames to step. If <i>lStep</i> is 1, the Video Control steps forward one frame. If <i>lStep</i> is a number <i>N</i> greater than 1, the Video Control skips <i>N</i> - 1 frames and shows the <i>N</i>th frame.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph is not built. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
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
     *  
     * 
     * <div class="alert"><b>Note</b>  The value ERROR_INVALID_STATE is converted to an <b>HRESULT</b> with the <b>HRESULT_FROM_WIN32</b> macro.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-step
     */
    Step(lStep) {
        result := ComCall(24, this, "int", lStep, "HRESULT")
        return result
    }

    /**
     * The put_Rate method sets the playback rate.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @param {Float} plRate Specifies the playback rate, as a ratio to the authored rate. For example, 0.5 means half the normal speed, 1.0 means normal speed, and 2.0 means twice the normal speed.
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
     * The source filter does not support the specified rate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph is not built. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
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
     *  
     * 
     * <div class="alert"><b>Note</b>  The value ERROR_INVALID_STATE is converted to an <b>HRESULT</b> with the <b>HRESULT_FROM_WIN32</b> macro.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_rate
     */
    put_Rate(plRate) {
        result := ComCall(25, this, "double", plRate, "HRESULT")
        return result
    }

    /**
     * The get_Rate method retrieves the playback rate.
     * @returns {Float} Pointer to a variable that receives the playback rate, as a ratio to the authored rate. For example, 0.5 means half the normal speed, 1.0 means normal speed, and 2.0 means twice the normal speed.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_rate
     */
    get_Rate() {
        result := ComCall(26, this, "double*", &plRate := 0, "HRESULT")
        return plRate
    }

    /**
     * The put_CurrentPosition method seeks to a specified position in the source.
     * @remarks
     * If the new position is earlier than the current position and the source cannot seek backward, the method returns E_INVALIDARG.
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @param {Integer} lPosition Specifies the new position. The units for this parameter are determined by the current position mode.
     * 
     * <table>
     * <tr>
     * <th>Position Mode
     *                 </th>
     * <th>Returned Value
     *                 </th>
     * </tr>
     * <tr>
     * <td>FrameMode</td>
     * <td>Frame number</td>
     * </tr>
     * <tr>
     * <td>TenthsSecondsMode</td>
     * <td>Hundredths of seconds</td>
     * </tr>
     * </table>
     *  
     * 
     * To set the position mode, call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-put_positionmode">IMSVidPlayback::put_PositionMode</a>.
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
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph is not built. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
     * 
     * </td>
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
     *  
     * 
     * <div class="alert"><b>Note</b>  The value ERROR_INVALID_STATE is converted to an <b>HRESULT</b> with the <b>HRESULT_FROM_WIN32</b> macro.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_currentposition
     */
    put_CurrentPosition(lPosition) {
        result := ComCall(27, this, "int", lPosition, "HRESULT")
        return result
    }

    /**
     * The get_CurrentPosition method returns the current playback position of the source.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @returns {Integer} Pointer to a variable that receives the playback position. The units for the returned value are determined by the current position mode:
     * 
     * <table>
     * <tr>
     * <th>Position Mode
     *                 </th>
     * <th>Returned Value
     *                 </th>
     * </tr>
     * <tr>
     * <td>FrameMode</td>
     * <td>Frame number</td>
     * </tr>
     * <tr>
     * <td>TenthsSecondsMode</td>
     * <td>Hundredths of seconds</td>
     * </tr>
     * </table>
     *  
     * 
     * To set the position mode, call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-put_positionmode">IMSVidPlayback::put_PositionMode</a>.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_currentposition
     */
    get_CurrentPosition() {
        result := ComCall(28, this, "int*", &lPosition := 0, "HRESULT")
        return lPosition
    }

    /**
     * The put_PositionMode method specifies how position values will be interpreted by this interface.
     * @remarks
     * The position mode determines how the parameters are interpreted for the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-get_length">IMSVidPlayback::get_Length</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-get_currentposition">IMSVidPlayback::get_CurrentPosition</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-put_currentposition">IMSVidPlayback::put_CurrentPosition</a>
     * </li>
     * </ul>
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @param {PositionModeList} lPositionMode 
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
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph is not built. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed. Possibly the source does not support this mode.
     * 
     * </td>
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
     *  
     * 
     * <div class="alert"><b>Note</b>  The value ERROR_INVALID_STATE is converted to an <b>HRESULT</b> with the <b>HRESULT_FROM_WIN32</b> macro.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_positionmode
     */
    put_PositionMode(lPositionMode) {
        result := ComCall(29, this, PositionModeList, lPositionMode, "HRESULT")
        return result
    }

    /**
     * The get_PositionMode method indicates how position values are interpreted by this interface.
     * @remarks
     * The value returned by this method determines how the parameters are interpreted for the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-get_length">IMSVidPlayback::get_Length</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-get_currentposition">IMSVidPlayback::get_CurrentPosition</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-put_currentposition">IMSVidPlayback::put_CurrentPosition</a>
     * </li>
     * </ul>
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @returns {PositionModeList} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_positionmode
     */
    get_PositionMode() {
        result := ComCall(30, this, "int*", &lPositionMode := 0, "HRESULT")
        return lPositionMode
    }

    /**
     * The get_Length method retrieves the length of the playback source.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method before calling this method.
     * @returns {Integer} Pointer to a variable that receives the length. The units for the returned value are determined by the current position mode.
     * 
     * <table>
     * <tr>
     * <th>Position Mode
     *                 </th>
     * <th>Returned Value
     *                 </th>
     * </tr>
     * <tr>
     * <td>FrameMode</td>
     * <td>Frame number</td>
     * </tr>
     * <tr>
     * <td>TenthsSecondsMode</td>
     * <td>Hundredths of seconds</td>
     * </tr>
     * </table>
     *  
     * 
     * To set the position mode, call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidplayback-put_positionmode">IMSVidPlayback::put_PositionMode</a>.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_length
     */
    get_Length() {
        result := ComCall(31, this, "int*", &lLength := 0, "HRESULT")
        return lLength
    }

    Query(iid) {
        if (IMSVidPlayback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EnableResetOnStop := CallbackCreate(GetMethod(implObj, "get_EnableResetOnStop"), flags, 2)
        this.vtbl.put_EnableResetOnStop := CallbackCreate(GetMethod(implObj, "put_EnableResetOnStop"), flags, 2)
        this.vtbl.Run := CallbackCreate(GetMethod(implObj, "Run"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.get_CanStep := CallbackCreate(GetMethod(implObj, "get_CanStep"), flags, 3)
        this.vtbl.Step := CallbackCreate(GetMethod(implObj, "Step"), flags, 2)
        this.vtbl.put_Rate := CallbackCreate(GetMethod(implObj, "put_Rate"), flags, 2)
        this.vtbl.get_Rate := CallbackCreate(GetMethod(implObj, "get_Rate"), flags, 2)
        this.vtbl.put_CurrentPosition := CallbackCreate(GetMethod(implObj, "put_CurrentPosition"), flags, 2)
        this.vtbl.get_CurrentPosition := CallbackCreate(GetMethod(implObj, "get_CurrentPosition"), flags, 2)
        this.vtbl.put_PositionMode := CallbackCreate(GetMethod(implObj, "put_PositionMode"), flags, 2)
        this.vtbl.get_PositionMode := CallbackCreate(GetMethod(implObj, "get_PositionMode"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EnableResetOnStop)
        CallbackFree(this.vtbl.put_EnableResetOnStop)
        CallbackFree(this.vtbl.Run)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.get_CanStep)
        CallbackFree(this.vtbl.Step)
        CallbackFree(this.vtbl.put_Rate)
        CallbackFree(this.vtbl.get_Rate)
        CallbackFree(this.vtbl.put_CurrentPosition)
        CallbackFree(this.vtbl.get_CurrentPosition)
        CallbackFree(this.vtbl.put_PositionMode)
        CallbackFree(this.vtbl.get_PositionMode)
        CallbackFree(this.vtbl.get_Length)
    }
}
