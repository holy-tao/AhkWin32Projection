#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPMedia.ahk" { IWMPMedia }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPControls interface provides a way to manipulate the playback of a media item.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcontrols
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPControls extends IDispatch {
    /**
     * The interface identifier for IWMPControls
     * @type {Guid}
     */
    static IID := Guid("{74c09e02-f828-11d2-a74b-00a0c905f36e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPControls interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_isAvailable           : IntPtr
        play                      : IntPtr
        stop                      : IntPtr
        pause                     : IntPtr
        fastForward               : IntPtr
        fastReverse               : IntPtr
        get_currentPosition       : IntPtr
        put_currentPosition       : IntPtr
        get_currentPositionString : IntPtr
        next                      : IntPtr
        previous                  : IntPtr
        get_currentItem           : IntPtr
        put_currentItem           : IntPtr
        get_currentMarker         : IntPtr
        put_currentMarker         : IntPtr
        playItem                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPControls.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
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
     * @type {Integer} 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, BSTR, bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * The play method causes the current media item to start playing, or resumes play of a paused item.
     * @remarks
     * If this method is called while fast-forwarding or rewinding, the rate of playback is set to 1.0.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-play
     */
    play() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The stop method stops playback of the media item.
     * @remarks
     * This method causes Windows Media Player to release any system resources it is using, such as the audio device. The current media item, however, is not released.
     * 
     * When Windows Media Player is stopped, the current playback point in the media item is reset to the beginning of the item. Subsequently calling <b>IWMPControls::play</b> will start playback from the beginning of the media item. To halt a play operation without changing the current position, use the <b>IWMPControls::pause</b> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-stop
     */
    stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The pause method pauses playback of the media item.
     * @remarks
     * When a file is paused, Windows Media Player does not give up any system resources, such as the audio device.
     * 
     * Certain media types cannot be paused, such as live streams. To determine whether a particular media type can be paused, call the <b>IWMPControls::get_isAvailable</b> method and pass in the <b>BSTR</b> value "pause".
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-pause
     */
    pause() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The fastForward method starts fast play of the media item in the forward direction.
     * @remarks
     * The <b>fastForward</b> method plays the clip back at five times the normal speed. Calling <b>fastForward</b> is equivalent to specifying 5.0 for the rate through the <b>IWMPSettings::put_rate</b> method. If the rate is subsequently changed, or if <b>IWMPControls::play</b> or <b>IWMPControls::stop</b> is called, Windows Media Player will cease fast forwarding.
     * 
     * The <b>fastForward</b> method does not work for live broadcasts and certain media types. To determine whether you can fast forward in a clip, call the <b>IWMPControls::get_isAvailable</b> method and pass in the <b>BSTR</b> value "FastForward".
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-fastforward
     */
    fastForward() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The fastReverse method starts fast play of the media item in the reverse direction.
     * @remarks
     * The <b>fastReverse</b> method scans the clip in reverse at five times the normal speed, displaying only the key frames if it is a video file. Calling <b>fastReverse</b> is equivalent to specifying -5.0 for the rate through the <b>IWMPSettings::put_rate</b> method. If the rate is subsequently changed, or if <b>IWMPControls::play</b> or <b>IWMPControls::stop</b> is called, Windows Media Player will cease fast reverse.
     * 
     * If the item is part of a playlist, <b>fastReverse</b> stops at the beginning of the current track. For instance, if track 3 is in <b>fastReverse</b>, when the beginning of track 3 is reached, Windows Media Player will not go to track 2. The play count is not incremented when calling <b>fastReverse</b>.
     * 
     * If you call <b>IWMPControls::fastForward</b> while <b>fastReverse</b> is running, <b>fastReverse</b> will be stopped and <b>IWMPControls::fastForward</b> will begin.
     * 
     * This method does not work for live broadcasts and certain digital media types. To determine whether you can use fast reverse in a clip, call the <b>IWMPControls::get_isAvailable</b> method and pass in the <b>BSTR</b> value "FastReverse".
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-fastreverse
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentposition
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-put_currentposition
     */
    put_currentPosition(dCurrentPosition) {
        result := ComCall(14, this, "double", dCurrentPosition, "HRESULT")
        return result
    }

    /**
     * The get_currentPositionString method retrieves the current position in the media item as a BSTR formatted as HH:MM:SS (hours, minutes, and seconds).
     * @remarks
     * If the media item is less than an hour long, the current position is formatted as MM:SS (minutes and seconds).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentpositionstring
     */
    get_currentPositionString(pbstrCurrentPosition) {
        result := ComCall(15, this, BSTR.Ptr, pbstrCurrentPosition, "HRESULT")
        return result
    }

    /**
     * The next method sets the next item in the playlist as the current item.
     * @remarks
     * If the playlist is on the last entry when <b>next</b> is invoked, the first entry in the playlist will become the current one.
     * 
     * For server-side playlists, this method skips to the next item in the server-side playlist, not the client playlist.
     * 
     * When playing a DVD, this method skips to the next logical chapter in the playback sequence, which may not be the next chapter in the playlist. When playing DVD stills, this method skips to the next still.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-next
     */
    next() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The previous method sets the previous item in the playlist as the current item.
     * @remarks
     * If the playlist is on the first entry when <b>previous</b> is invoked, the last entry in the playlist will become the current one.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-previous
     */
    previous() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * The get_currentItem method retrieves the current media item in a playlist.
     * @remarks
     * This method works only with items in the current playlist.
     * @returns {IWMPMedia} Pointer to a pointer to an <b>IWMPMedia</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentitem
     */
    get_currentItem() {
        result := ComCall(18, this, "ptr*", &ppIWMPMedia := 0, "HRESULT")
        return IWMPMedia(ppIWMPMedia)
    }

    /**
     * The put_currentItem method specifies the current media item.
     * @remarks
     * This method works only with items in the playlist. Calling <b>put_currentItem</b> with a reference to a saved media item is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-put_currentitem
     */
    put_currentItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * The get_currentMarker method retrieves the current marker number.
     * @remarks
     * The <b>get_currentMarker</b> method always retrieves a pointer to the current or last marker, which means the actual file position can be either at the current marker or before the next marker. Markers are numbered beginning at 1, so if a file has markers, you can change the current playback position to zero by calling <b>IWMPControls::put_currentMarker</b> to and specifying the marker as zero .
     * 
     * Until the current media item is set (using <b>IWMPCore::put_URL</b> or <b>IWMPCore::put_currentMedia</b>), <b>get_currentMarker</b> retrieves a marker that is zero.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentmarker
     */
    get_currentMarker(plMarker) {
        plMarkerMarshal := plMarker is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, plMarkerMarshal, plMarker, "HRESULT")
        return result
    }

    /**
     * The put_currentMarker method specifies the current marker number.
     * @remarks
     * Specifying a marker with the <b>put_currentMarker</b> method causes playback to start from that marker. Before attempting to specify a marker with <b>put_currentMarker</b>, determine whether a file has markers and how many it has by calling <b>IWMPMedia::get_markerCount</b>. If a file has no markers, specifying a marker to anything but zero by using <b>put_currentMarker</b> results in an error. Specifying a marker to a number higher than a number retrieved by using <b>IWMPMedia::get_markerCount</b> also results in an error.
     * 
     * Until the current media item is set (using <b>IWMPCore::put_URL</b> or <b>IWMPCore::put_currentMedia</b>), <b>get_currentMarker</b> retrieves a marker that is zero.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-put_currentmarker
     */
    put_currentMarker(lMarker) {
        result := ComCall(21, this, "int", lMarker, "HRESULT")
        return result
    }

    /**
     * The playItem method plays the specified media item.
     * @remarks
     * The media item will load and play automatically, regardless of the value retrieved by the <b>IWMPSettings::get_autoStart</b> method. To load an item without playing it automatically, pass in a <b>VARIANT_BOOL</b> set to <b>FALSE</b> in the <b>IWMPSettings::put_autoStart</b> method and specify a URL in <b>IWMPCore::put_URL</b>, after which <b>IWMPControls::play</b> can be called to start playing the item.
     * 
     * Note
     *         
     * 
     * <b>playItem</b> works only with items retrieved from <b>IWMPCore::get_currentPlaylist</b>. Calling <b>playItem</b> with a reference to a saved media item is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-playitem
     */
    playItem(pIWMPMedia) {
        result := ComCall(22, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPControls.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_isAvailable := CallbackCreate(GetMethod(implObj, "get_isAvailable"), flags, 3)
        this.vtbl.play := CallbackCreate(GetMethod(implObj, "play"), flags, 1)
        this.vtbl.stop := CallbackCreate(GetMethod(implObj, "stop"), flags, 1)
        this.vtbl.pause := CallbackCreate(GetMethod(implObj, "pause"), flags, 1)
        this.vtbl.fastForward := CallbackCreate(GetMethod(implObj, "fastForward"), flags, 1)
        this.vtbl.fastReverse := CallbackCreate(GetMethod(implObj, "fastReverse"), flags, 1)
        this.vtbl.get_currentPosition := CallbackCreate(GetMethod(implObj, "get_currentPosition"), flags, 2)
        this.vtbl.put_currentPosition := CallbackCreate(GetMethod(implObj, "put_currentPosition"), flags, 2)
        this.vtbl.get_currentPositionString := CallbackCreate(GetMethod(implObj, "get_currentPositionString"), flags, 2)
        this.vtbl.next := CallbackCreate(GetMethod(implObj, "next"), flags, 1)
        this.vtbl.previous := CallbackCreate(GetMethod(implObj, "previous"), flags, 1)
        this.vtbl.get_currentItem := CallbackCreate(GetMethod(implObj, "get_currentItem"), flags, 2)
        this.vtbl.put_currentItem := CallbackCreate(GetMethod(implObj, "put_currentItem"), flags, 2)
        this.vtbl.get_currentMarker := CallbackCreate(GetMethod(implObj, "get_currentMarker"), flags, 2)
        this.vtbl.put_currentMarker := CallbackCreate(GetMethod(implObj, "put_currentMarker"), flags, 2)
        this.vtbl.playItem := CallbackCreate(GetMethod(implObj, "playItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_isAvailable)
        CallbackFree(this.vtbl.play)
        CallbackFree(this.vtbl.stop)
        CallbackFree(this.vtbl.pause)
        CallbackFree(this.vtbl.fastForward)
        CallbackFree(this.vtbl.fastReverse)
        CallbackFree(this.vtbl.get_currentPosition)
        CallbackFree(this.vtbl.put_currentPosition)
        CallbackFree(this.vtbl.get_currentPositionString)
        CallbackFree(this.vtbl.next)
        CallbackFree(this.vtbl.previous)
        CallbackFree(this.vtbl.get_currentItem)
        CallbackFree(this.vtbl.put_currentItem)
        CallbackFree(this.vtbl.get_currentMarker)
        CallbackFree(this.vtbl.put_currentMarker)
        CallbackFree(this.vtbl.playItem)
    }
}
