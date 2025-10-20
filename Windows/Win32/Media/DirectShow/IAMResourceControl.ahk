#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMResourceControl interface opens and holds an audio device resource before the device is actually needed, so that playback can be guaranteed or the application can learn in advance that a device is not available.The following filters implement this interface:Audio Capture filter.DirectSound Renderer filter.Audio Renderer (WaveOut) filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamresourcecontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMResourceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMResourceControl
     * @type {Guid}
     */
    static IID => Guid("{8389d2d0-77d7-11d1-abe6-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reserve"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamresourcecontrol-reserve
     */
    Reserve(dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "uint", dwFlags, "ptr", pvReserved, "HRESULT")
        return result
    }
}
