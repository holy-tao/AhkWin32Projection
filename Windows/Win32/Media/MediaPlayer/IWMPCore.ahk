#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPControls.ahk
#Include .\IWMPSettings.ahk
#Include .\IWMPMedia.ahk
#Include .\IWMPMediaCollection.ahk
#Include .\IWMPPlaylistCollection.ahk
#Include .\IWMPNetwork.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPCdromCollection.ahk
#Include .\IWMPClosedCaption.ahk
#Include .\IWMPError.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCore interface is the root interface for the Windows Media Player control. It can be used to retrieve pointers to other interfaces supported by the control and to access some basic features.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcore
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCore extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCore
     * @type {Guid}
     */
    static IID => Guid("{d84cca99-cce2-11d2-9ecc-0000f8085981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["close", "get_URL", "put_URL", "get_openState", "get_playState", "get_controls", "get_settings", "get_currentMedia", "put_currentMedia", "get_mediaCollection", "get_playlistCollection", "get_versionInfo", "launchURL", "get_network", "get_currentPlaylist", "put_currentPlaylist", "get_cdromCollection", "get_closedCaption", "get_isOnline", "get_error", "get_status"]

    /**
     */
    URL {
        get => this.get_URL()
        set => this.put_URL(value)
    }

    /**
     */
    openState {
        get => this.get_openState()
    }

    /**
     */
    playState {
        get => this.get_playState()
    }

    /**
     * @type {IWMPControls} 
     */
    controls {
        get => this.get_controls()
    }

    /**
     * @type {IWMPSettings} 
     */
    settings {
        get => this.get_settings()
    }

    /**
     * @type {IWMPMedia} 
     */
    currentMedia {
        get => this.get_currentMedia()
        set => this.put_currentMedia(value)
    }

    /**
     * @type {IWMPMediaCollection} 
     */
    mediaCollection {
        get => this.get_mediaCollection()
    }

    /**
     * @type {IWMPPlaylistCollection} 
     */
    playlistCollection {
        get => this.get_playlistCollection()
    }

    /**
     */
    versionInfo {
        get => this.get_versionInfo()
    }

    /**
     * @type {IWMPNetwork} 
     */
    network {
        get => this.get_network()
    }

    /**
     * @type {IWMPPlaylist} 
     */
    currentPlaylist {
        get => this.get_currentPlaylist()
        set => this.put_currentPlaylist(value)
    }

    /**
     * @type {IWMPCdromCollection} 
     */
    cdromCollection {
        get => this.get_cdromCollection()
    }

    /**
     * @type {IWMPClosedCaption} 
     */
    closedCaption {
        get => this.get_closedCaption()
    }

    /**
     */
    isOnline {
        get => this.get_isOnline()
    }

    /**
     * @type {IWMPError} 
     */
    error {
        get => this.get_error()
    }

    /**
     */
    status {
        get => this.get_status()
    }

    /**
     * The close method releases Windows Media Player resources.
     * @remarks
     * This method closes the current digital media file, not Windows Media Player.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-close
     */
    close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The get_URL method retrieves the name of the clip to play.
     * @remarks
     * Applications that open media items from behind a firewall will have better performance if the address is specified using the domain name server (DNS) name instead of the IP address.
     * 
     * Calling this method from an event handler may yield unexpected results.
     * @param {Pointer<BSTR>} pbstrURL Pointer to a <b>BSTR</b> containing the URL.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_url
     */
    get_URL(pbstrURL) {
        result := ComCall(8, this, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * The put_URL method specifies the URL of the media item to play.
     * @remarks
     * This method can only be used to set a URL in a security zone that is the same or is less restrictive than the security zone of the calling program or webpage.
     * 
     * Applications that open media items from behind a firewall will have better performance if the address is specified using the domain name server (DNS) name instead of the IP address.
     * 
     * Do not call this method from event handler code as it may yield unexpected results.
     * @param {BSTR} bstrURL <b>BSTR</b> containing the URL.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-put_url
     */
    put_URL(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(9, this, "ptr", bstrURL, "HRESULT")
        return result
    }

    /**
     * The get_openState method retrieves an enumeration value indicating the state of the content source.
     * @remarks
     * Windows Media Player states are not guaranteed to occur in any particular order. Furthermore, not every state necessarily occurs during a sequence of events. You should not write code that relies upon state order.
     * @param {Pointer<Integer>} pwmpos Pointer to a <b>WMPOpenState</b> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_openstate
     */
    get_openState(pwmpos) {
        pwmposMarshal := pwmpos is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pwmposMarshal, pwmpos, "HRESULT")
        return result
    }

    /**
     * The get_playState method retrieves an enumeration value indicating the operating state of Windows Media Player.
     * @remarks
     * Windows Media Player states are not guaranteed to occur in any particular order. Furthermore, not every state necessarily occurs during a sequence of events. You should not write code that relies upon state order.
     * @param {Pointer<Integer>} pwmpps Pointer to a <b>WMPPlayState</b> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_playstate
     */
    get_playState(pwmpps) {
        pwmppsMarshal := pwmpps is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pwmppsMarshal, pwmpps, "HRESULT")
        return result
    }

    /**
     * The get_controls method retrieves a pointer to an IWMPControls interface.
     * @returns {IWMPControls} Pointer to a pointer to an <b>IWMPControls</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_controls
     */
    get_controls() {
        result := ComCall(12, this, "ptr*", &ppControl := 0, "HRESULT")
        return IWMPControls(ppControl)
    }

    /**
     * The get_settings method retrieves a pointer to an IWMPSettings interface.
     * @returns {IWMPSettings} Pointer to a pointer to an <b>IWMPSettings</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_settings
     */
    get_settings() {
        result := ComCall(13, this, "ptr*", &ppSettings := 0, "HRESULT")
        return IWMPSettings(ppSettings)
    }

    /**
     * The get_currentMedia method retrieves a pointer to an IWMPMedia interface corresponding to the current media item.
     * @returns {IWMPMedia} Pointer to a pointer to an <b>IWMPMedia</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_currentmedia
     */
    get_currentMedia() {
        result := ComCall(14, this, "ptr*", &ppMedia := 0, "HRESULT")
        return IWMPMedia(ppMedia)
    }

    /**
     * The put_currentMedia method specifies the IWMPMedia interface that corresponds to the current media item.
     * @remarks
     * If the <b>IWMPSettings::put_autoStart</b> method was invoked with an argument of true, file playback will begin automatically whenever you invoke <b>put_currentMedia</b>.
     * 
     * You can retrieve an <b>IWMPMedia</b> interface for a given media item by invoking the <b>IWMPPlaylist::get_item</b> method.
     * @param {IWMPMedia} pMedia Pointer to an <b>IWMPMedia</b> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-put_currentmedia
     */
    put_currentMedia(pMedia) {
        result := ComCall(15, this, "ptr", pMedia, "HRESULT")
        return result
    }

    /**
     * The get_mediaCollection method retrieves a pointer to an IWMPMediaCollection interface.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @returns {IWMPMediaCollection} Pointer to a pointer to an <b>IWMPMediaCollection</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_mediacollection
     */
    get_mediaCollection() {
        result := ComCall(16, this, "ptr*", &ppMediaCollection := 0, "HRESULT")
        return IWMPMediaCollection(ppMediaCollection)
    }

    /**
     * The get_playlistCollection method retrieves a pointer to an IWMPPlaylistCollection interface.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @returns {IWMPPlaylistCollection} Pointer to a pointer to an <b>IWMPPlaylistCollection</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_playlistcollection
     */
    get_playlistCollection() {
        result := ComCall(17, this, "ptr*", &ppPlaylistCollection := 0, "HRESULT")
        return IWMPPlaylistCollection(ppPlaylistCollection)
    }

    /**
     * The get_versionInfo method retrieves a String value specifying the version of Windows Media Player.
     * @remarks
     * The returned string has the following format: "<i>X</i>.0.0.<i>YYYY</i>" where <i>X</i> represents the major version number and <i>YYYY</i> represents the build number.
     * @param {Pointer<BSTR>} pbstrVersionInfo Pointer to a <b>BSTR</b> containing the version info.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_versioninfo
     */
    get_versionInfo(pbstrVersionInfo) {
        result := ComCall(18, this, "ptr", pbstrVersionInfo, "HRESULT")
        return result
    }

    /**
     * The launchURL method sends a URL to the user's default browser.
     * @remarks
     * This method only opens webpages using the HTTP or HTTPS protocols.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {BSTR} bstrURL <b>BSTR</b> containing the URL.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-launchurl
     */
    launchURL(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(19, this, "ptr", bstrURL, "HRESULT")
        return result
    }

    /**
     * The get_network method retrieves a pointer to an IWMPNetwork interface.
     * @remarks
     * Returns the network information handler
     * @returns {IWMPNetwork} Pointer to a pointer to an <b>IWMPNetwork</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_network
     */
    get_network() {
        result := ComCall(20, this, "ptr*", &ppQNI := 0, "HRESULT")
        return IWMPNetwork(ppQNI)
    }

    /**
     * The get_currentPlaylist method retrieves a pointer to an IWMPPlaylist interface corresponding to the current playlist.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_currentplaylist
     */
    get_currentPlaylist() {
        result := ComCall(21, this, "ptr*", &ppPL := 0, "HRESULT")
        return IWMPPlaylist(ppPL)
    }

    /**
     * The put_currentPlaylist method specifies the IWMPPlaylist interface that corresponds to the current playlist.
     * @remarks
     * If the <b>IWMPSettings::put_autoStart</b> method was invoked with an argument of true, file playback will begin automatically whenever you invoke <b>put_currentPlaylist</b>.
     * 
     * You can retrieve an <b>IWMPMedia</b> interface for a given media object by invoking the <b>IWMPPlaylist::get_Item</b> method.
     * @param {IWMPPlaylist} pPL Pointer to an <b>IWMPPlaylist</b> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-put_currentplaylist
     */
    put_currentPlaylist(pPL) {
        result := ComCall(22, this, "ptr", pPL, "HRESULT")
        return result
    }

    /**
     * The get_cdromCollection method retrieves a pointer to an IWMPCdromCollection interface.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @returns {IWMPCdromCollection} Pointer to a pointer to an <b>IWMPCdromCollection</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_cdromcollection
     */
    get_cdromCollection() {
        result := ComCall(23, this, "ptr*", &ppCdromCollection := 0, "HRESULT")
        return IWMPCdromCollection(ppCdromCollection)
    }

    /**
     * The get_closedCaption method retrieves a pointer to an IWMPClosedCaption interface.
     * @returns {IWMPClosedCaption} Pointer to a pointer to an <b>IWMPClosedCaption</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_closedcaption
     */
    get_closedCaption() {
        result := ComCall(24, this, "ptr*", &ppClosedCaption := 0, "HRESULT")
        return IWMPClosedCaption(ppClosedCaption)
    }

    /**
     * The get_isOnline method retrieves a value indicating whether the user is connected to a network.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>TRUE</b>.
     * @param {Pointer<VARIANT_BOOL>} pfOnline Pointer to a <b>VARIANT_BOOL</b>, <b>true</b> indicating online.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_isonline
     */
    get_isOnline(pfOnline) {
        pfOnlineMarshal := pfOnline is VarRef ? "short*" : "ptr"

        result := ComCall(25, this, pfOnlineMarshal, pfOnline, "HRESULT")
        return result
    }

    /**
     * The get_error method retrieves a pointer to an IWMPError interface.
     * @returns {IWMPError} Pointer to a pointer to an <b>IWMPError</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_error
     */
    get_error() {
        result := ComCall(26, this, "ptr*", &ppError := 0, "HRESULT")
        return IWMPError(ppError)
    }

    /**
     * The get_status method retrieves the status of Windows Media Player.
     * @remarks
     * The values returned by this method are subject to change at any time, and should be used for display purposes only.
     * 
     * The <b>IWMPEvents::StatusChange</b> event is fired whenever this property changes value.
     * @param {Pointer<BSTR>} pbstrStatus Pointer to a <b>BSTR</b> containing the status.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_status
     */
    get_status(pbstrStatus) {
        result := ComCall(27, this, "ptr", pbstrStatus, "HRESULT")
        return result
    }
}
