#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservice
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSubscriptionService extends IUnknown{
    /**
     * The interface identifier for IWMPSubscriptionService
     * @type {Guid}
     */
    static IID => Guid("{376055f8-2a59-4a73-9501-dca5273a7a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IWMPMedia>} pMedia 
     * @param {Pointer<BOOL>} pfAllowPlay 
     * @returns {HRESULT} 
     */
    allowPlay(hwnd, pMedia, pfAllowPlay) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "ptr", pMedia, "ptr", pfAllowPlay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IWMPPlaylist>} pPlaylist 
     * @param {Pointer<BOOL>} pfAllowBurn 
     * @returns {HRESULT} 
     */
    allowCDBurn(hwnd, pPlaylist, pfAllowBurn) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "ptr", pPlaylist, "ptr", pfAllowBurn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IWMPPlaylist>} pPlaylist 
     * @param {Pointer<BOOL>} pfAllowTransfer 
     * @returns {HRESULT} 
     */
    allowPDATransfer(hwnd, pPlaylist, pfAllowTransfer) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "ptr", pPlaylist, "ptr", pfAllowTransfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    startBackgroundProcessing(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
