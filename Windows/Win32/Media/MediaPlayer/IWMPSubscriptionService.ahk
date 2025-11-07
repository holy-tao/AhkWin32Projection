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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["allowPlay", "allowCDBurn", "allowPDATransfer", "startBackgroundProcessing"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IWMPMedia} pMedia 
     * @param {Pointer<BOOL>} pfAllowPlay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-allowplay
     */
    allowPlay(hwnd, pMedia, pfAllowPlay) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfAllowPlayMarshal := pfAllowPlay is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", hwnd, "ptr", pMedia, pfAllowPlayMarshal, pfAllowPlay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IWMPPlaylist} pPlaylist 
     * @param {Pointer<BOOL>} pfAllowBurn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-allowcdburn
     */
    allowCDBurn(hwnd, pPlaylist, pfAllowBurn) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfAllowBurnMarshal := pfAllowBurn is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", hwnd, "ptr", pPlaylist, pfAllowBurnMarshal, pfAllowBurn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IWMPPlaylist} pPlaylist 
     * @param {Pointer<BOOL>} pfAllowTransfer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-allowpdatransfer
     */
    allowPDATransfer(hwnd, pPlaylist, pfAllowTransfer) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfAllowTransferMarshal := pfAllowTransfer is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", hwnd, "ptr", pPlaylist, pfAllowTransferMarshal, pfAllowTransfer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-startbackgroundprocessing
     */
    startBackgroundProcessing(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
