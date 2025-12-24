#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVideoFrameStep interface steps through a video stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivideoframestep
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVideoFrameStep extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrameStep
     * @type {Guid}
     */
    static IID => Guid("{e46a9787-2b71-444d-a4b5-1fab7b708d6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Step", "CanStep", "CancelStep"]

    /**
     * The Step method causes the filter graph to step forward by the specified number of frames.
     * @param {Integer} dwFrames Specifies the number of frames to skip. If <i>dwFrames</i> is 1, the graph steps forward one frame. If <i>dwFrames</i> is a number <i>n</i> greater than 1, the graph skips <i>n</i> - 1 frames and shows the <i>n</i>th frame.
     * @param {IUnknown} pStepObject Pointer to an interface on the filter that will control the stepping operation, or <b>NULL</b>. Specify <b>NULL</b> to perform the frame stepping using the renderer filter in the graph. If non-<b>NULL</b>, the object must implement the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ikspropertyset">IKsPropertySet</a> interface and support the AM_KSPROPSETID_FrameStep property. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/frame-stepping-property-set">Frame Stepping Property Set</a>.) If the graph includes a custom filter that implements the frame stepping, <i>pStepObject</i> can specify a pointer to that filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_FRAME_STEP_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Frame stepping is not supported.
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
     * The <i>pStepObject</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivideoframestep-step
     */
    Step(dwFrames, pStepObject) {
        result := ComCall(3, this, "uint", dwFrames, "ptr", pStepObject, "HRESULT")
        return result
    }

    /**
     * The CanStep method determines the stepping capabilities of the specified filter.
     * @param {Integer} bMultiple If <i>bMultiple</i> is zero and the method returns S_OK, the graph can step one frame at a time. If <i>bMultiple</i> if greater than zero and the method returns S_OK, the graph can step <i>bMultiple</i> frames at a time.
     * @param {IUnknown} pStepObject Pointer to an interface on the filter that will control the stepping operation. Specify <b>NULL</b> to perform frame stepping using the renderer filter in the graph. If the graph includes a custom filter that implements the frame stepping, then <i>pStepObject</i> should specify that filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface.
     * @returns {HRESULT} Returns S_OK if the object can step or E_INVALIDARG if <i>pStepObject</i> is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivideoframestep-canstep
     */
    CanStep(bMultiple, pStepObject) {
        result := ComCall(4, this, "int", bMultiple, "ptr", pStepObject, "HRESULT")
        return result
    }

    /**
     * The CancelStep method cancels the previous IVideoFrameStep::Step operation.
     * @returns {HRESULT} Returns S_OK if the <b>Step</b> operation was successfully canceled, or E_FAIL otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivideoframestep-cancelstep
     */
    CancelStep() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
