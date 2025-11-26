#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDroppedFrames interface retrieves performance information from a video capture filter, including how many frames were dropped and how many were delivered. Applications can use this interface to determine capture performance at run-time.
 * @remarks
 * 
 * Some filters that expose this interface do not implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamdroppedframes-getdroppedinfo">GetDroppedInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamdroppedframes-getaverageframesize">GetAverageFrameSize</a> method.
 * 
 * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-droppedframes">PROPSETID_VIDCAP_DROPPEDFRAMES</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
 * 
 * The number of dropped frames is reported by the capture driver. This information is not directly correlated with any particular media sample, so it is not accurate on a per-frame basis, although it should be accurate over time.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdroppedframes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDroppedFrames extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMDroppedFrames
     * @type {Guid}
     */
    static IID => Guid("{c6e13344-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumDropped", "GetNumNotDropped", "GetDroppedInfo", "GetAverageFrameSize"]

    /**
     * The GetNumDropped method retrieves the total number of frames that the filter has dropped since it started streaming.
     * @returns {Integer} Pointer to a variable that receives the number of dropped frames.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdroppedframes-getnumdropped
     */
    GetNumDropped() {
        result := ComCall(3, this, "int*", &plDropped := 0, "HRESULT")
        return plDropped
    }

    /**
     * The GetNumNotDropped method retrieves the total number of frames that the filter has delivered since it started streaming.
     * @returns {Integer} Pointer to a variable that receives the number of delivered frames.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdroppedframes-getnumnotdropped
     */
    GetNumNotDropped() {
        result := ComCall(4, this, "int*", &plNotDropped := 0, "HRESULT")
        return plNotDropped
    }

    /**
     * The GetDroppedInfo method retrieves an array of frame numbers that were dropped.
     * @param {Integer} lSize Specifies the size of the array.
     * @param {Pointer<Integer>} plArray Pointer to an array of size <i>lSize</i>, allocated by the caller. The method fills the array with the frame numbers of the first <i>lSize</i> frames that were dropped, up to a maximum number that is device-depedent.
     * @param {Pointer<Integer>} plNumCopied Pointer to a variable that receives the number of items returned in <i>plArray</i>. This number might be less than the value of <i>lSize</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; the <i>lSize</i> parameter must by greater than zero.
     * 
     * </td>
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PROP_ID_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported by this device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdroppedframes-getdroppedinfo
     */
    GetDroppedInfo(lSize, plArray, plNumCopied) {
        plArrayMarshal := plArray is VarRef ? "int*" : "ptr"
        plNumCopiedMarshal := plNumCopied is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", lSize, plArrayMarshal, plArray, plNumCopiedMarshal, plNumCopied, "HRESULT")
        return result
    }

    /**
     * The GetAverageFrameSize method retrieves the average size of the frames that the filter has captured.
     * @returns {Integer} Pointer to a variable that receives the average frame size, in bytes, since the filter began streaming.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdroppedframes-getaverageframesize
     */
    GetAverageFrameSize() {
        result := ComCall(6, this, "int*", &plAverageSize := 0, "HRESULT")
        return plAverageSize
    }
}
