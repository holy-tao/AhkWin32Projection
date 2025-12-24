#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidInputDeviceEvent.ahk

/**
 * This topic applies to Windows XP or later.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidPlaybackEvent)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidplaybackevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidPlaybackEvent extends IMSVidInputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidPlaybackEvent
     * @type {Guid}
     */
    static IID => Guid("{37b0353b-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EndOfMedia"]

    /**
     * This topic applies to Windows XP or later.
     * @param {IMSVidPlayback} lpd Specifies a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsvidplayback">IMSVidPlayback</a> interface of the playback device.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidplaybackevent-endofmedia
     */
    EndOfMedia(lpd) {
        result := ComCall(7, this, "ptr", lpd, "HRESULT")
        return result
    }
}
