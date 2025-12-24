#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidInputDevice.ahk

/**
 * The IMSVidPlayback interface controls a Video Control playback device.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidPlayback)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidplayback
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidPlayback extends IMSVidInputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidPlayback
     * @type {Guid}
     */
    static IID => Guid("{37b03538-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnableResetOnStop", "put_EnableResetOnStop", "Run", "Pause", "Stop", "get_CanStep", "Step", "put_Rate", "get_Rate", "put_CurrentPosition", "get_CurrentPosition", "put_PositionMode", "get_PositionMode", "get_Length"]

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
     * @type {Integer} 
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
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-get_enableresetonstop
     */
    get_EnableResetOnStop() {
        result := ComCall(18, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_EnableResetOnStop method indicates how playback will resume if the graph is rebuilt.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-put_enableresetonstop
     */
    put_EnableResetOnStop(newVal) {
        result := ComCall(19, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * The Run method runs the playback device.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-run
     */
    Run() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the playback device.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-pause
     */
    Pause() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the playback device.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-stop
     */
    Stop() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The get_CanStep method queries whether the input source can step frame by frame.
     * @param {VARIANT_BOOL} fBackwards 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-get_canstep
     */
    get_CanStep(fBackwards) {
        result := ComCall(23, this, "short", fBackwards, "short*", &pfCan := 0, "HRESULT")
        return pfCan
    }

    /**
     * The Step method steps through the video stream by a specified number of frames.
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
     * The graph is not built. Call the <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-step
     */
    Step(lStep) {
        result := ComCall(24, this, "int", lStep, "HRESULT")
        return result
    }

    /**
     * The put_Rate method sets the playback rate.
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
     * The graph is not built. Call the <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-put_rate
     */
    put_Rate(plRate) {
        result := ComCall(25, this, "double", plRate, "HRESULT")
        return result
    }

    /**
     * The get_Rate method retrieves the playback rate.
     * @returns {Float} Pointer to a variable that receives the playback rate, as a ratio to the authored rate. For example, 0.5 means half the normal speed, 1.0 means normal speed, and 2.0 means twice the normal speed.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-get_rate
     */
    get_Rate() {
        result := ComCall(26, this, "double*", &plRate := 0, "HRESULT")
        return plRate
    }

    /**
     * The put_CurrentPosition method seeks to a specified position in the source.
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
     * The graph is not built. Call the <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-put_currentposition
     */
    put_CurrentPosition(lPosition) {
        result := ComCall(27, this, "int", lPosition, "HRESULT")
        return result
    }

    /**
     * The get_CurrentPosition method returns the current playback position of the source.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-get_currentposition
     */
    get_CurrentPosition() {
        result := ComCall(28, this, "int*", &lPosition := 0, "HRESULT")
        return lPosition
    }

    /**
     * The put_PositionMode method specifies how position values will be interpreted by this interface.
     * @param {Integer} lPositionMode 
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
     * The graph is not built. Call the <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> or <a href="/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> method on the Video Control.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-put_positionmode
     */
    put_PositionMode(lPositionMode) {
        result := ComCall(29, this, "int", lPositionMode, "HRESULT")
        return result
    }

    /**
     * The get_PositionMode method indicates how position values are interpreted by this interface.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-get_positionmode
     */
    get_PositionMode() {
        result := ComCall(30, this, "int*", &lPositionMode := 0, "HRESULT")
        return lPositionMode
    }

    /**
     * The get_Length method retrieves the length of the playback source.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplayback-get_length
     */
    get_Length() {
        result := ComCall(31, this, "int*", &lLength := 0, "HRESULT")
        return lLength
    }
}
