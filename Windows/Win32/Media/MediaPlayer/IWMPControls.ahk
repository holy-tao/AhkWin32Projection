#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPControls interface provides a way to manipulate the playback of a media item.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcontrols
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPControls extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPControls
     * @type {Guid}
     */
    static IID => Guid("{74c09e02-f828-11d2-a74b-00a0c905f36e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isAvailable", "play", "stop", "pause", "fastForward", "fastReverse", "get_currentPosition", "put_currentPosition", "get_currentPositionString", "next", "previous", "get_currentItem", "put_currentItem", "get_currentMarker", "put_currentMarker", "playItem"]

    /**
     */
    currentPosition {
        get => this.get_currentPosition()
        set => this.put_currentPosition(value)
    }

    /**
     */
    currentPositionString {
        get => this.get_currentPositionString()
    }

    /**
     * @type {IWMPMedia} 
     */
    currentItem {
        get => this.get_currentItem()
        set => this.put_currentItem(value)
    }

    /**
     */
    currentMarker {
        get => this.get_currentMarker()
        set => this.put_currentMarker(value)
    }

    /**
     * The get_isAvailable method indicates whether a specified type of information is available or a specified action can be performed.
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable Pointer to a <b>VARIANT_BOOL</b> indicating whether a specified type of information is available or a specified action can be performed.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * The play method causes the current media item to start playing, or resumes play of a paused item.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-play
     */
    play() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The stop method stops playback of the media item.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-stop
     */
    stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The pause method pauses playback of the media item.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-pause
     */
    pause() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The fastForward method starts fast play of the media item in the forward direction.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-fastforward
     */
    fastForward() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The fastReverse method starts fast play of the media item in the reverse direction.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-fastreverse
     */
    fastReverse() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The get_currentPosition method retrieves the current position in the media item in seconds from the beginning.
     * @param {Pointer<Float>} pdCurrentPosition Pointer to a <b>double</b> containing the current position.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-get_currentposition
     */
    get_currentPosition(pdCurrentPosition) {
        pdCurrentPositionMarshal := pdCurrentPosition is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pdCurrentPositionMarshal, pdCurrentPosition, "HRESULT")
        return result
    }

    /**
     * The put_currentPosition method specifies the current position in the media item in seconds from the beginning.
     * @param {Float} dCurrentPosition <b>double</b> containing the current position.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-put_currentposition
     */
    put_currentPosition(dCurrentPosition) {
        result := ComCall(14, this, "double", dCurrentPosition, "HRESULT")
        return result
    }

    /**
     * The get_currentPositionString method retrieves the current position in the media item as a BSTR formatted as HH:MM:SS (hours, minutes, and seconds).
     * @param {Pointer<BSTR>} pbstrCurrentPosition Pointer to a <b>BSTR</b> containing the current position.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-get_currentpositionstring
     */
    get_currentPositionString(pbstrCurrentPosition) {
        result := ComCall(15, this, "ptr", pbstrCurrentPosition, "HRESULT")
        return result
    }

    /**
     * The next method sets the next item in the playlist as the current item.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-next
     */
    next() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The previous method sets the previous item in the playlist as the current item.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-previous
     */
    previous() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * The get_currentItem method retrieves the current media item in a playlist.
     * @returns {IWMPMedia} Pointer to a pointer to an <b>IWMPMedia</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-get_currentitem
     */
    get_currentItem() {
        result := ComCall(18, this, "ptr*", &ppIWMPMedia := 0, "HRESULT")
        return IWMPMedia(ppIWMPMedia)
    }

    /**
     * The put_currentItem method specifies the current media item.
     * @param {IWMPMedia} pIWMPMedia Pointer to an <b>IWMPMedia</b> interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-put_currentitem
     */
    put_currentItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The get_currentMarker method retrieves the current marker number.
     * @param {Pointer<Integer>} plMarker Pointer to a <b>long</b> containing the marker.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-get_currentmarker
     */
    get_currentMarker(plMarker) {
        plMarkerMarshal := plMarker is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, plMarkerMarshal, plMarker, "HRESULT")
        return result
    }

    /**
     * The put_currentMarker method specifies the current marker number.
     * @param {Integer} lMarker <b>long</b> containing the marker.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-put_currentmarker
     */
    put_currentMarker(lMarker) {
        result := ComCall(21, this, "int", lMarker, "HRESULT")
        return result
    }

    /**
     * The playItem method plays the specified media item.
     * @param {IWMPMedia} pIWMPMedia Pointer to an <b>IWMPMedia</b> interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols-playitem
     */
    playItem(pIWMPMedia) {
        result := ComCall(22, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }
}
