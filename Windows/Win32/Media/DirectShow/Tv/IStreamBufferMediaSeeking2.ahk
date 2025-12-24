#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferMediaSeeking.ahk

/**
 * The IStreamBufferMediaSeeking2 interface is exposed by the Stream Buffer Source filter. It provides a method to control the frame rate during fast-forward play (&#0034;trick mode&#0034;).
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferMediaSeeking2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffermediaseeking2
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
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambuffermediaseeking2-setrateex
     */
    SetRateEx(dRate, dwFramesPerSec) {
        result := ComCall(20, this, "double", dRate, "uint", dwFramesPerSec, "HRESULT")
        return result
    }
}
