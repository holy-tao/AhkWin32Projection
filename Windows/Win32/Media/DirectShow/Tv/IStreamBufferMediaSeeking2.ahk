#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferMediaSeeking.ahk

/**
 * The IStreamBufferMediaSeeking2 interface is exposed by the Stream Buffer Source filter. It provides a method to control the frame rate during fast-forward play (&#0034;trick mode&#0034;).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferMediaSeeking2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nn-sbe-istreambuffermediaseeking2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferMediaSeeking2 extends IStreamBufferMediaSeeking{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferMediaSeeking2
     * @type {Guid}
     */
    static IID => Guid("{3a439ab0-155f-470a-86a6-9ea54afd6eaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRateEx"]

    /**
     * .
     * @remarks
     * At higher frames rates, the Stream Buffer Engine drops delta frames and may skip some key frames. This behavior is determined by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferconfigure2-setfftransitionrates">IStreamBufferConfigure2::SetFFTransitionRates</a> method. When the playback rate exceeds the value given in that method's <i>dwMaxNonSkippingRate</i> parameter, the Stream Buffer Engine starts to skip key frames. The number of skipped key frames is determined by the playback rate. To control how many key frames are skipped, use the <b>SetRateEx</b> method:
     * 
     * <ul>
     * <li>If the playback rate is less than or equal to <i>dwMaxNonSkippingRate</i>, the <i>dwFramesPerSec</i> parameter is ignored.</li>
     * <li>If the playback rate exceeds <i>dwMaxNonSkippingRate</i>, the Stream Buffer Engine maintains the frame rate specified in <i>dwFramesPerSec</i> and drops key frames if necessary.</li>
     * </ul>
     * The frame rate is applied to the video stream. If there is no video stream, the method fails. The actual frame rate may vary over short periods of time.
     * @param {Float} dRate Playback rate. Valid range is (<i>dRate</i> &gt;= 0.1 || <i>dRate</i> &lt;= -0.1).
     * @param {Integer} dwFramesPerSec Frames per second for fast-forward play. Cannot be zero. See Remarks for more information.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambuffermediaseeking2-setrateex
     */
    SetRateEx(dRate, dwFramesPerSec) {
        result := ComCall(20, this, "double", dRate, "uint", dwFramesPerSec, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
