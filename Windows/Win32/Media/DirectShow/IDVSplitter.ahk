#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Downgrades the frame rate on a digital video (DV) stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvsplitter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDVSplitter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVSplitter
     * @type {Guid}
     */
    static IID => Guid("{92a3a302-da7c-4a1f-ba7e-1802bb5d2d02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DiscardAlternateVideoFrames"]

    /**
     * The DiscardAlternateVideoFrames method discards half of the frames in the video stream. For NTSC, the frame rate is reduced from 30 frames per second (fps) to 15 fps. For PAL, the frame rate is reduced from 25 fps to 12.5 fps.
     * @param {Integer} nDiscard Flag that specifies whether to discard frames. If the value is non-zero, the filter discards alternate frames. If the value is zero, the filter delivers every frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter is paused or running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvsplitter-discardalternatevideoframes
     */
    DiscardAlternateVideoFrames(nDiscard) {
        result := ComCall(3, this, "int", nDiscard, "HRESULT")
        return result
    }
}
