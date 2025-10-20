#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioviewmanagerservice
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioViewManagerService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioViewManagerService
     * @type {Guid}
     */
    static IID => Guid("{a7a7ef10-1f49-45e0-ad35-612057cc8f74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAudioStreamWindow"]

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioviewmanagerservice-setaudiostreamwindow
     */
    SetAudioStreamWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
