#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservice
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
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Your code should not perform lengthy operations synchronously when Windows Media Player calls this method. Instead, you must perform time-consuming tasks on a separate worker thread.
     * 
     * Windows Media Player calls <b>allowPlay</b> before opening the digital media file. This gives the online store an opportunity to disallow playback of licensed content or to initiate download of a new license if the license has expired.
     * 
     * Because the digital media file is not open when Windows Media Player calls <b>allowPlay</b>, calling certain methods on <i>pMedia</i> may not work. For instance, attempting to retrieve metadata using <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpmedia-getiteminfo">IWMPMedia::getItemInfo</a> could fail.
     * 
     * The <b>allowPlay</b> method does not circumvent DRM. If the method returns <b>TRUE</b> and the license to play has not been renewed, Windows Media Player will not play the content.
     * 
     * The <b>allowPlay</b> method is not called when streaming protected content for which the user does not have a license.
     * @param {HWND} _hwnd 
     * @param {IWMPMedia} pMedia Pointer to the media object Windows Media Player is attempting to play.
     * @param {Pointer<BOOL>} pfAllowPlay Pointer to a <b>BOOL</b>. If <b>true</b>, playback is allowed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-allowplay
     */
    allowPlay(_hwnd, pMedia, pfAllowPlay) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfAllowPlayMarshal := pfAllowPlay is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", _hwnd, "ptr", pMedia, pfAllowPlayMarshal, pfAllowPlay, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The situations in which Windows Media Player calls <b>allowCDBurn</b> differ between versions of Windows Media Player.
     * 
     * Windows Media Player 9 Series and Windows Media Player 10 call <b>allowCDBurn</b> automatically when the user attempts to burn a list of media items to a CD, and the Player passes the entire list in the <i>pPlaylist</i> parameter. The <b>allowCDBurn</b> method removes from the playlist any media items that do not have a current license. Then the <b>allowCDBurn</b> method can initiate license renewal, on a background thread, for media items that do not have current licenses. The <b>allowCDBurn</b> method must not wait for the background thread to complete the license renewal. Instead, it must return as soon as it has initiated the renewal.
     * 
     * Windows Media Player 11 never calls <b>allowCDBurn</b> automatically. That is, Windows Media Player 11 calls <b>allowCDBurn</b> only when the user explicitly requests burn rights. When the user attempts to burn a list of media items to a CD, Windows Media Player checks to see whether those items have current licenses that include burn rights. For each item that does not have a current license, the Player displays an information icon, which has a context menu. The context menu lets the user request burn rights for the individual media item or for all media items in the basket from the same online store that do not already have burn rights. If the user requests burn rights by choosing a command from the context menu, the Player calls <b>allowCDBurn</b>, passing a playlist that contains the media items for which the user is requesting rights. The <b>allowCDBurn</b> method can then initiate license renewal on a background thread. The <b>allowCDBurn</b> method must not wait for the background thread to complete the license renewal. Instead, it must return as soon as it has initiated the renewal.
     * 
     * Note that Windows Media Player 11 ignores the playlist and the Boolean value that <b>allowCDBurn</b> returns in the <i>pPlaylist</i> and <i>pfAllowBurn</i> parameters. Also note that because of the way Windows Media Player 11 handles burn rights, you must not rely on <b>allowCDBurn</b> being called each time a track is burned to a CD.
     * 
     * Regardless of the Player version, there is no callback mechanism that the background thread can use to notify Windows Media Player that a license renewal is complete. However, if the license renewal for a media item succeeds, then the next time the user attempts to copy the item to a CD, the copy will succeed.
     * @param {HWND} _hwnd 
     * @param {IWMPPlaylist} pPlaylist Pointer to a playlist object. The plug-in must remove from the playlist any media item that does not have a current license that includes burn rights.
     * @param {Pointer<BOOL>} pfAllowBurn Pointer to a <b>BOOL</b>. If true, copying to CD is allowed for the media items that remain in the playlist.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-allowcdburn
     */
    allowCDBurn(_hwnd, pPlaylist, pfAllowBurn) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfAllowBurnMarshal := pfAllowBurn is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", _hwnd, "ptr", pPlaylist, pfAllowBurnMarshal, pfAllowBurn, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Your code should not perform lengthy operations synchronously when Windows Media Player calls this method.
     * 
     * When Windows Media Player calls your plug-in's <b>allowPDATransfer</b> method, it passes a pointer to a playlist, which contains items from your online store. Your <b>allowPDATransfer</b> method must remove any items from the playlist that should not be synchronized with a device.
     * 
     * The situations in which Windows Media Player calls <b>allowPDATranfer</b> differ between versions of Windows Media Player.
     * 
     * Windows Media Player 9 Series and Windows Media Player 10 call <b>allowPDATransfer</b> automatically in certain situations. For example, if the user attempts to synchronize a list of tracks with a device, and some of those tracks do not have permission to be synchronized, Windows Media Player calls <b>allowPDATransfer</b>.
     * 
     * Windows Media Player 11 never calls <b>allowPDATransfer</b> automatically. That is, Windows Media Player 11 calls <b>allowPDATransfer</b> only when the user explicitly requests synchronization rights. For example, the user might request a synchronization rights by choosing a command from the context menu of an information icon.
     * 
     * Do not rely on <b>allowPDATransfer</b> being called each time a track is synchronized with a device. Instead, implement <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-prepareforsync">IWMPSubscriptionService2::prepareForSync</a>.
     * @param {HWND} _hwnd 
     * @param {IWMPPlaylist} pPlaylist Pointer to a playlist object.
     * @param {Pointer<BOOL>} pfAllowTransfer Pointer to a <b>BOOL</b>. If true, copying to a device is allowed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-allowpdatransfer
     */
    allowPDATransfer(_hwnd, pPlaylist, pfAllowTransfer) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        pfAllowTransferMarshal := pfAllowTransfer is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", _hwnd, "ptr", pPlaylist, pfAllowTransferMarshal, pfAllowTransfer, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Your code should not perform lengthy operations synchronously when Windows Media Player calls this method. Instead, you must perform time-consuming tasks on a separate worker thread.
     * 
     * Windows Media Player calls <b>startBackgroundProcessing</b> during idle time after the user selects the online store. This is useful for the online store to acquire play count data or renew expired licenses.
     * @param {HWND} _hwnd 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice-startbackgroundprocessing
     */
    startBackgroundProcessing(_hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(6, this, "ptr", _hwnd, "HRESULT")
        return result
    }
}
