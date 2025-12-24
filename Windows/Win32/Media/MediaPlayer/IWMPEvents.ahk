#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPEvents interface provides events that originate from the Windows Media Player control. An embedding program can respond to these events. The events exposed by IWMPEvents are also exposed by the _WMPOCXEvents interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpevents
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPEvents
     * @type {Guid}
     */
    static IID => Guid("{19a6627b-da9e-47c1-bb23-00b5e668236a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenStateChange", "PlayStateChange", "AudioLanguageChange", "StatusChange", "ScriptCommand", "NewStream", "Disconnect", "Buffering", "Error", "Warning", "EndOfStream", "PositionChange", "MarkerHit", "DurationUnitChange", "CdromMediaChange", "PlaylistChange", "CurrentPlaylistChange", "CurrentPlaylistItemAvailable", "MediaChange", "CurrentMediaItemAvailable", "CurrentItemChange", "MediaCollectionChange", "MediaCollectionAttributeStringAdded", "MediaCollectionAttributeStringRemoved", "MediaCollectionAttributeStringChanged", "PlaylistCollectionChange", "PlaylistCollectionPlaylistAdded", "PlaylistCollectionPlaylistRemoved", "PlaylistCollectionPlaylistSetAsDeleted", "ModeChange", "MediaError", "OpenPlaylistSwitch", "DomainChange", "SwitchedToPlayerApplication", "SwitchedToControl", "PlayerDockedStateChange", "PlayerReconnect", "Click", "DoubleClick", "KeyDown", "KeyPress", "KeyUp", "MouseDown", "MouseMove", "MouseUp"]

    /**
     * The OpenStateChange event occurs when the Windows Media Player control changes state.
     * @remarks
     * 
     * Windows Media Player can go through several open states while it attempts to open a file over a network, such as locating the server, connecting to the server, and opening the file. This event will be fired each time the open state changes.
     * 
     * Windows Media Player states are not guaranteed to occur in any particular order. Furthermore, not every state necessarily occurs during a sequence of events. You should not write code that relies upon state order.
     * 
     * 
     * @param {Integer} NewState Specifies the new open state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-openstatechange
     */
    OpenStateChange(NewState) {
        ComCall(3, this, "int", NewState)
    }

    /**
     * The PlayStateChange event occurs when the play state of the Windows Media Player control changes.
     * @remarks
     * 
     * Windows Media Player states are not guaranteed to occur in any particular order. Furthermore, not every state necessarily occurs during a sequence of events. You should not write code that relies upon state order.
     * 
     * 
     * @param {Integer} NewState Specifies the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playstatechange
     */
    PlayStateChange(NewState) {
        ComCall(4, this, "int", NewState)
    }

    /**
     * The AudioLanguageChange event occurs when the current audio language changes.
     * @remarks
     * 
     * A <i>LangID</i> uniquely identifies a particular language dialect, called a locale.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} LangID Specifies the new language identifier.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-audiolanguagechange
     */
    AudioLanguageChange(LangID) {
        ComCall(5, this, "int", LangID)
    }

    /**
     * The StatusChange event occurs when the status property changes value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-statuschange
     */
    StatusChange() {
        ComCall(6, this)
    }

    /**
     * The ScriptCommand event occurs when a synchronized command or URL is received.
     * @remarks
     * 
     * Commands can be embedded along with the audio, video, or other data within a Windows Media file. The commands are comprised of a pair of Unicode strings associated with a designated time in the stream.
     * 
     * When playback reaches the time associated with the command, the Windows Media Player control sends a <b>ScriptCommand</b> event with two parameters. One parameter specifies the type of command being sent. The other parameter specifies the command. The type of parameter is used to determine how the command parameter is processed. Any type of command can be embedded in a Windows Media file to be handled by the <b>ScriptCommand</b> event.
     * 
     * The following table lists script command types that are processed automatically by Windows Media Player.
     * 
     * <table>
     * <tr>
     * <th>Type
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>CAPTION</td>
     * <td>The control displays the associated text in the DIV specified by <b>IWMPClosedCaption::get_captioningID</b>.</td>
     * </tr>
     * <tr>
     * <td>EVENT</td>
     * <td>Tells the control to execute instructions defined for the specified event.</td>
     * </tr>
     * <tr>
     * <td>FILENAME</td>
     * <td>The control resets its <b>URL</b> property, attempts to open the specified file, and begins playing the new stream immediately.</td>
     * </tr>
     * <tr>
     * <td>OPENEVENT</td>
     * <td>Buffers the associated EVENT command for timely execution of the EVENT script.</td>
     * </tr>
     * <tr>
     * <td>SYNCHRONIZEDLYRICLYRIC</td>
     * <td>The <i>Param</i> parameter contains the synchronized lyric text. Windows Media Player displays the lyric text in the closed caption area of the <b>Now Playing</b> feature.</td>
     * </tr>
     * <tr>
     * <td>TEXT</td>
     * <td>The control displays the associated text in the DIV specified by <b>IWMPClosedCaption::get_captioningID</b>.</td>
     * </tr>
     * <tr>
     * <td>URL</td>
     * <td>The control automatically opens the URL specified using the default Internet browser if the <b>IWMPSettings::put_invokeURLs</b> method has been called.</td>
     * </tr>
     * </table>
     *  
     * 
     * You can embed any other type of command as long as you provide reciprocal code to handle the command. Unknown commands are ignored by the Windows Media Player control, but they are still handed off to the <b>ScriptCommand</b> event.
     * 
     * The <b>ScriptCommand</b> event is not called if the file is being scanned in fast forward or fast reversed mode.
     * 
     * The value of event parameters is specified by Windows Media Player. It can be accessed or passed to a method in an imported JScript file by using the parameter name. This parameter name must be typed exactly as shown, including capitalization.
     * 
     * URL commands received by the Windows Media Player control are invoked automatically in the user's default Web browser if the <b>IWMPSettings::put_baseURL</b> method has been called. You can use the <b>IWMPSettings::put_defaultFrame</b> property to specify the target frame in which the webpage appears.
     * 
     * The URL sent to Windows Media Player is processed relative to the base URL specified by the <b>IWMPSettings::get_invokeURLs</b> method. The base URL is concatenated with the relatively specified URL, resulting in a fully specified URL that is passed as the command parameter by the <b>ScriptCommand</b> event.
     * 
     * The Windows Media Player control always processes incoming URL commands in the following manner:
     * 
     * <ol>
     * <li>A URL command is received.</li>
     * <li><b>IWMPSettings::put_baseURL</b> is used to create a full URL from the relative URL specified in the script command.</li>
     * <li><b>ScriptCommand</b> is called.</li>
     * <li>After <b>ScriptCommand</b> returns, <b>IWMPSettings::get_invokeURLs</b> is checked.</li>
     * <li>If <b>IWMPSettings::get_invokeURLs</b> is true and the command is a URL command, the specified URL is invoked. If <b>IWMPSettings::get_invokeURLs</b> is false or the command is not a URL command, the command is ignored.</li>
     * </ol>
     * When authoring a Windows Media file, you can specify which frame the new URL is displayed in by concatenating two ampersand (&amp;) characters and the name of the frame in the parameter field. The following example specifies that the URL http://myweb/mypage.html must be launched in the frame called myframe.
     * 
     * 
     * ```cpp
     * 
     * scType = "URL"
     * Param = http://myweb/mypage.html&&myframe
     * 
     * 
     * ```
     * 
     * 
     * @param {BSTR} scType Specifies the type of script command.
     * @param {BSTR} Param Specifies the script command.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-scriptcommand
     */
    ScriptCommand(scType, Param) {
        scType := scType is String ? BSTR.Alloc(scType).Value : scType
        Param := Param is String ? BSTR.Alloc(Param).Value : Param

        ComCall(7, this, "ptr", scType, "ptr", Param)
    }

    /**
     * The NewStream event is reserved for future use.
     * @remarks
     * 
     * This event is reserved for future use.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-newstream
     */
    NewStream() {
        ComCall(8, this)
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * 
     * This event is reserved for future use.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} Result Not supported.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-disconnect
     */
    Disconnect(Result) {
        ComCall(9, this, "int", Result)
    }

    /**
     * The Buffering event occurs when the Windows Media Player control begins or ends buffering.
     * @remarks
     * 
     * Use this event to determine when buffering or downloading starts or stops. You can use the same event block for both cases and test <b>IWMPNetwork::get_bufferingProgress</b> and <b>IWMPNetwork::get_downloadProgress</b> to determine whether Windows Media Player is currently buffering or downloading content.
     * 
     * 
     * @param {VARIANT_BOOL} Start Specifies whether buffering has begun or ended. A value of true indicates that it has begun; a value of false indicates that it has ended.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-buffering
     */
    Buffering(Start) {
        ComCall(10, this, "short", Start)
    }

    /**
     * The Error event occurs when the Windows Media Player control has an error condition..
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-error
     */
    Error() {
        ComCall(11, this)
    }

    /**
     * The Warning event is reserved for future use.
     * @remarks
     * 
     * This event is reserved for future use.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} WarningType Not supported.
     * @param {Integer} Param Not supported.
     * @param {BSTR} Description Not supported.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-warning
     */
    Warning(WarningType, Param, Description) {
        Description := Description is String ? BSTR.Alloc(Description).Value : Description

        ComCall(12, this, "int", WarningType, "int", Param, "ptr", Description)
    }

    /**
     * The EndOfStream event is reserved for future use.
     * @remarks
     * 
     * This event is reserved for future use.
     * 
     * 
     * @param {Integer} Result Not supported.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-endofstream
     */
    EndOfStream(Result) {
        ComCall(13, this, "int", Result)
    }

    /**
     * The PositionChange event occurs when the current playback position within the media item has been changed.
     * @remarks
     * 
     * This event is not raised routinely during playback. It only occurs when something actively changes the current playback position within the playing media item, such as the user moving the seek handle or code specifying a value for <b>IWMPControls::currentPosition</b>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Float} oldPosition Specifies the original position.
     * @param {Float} newPosition Specifies the new position.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-positionchange
     */
    PositionChange(oldPosition, newPosition) {
        ComCall(14, this, "double", oldPosition, "double", newPosition)
    }

    /**
     * The MarkerHit event occurs when a marker is reached.
     * @param {Integer} MarkerNum Specifies the number of the marker that was hit.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-markerhit
     */
    MarkerHit(MarkerNum) {
        ComCall(15, this, "int", MarkerNum)
    }

    /**
     * The DurationUnitChange event is reserved for future use.
     * @remarks
     * 
     * This event is reserved for future use.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} NewDurationUnit Not supported.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-durationunitchange
     */
    DurationUnitChange(NewDurationUnit) {
        ComCall(16, this, "int", NewDurationUnit)
    }

    /**
     * The CdromMediaChange event occurs when a CD or DVD is inserted into or ejected from a CD or DVD drive.
     * @remarks
     * 
     * The index of the CD drive corresponds to the index of a <b>Cdrom</b> object in the <b>IWMPCdromCollection</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} CdromNum Specifies the index of the CD or DVD drive.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-cdrommediachange
     */
    CdromMediaChange(CdromNum) {
        ComCall(17, this, "int", CdromNum)
    }

    /**
     * The PlaylistChange event occurs when a playlist changes.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IDispatch} Playlist Pointer to an <b>IDispatch</b> interface for the playlist that changed.
     * @param {Integer} change A <b>WMPPlaylistChangeEventType</b> enumeration value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playlistchange
     */
    PlaylistChange(Playlist, change) {
        ComCall(18, this, "ptr", Playlist, "int", change)
    }

    /**
     * The CurrentPlaylistChange event occurs when something changes within the current playlist.
     * @remarks
     * 
     * This event does not occur when a different playlist becomes the current playlist. It only occurs when a change happens within the current playlist, such as a media item being appended to the playlist.
     * 
     * 
     * @param {Integer} change Specifies what type of change occurred to the playlist. See the <b>PlaylistChange</b> event for a table of possible values.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-currentplaylistchange
     */
    CurrentPlaylistChange(change) {
        ComCall(19, this, "int", change)
    }

    /**
     * The CurrentPlaylistItemAvailable event occurs when the current playlist item becomes available.
     * @remarks
     * 
     * The name of the current playlist can be used to retrieve the corresponding <b>Playlist</b> object by using the <b>IWMPPlaylistCollection::getByName</b> method.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrItemName Specifies the item name.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-currentplaylistitemavailable
     */
    CurrentPlaylistItemAvailable(bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        ComCall(20, this, "ptr", bstrItemName)
    }

    /**
     * The MediaChange event occurs when a media item changes.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IDispatch} Item Pointer to an <b>IDispatch</b> interface that identifies the item that changed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mediachange
     */
    MediaChange(Item) {
        ComCall(21, this, "ptr", Item)
    }

    /**
     * The CurrentMediaItemAvailable event occurs when the current media item becomes available.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrItemName Specifies the item name.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-currentmediaitemavailable
     */
    CurrentMediaItemAvailable(bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        ComCall(22, this, "ptr", bstrItemName)
    }

    /**
     * The CurrentItemChange event occurs when the user or the IWMPControls::put_CurrentItem method changes the current item value.
     * @param {IDispatch} pdispMedia Pointer to an <b>IDispatch</b> interface that identifies the new current item.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-currentitemchange
     */
    CurrentItemChange(pdispMedia) {
        ComCall(23, this, "ptr", pdispMedia)
    }

    /**
     * The MediaCollectionChange event occurs when the media collection changes.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mediacollectionchange
     */
    MediaCollectionChange() {
        ComCall(24, this)
    }

    /**
     * The MediaCollectionAttributeStringAdded event occurs when an attribute is added to the library.
     * @remarks
     * 
     * When a media item is added to the library, its metadata is added to the <b>MediaCollection</b> object and this event is fired for each attribute added.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrAttribName Specifies the attribute name. For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
     * @param {BSTR} bstrAttribVal Specifies the attribute value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mediacollectionattributestringadded
     */
    MediaCollectionAttributeStringAdded(bstrAttribName, bstrAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrAttribVal := bstrAttribVal is String ? BSTR.Alloc(bstrAttribVal).Value : bstrAttribVal

        ComCall(25, this, "ptr", bstrAttribName, "ptr", bstrAttribVal)
    }

    /**
     * The MediaCollectionAttributeStringRemoved event occurs when an attribute is removed from the library.
     * @remarks
     * 
     * When a media item is removed from the library, its metadata is removed from the <b>MediaCollection</b> object and this event is fired for each attribute that is removed.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrAttribName Specifies the name of the attribute. For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
     * @param {BSTR} bstrAttribVal Specifies the value of the attribute.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mediacollectionattributestringremoved
     */
    MediaCollectionAttributeStringRemoved(bstrAttribName, bstrAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrAttribVal := bstrAttribVal is String ? BSTR.Alloc(bstrAttribVal).Value : bstrAttribVal

        ComCall(26, this, "ptr", bstrAttribName, "ptr", bstrAttribVal)
    }

    /**
     * The MediaCollectionAttributeStringChanged event occurs when an attribute value in the library is changed.
     * @remarks
     * 
     * When a user modifies library metadata, the <b>MediaCollection</b> object is updated and this event fires for each attribute changed.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrAttribName Specifies the name of the attribute. For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
     * @param {BSTR} bstrOldAttribVal Specifies the original attribute value.
     * @param {BSTR} bstrNewAttribVal Specifies the new attribute value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mediacollectionattributestringchanged
     */
    MediaCollectionAttributeStringChanged(bstrAttribName, bstrOldAttribVal, bstrNewAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrOldAttribVal := bstrOldAttribVal is String ? BSTR.Alloc(bstrOldAttribVal).Value : bstrOldAttribVal
        bstrNewAttribVal := bstrNewAttribVal is String ? BSTR.Alloc(bstrNewAttribVal).Value : bstrNewAttribVal

        ComCall(27, this, "ptr", bstrAttribName, "ptr", bstrOldAttribVal, "ptr", bstrNewAttribVal)
    }

    /**
     * The PlaylistCollectionChange event occurs when something changes in the playlist collection.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playlistcollectionchange
     */
    PlaylistCollectionChange() {
        ComCall(28, this)
    }

    /**
     * The PlaylistCollectionPlaylistAdded event occurs when a playlist is added to the playlist collection.
     * @remarks
     * 
     * The name of the playlist that was added can be used to retrieve the corresponding <b>Playlist</b> object by using the <b>IWMPPlaylistCollection::getByName</b> method.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrPlaylistName Specifies the name of the playlist that was added.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playlistcollectionplaylistadded
     */
    PlaylistCollectionPlaylistAdded(bstrPlaylistName) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(29, this, "ptr", bstrPlaylistName)
    }

    /**
     * The PlaylistCollectionPlaylistRemoved event occurs when a playlist is removed from the playlist collection.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrPlaylistName Specifies the name of the playlist that was removed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playlistcollectionplaylistremoved
     */
    PlaylistCollectionPlaylistRemoved(bstrPlaylistName) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(30, this, "ptr", bstrPlaylistName)
    }

    /**
     * The PlaylistCollectionPlaylistSetAsDeleted event is reserved for future use.
     * @remarks
     * 
     * This event is reserved for future use.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {BSTR} bstrPlaylistName Not supported.
     * @param {VARIANT_BOOL} varfIsDeleted Not supported.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playlistcollectionplaylistsetasdeleted
     */
    PlaylistCollectionPlaylistSetAsDeleted(bstrPlaylistName, varfIsDeleted) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(31, this, "ptr", bstrPlaylistName, "short", varfIsDeleted)
    }

    /**
     * The ModeChange event occurs when a mode of the player is changed.
     * @param {BSTR} ModeName 
     * @param {VARIANT_BOOL} NewValue Indicates the new state of the specified mode.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-modechange
     */
    ModeChange(ModeName, NewValue) {
        ModeName := ModeName is String ? BSTR.Alloc(ModeName).Value : ModeName

        ComCall(32, this, "ptr", ModeName, "short", NewValue)
    }

    /**
     * The MediaError event occurs when the Media object has an error condition.
     * @param {IDispatch} pMediaObject Pointer to an <b>IDispatch</b> interface for the object that has an error condition.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mediaerror
     */
    MediaError(pMediaObject) {
        ComCall(33, this, "ptr", pMediaObject)
    }

    /**
     * The OpenPlaylistSwitch event occurs when a title on a DVD begins playing.
     * @param {IDispatch} pItem Pointer to an <b>IDispatch</b> interface for the given playlist.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-openplaylistswitch
     */
    OpenPlaylistSwitch(pItem) {
        ComCall(34, this, "ptr", pItem)
    }

    /**
     * The DomainChange event occurs when the DVD domain changes.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * Windows XP or later.
     * 
     * 
     * @param {BSTR} strDomain 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-domainchange
     */
    DomainChange(strDomain) {
        strDomain := strDomain is String ? BSTR.Alloc(strDomain).Value : strDomain

        ComCall(35, this, "ptr", strDomain)
    }

    /**
     * The SwitchedToPlayerApplication event occurs when a remoted Windows Media Player control switches to the full mode of the Player.
     * @remarks
     * 
     * This event occurs only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-switchedtoplayerapplication
     */
    SwitchedToPlayerApplication() {
        ComCall(36, this)
    }

    /**
     * The SwitchedToControl event occurs when a remoted Windows Media Player control switches to the docked state.
     * @remarks
     * 
     * This event occurs only when remoting the Windows Media Player control, and only occurs for the Player control instance being switched to.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-switchedtocontrol
     */
    SwitchedToControl() {
        ComCall(37, this)
    }

    /**
     * The PlayerDockedStateChange event occurs when a remoted Windows Media Player control docks or undocks.
     * @remarks
     * 
     * This event occurs only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playerdockedstatechange
     */
    PlayerDockedStateChange() {
        ComCall(38, this)
    }

    /**
     * The PlayerReconnect event occurs when a remoted Windows Media Player control reconnects to the Player.
     * @remarks
     * 
     * This event occurs only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-playerreconnect
     */
    PlayerReconnect() {
        ComCall(39, this)
    }

    /**
     * The Click event occurs when the user clicks a mouse button.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nButton A bitfield with bits corresponding to the left button (bit 0), right button (bit 1), and middle button (bit 2). These bits correspond to the values 1, 2, and 4, respectively. Only one of the bits is set, indicating the button that caused the event.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed..
     * @param {Integer} fX The <i>x</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @param {Integer} fY The <i>y</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-click
     */
    Click(nButton, nShiftState, fX, fY) {
        ComCall(40, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * The DoubleClick event occurs when the user double-clicks a mouse button.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nButton A bitfield with bits corresponding to the left button (bit 0), right button (bit 1), and middle button (bit 2). These bits correspond to the values 1, 2, and 4, respectively. Only one of the bits is set, indicating the button that caused the event.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed.
     * @param {Integer} fX The x coordinate of the mouse pointer relative to the upper left-hand corner of the control.
     * @param {Integer} fY The y coordinate of the mouse pointer relative to the upper left-hand corner of the control.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-doubleclick
     */
    DoubleClick(nButton, nShiftState, fX, fY) {
        ComCall(41, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * The KeyDown event occurs when a key is pressed.
     * @remarks
     * 
     * The <i>nKeyCode</i> argument specifies a physical key. The following tables show the possible values for the major keys on a standard keyboard.
     * 
     * Values for the main keys.
     * 
     * <table>
     * <tr>
     * <th>Key
     *             </th>
     * <th>Value
     *             </th>
     * </tr>
     * <tr>
     * <td>A-Z</td>
     * <td>65-90</td>
     * </tr>
     * <tr>
     * <td>0-9</td>
     * <td>48-56</td>
     * </tr>
     * <tr>
     * <td>F1-F12</td>
     * <td>112-123</td>
     * </tr>
     * <tr>
     * <td>ESC</td>
     * <td>27</td>
     * </tr>
     * <tr>
     * <td>TAB</td>
     * <td>9</td>
     * </tr>
     * <tr>
     * <td>CAPS LOCK</td>
     * <td>20</td>
     * </tr>
     * <tr>
     * <td>SHIFT (left or right)</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>CTRL (left or right)</td>
     * <td>17</td>
     * </tr>
     * <tr>
     * <td>ALT (left or right)</td>
     * <td>18</td>
     * </tr>
     * <tr>
     * <td>SPACE</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>BACKSPACE</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>ENTER</td>
     * <td>13</td>
     * </tr>
     * <tr>
     * <td>Windows logo key, left</td>
     * <td>91</td>
     * </tr>
     * <tr>
     * <td>Windows logo key, right</td>
     * <td>92</td>
     * </tr>
     * <tr>
     * <td>Application key</td>
     * <td>93</td>
     * </tr>
     * </table>
     *  
     * 
     * Values for the number pad keys.
     * 
     * <table>
     * <tr>
     * <th>Key
     *             </th>
     * <th>Value
     *             </th>
     * </tr>
     * <tr>
     * <td>0-9</td>
     * <td>96-105</td>
     * </tr>
     * <tr>
     * <td>NUM LOCK</td>
     * <td>144</td>
     * </tr>
     * <tr>
     * <td>DIVIDE (/)</td>
     * <td>111</td>
     * </tr>
     * <tr>
     * <td>MULTIPLY (*)</td>
     * <td>106</td>
     * </tr>
     * <tr>
     * <td>SUBTRACT (-)</td>
     * <td>109</td>
     * </tr>
     * <tr>
     * <td>ADD (+)</td>
     * <td>107</td>
     * </tr>
     * <tr>
     * <td>SEPARATOR (Enter)</td>
     * <td>108</td>
     * </tr>
     * <tr>
     * <td>DECIMAL (.)</td>
     * <td>110</td>
     * </tr>
     * </table>
     *  
     * 
     * Values for the navigation keys.
     * 
     * <table>
     * <tr>
     * <th>Key
     *             </th>
     * <th>Value
     *             </th>
     * </tr>
     * <tr>
     * <td>INSERT</td>
     * <td>45</td>
     * </tr>
     * <tr>
     * <td>DELETE</td>
     * <td>46</td>
     * </tr>
     * <tr>
     * <td>HOME</td>
     * <td>36</td>
     * </tr>
     * <tr>
     * <td>END</td>
     * <td>35</td>
     * </tr>
     * <tr>
     * <td>PAGE UP</td>
     * <td>33</td>
     * </tr>
     * <tr>
     * <td>PAGE DOWN</td>
     * <td>34</td>
     * </tr>
     * <tr>
     * <td>UP ARROW</td>
     * <td>38</td>
     * </tr>
     * <tr>
     * <td>DOWN ARROW</td>
     * <td>40</td>
     * </tr>
     * <tr>
     * <td>LEFT ARROW</td>
     * <td>37</td>
     * </tr>
     * <tr>
     * <td>RIGHT ARROW</td>
     * <td>39</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nKeyCode Specifies which physical key is pressed. For possible values, see the Remarks section.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-keydown
     */
    KeyDown(nKeyCode, nShiftState) {
        ComCall(42, this, "short", nKeyCode, "short", nShiftState)
    }

    /**
     * The KeyPress event occurs when a key is pressed and then released.
     * @remarks
     * 
     * This event occurs when the keystroke results in any printable keyboard character, the CTRL key combined with a character from the standard alphabet or one of a few special characters, and the ENTER or BACKSPACE key.
     * 
     * 
     * @param {Integer} nKeyAscii Specifies the standard numeric ANSI code for the character.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-keypress
     */
    KeyPress(nKeyAscii) {
        ComCall(43, this, "short", nKeyAscii)
    }

    /**
     * The KeyUp event occurs when a key is released.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nKeyCode Specifies which physical key is pressed. For possible values, see the Remarks section of the <b>KeyDown</b> event.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-keyup
     */
    KeyUp(nKeyCode, nShiftState) {
        ComCall(44, this, "short", nKeyCode, "short", nShiftState)
    }

    /**
     * The MouseDown event occurs when a mouse button is pressed.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nButton A bitfield with bits corresponding to the left button (bit 0), right button (bit 1), and middle button (bit 2). These bits correspond to the values 1, 2, and 4, respectively. Only one of the bits is set, indicating the button that caused the event.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed.
     * @param {Integer} fX The <i>x</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @param {Integer} fY The <i>y</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mousedown
     */
    MouseDown(nButton, nShiftState, fX, fY) {
        ComCall(45, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * The MouseMove event occurs when the mouse pointer is moved.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nButton A bitfield with bits corresponding to the left button (bit 0), right button (bit 1), and middle button (bit 2). These bits correspond to the values 1, 2, and 4, respectively. Some, all, or none of the bits can be set, indicating that some, all, or none of the buttons are pressed.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed.
     * @param {Integer} fX The <i>x</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @param {Integer} fY The <i>y</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mousemove
     */
    MouseMove(nButton, nShiftState, fX, fY) {
        ComCall(46, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * The MouseUp event occurs when a mouse button is released.
     * @remarks
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} nButton A bitfield with bits corresponding to the left button (bit 0), right button (bit 1), and middle button (bit 2). These bits correspond to the values 1, 2, and 4, respectively. Only one of the bits is set, indicating the button that caused the event.
     * @param {Integer} nShiftState A bitfield with the least significant bits corresponding to the SHIFT key (bit 0), the CTRL key (bit 1), and the ALT key (bit 2). These bits correspond to the values 1, 2, and 4, respectively. The shift argument indicates the state of these keys. Some, all, or none of the bits can be set, indicating that some, all, or none of the keys are pressed.
     * @param {Integer} fX The <i>x</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @param {Integer} fY The <i>y</i> coordinate of the mouse pointer relative to the upper-left corner of the control.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents-mouseup
     */
    MouseUp(nButton, nShiftState, fX, fY) {
        ComCall(47, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }
}
