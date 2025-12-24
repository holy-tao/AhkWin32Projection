#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMixerOCXNotify interface is implemented by clients and called by the Overlay Mixer to send notifications of events affecting the video display rectangle.
 * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nn-mixerocx-imixerocxnotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMixerOCXNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMixerOCXNotify
     * @type {Guid}
     */
    static IID => Guid("{81a3bd31-dee1-11d1-8508-00a0c91f9ca0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInvalidateRect", "OnStatusChange", "OnDataChange"]

    /**
     * The OnInvalidateRect method notifies the client that the video rectangle has been invalidated.
     * @param {Pointer<RECT>} lpcRect Specifies the rectangle that has been invalidated, in screen coordinates.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocxnotify-oninvalidaterect
     */
    OnInvalidateRect(lpcRect) {
        result := ComCall(3, this, "ptr", lpcRect, "HRESULT")
        return result
    }

    /**
     * The OnStatusChange method informs the client that a status change has occurred.
     * @param {Integer} ulStatusFlags Bitwise OR of one or more of the following status flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_UNCONNECTED (0x00000000)</td>
     * <td>The Overlay Mixer is unconnected and stopped.</td>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_CONNECTED_STOPPED (0x00000001)</td>
     * <td>The Overlay Mixer is connected and stopped.</td>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_CONNECTED_PAUSED (0x00000002)</td>
     * <td>The Overlay Mixer is connected and paused.</td>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_CONNECTED_PLAYING (0x00000003)</td>
     * <td>The Overlay Mixer is connected and playing.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocxnotify-onstatuschange
     */
    OnStatusChange(ulStatusFlags) {
        result := ComCall(4, this, "uint", ulStatusFlags, "HRESULT")
        return result
    }

    /**
     * The OnDataChange method notifies the client when the video rectangle's aspect ratio or size, or the display palette, has changed.
     * @param {Integer} ulDataFlags Flag indicating which set of data has changed. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Flags
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MIXER_DATA_ASPECT_RATIO (0x00000001)</td>
     * <td>Picture aspect ratio.</td>
     * </tr>
     * <tr>
     * <td>MIXER_DATA_NATIVE_SIZE (0x00000002)</td>
     * <td>The video stream's native size changed.</td>
     * </tr>
     * <tr>
     * <td>MIXER_DATA_PALETTE (0x00000004)</td>
     * <td>The video palette changed.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocxnotify-ondatachange
     */
    OnDataChange(ulDataFlags) {
        result := ComCall(5, this, "uint", ulDataFlags, "HRESULT")
        return result
    }
}
