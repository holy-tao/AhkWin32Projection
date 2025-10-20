#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioViewManagerService extends IUnknown{
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
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetAudioStreamWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
