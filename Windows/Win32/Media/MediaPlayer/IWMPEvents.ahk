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
     * 
     * @param {Integer} NewState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-openstatechange
     */
    OpenStateChange(NewState) {
        ComCall(3, this, "int", NewState)
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playstatechange
     */
    PlayStateChange(NewState) {
        ComCall(4, this, "int", NewState)
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-audiolanguagechange
     */
    AudioLanguageChange(LangID) {
        ComCall(5, this, "int", LangID)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-statuschange
     */
    StatusChange() {
        ComCall(6, this)
    }

    /**
     * 
     * @param {BSTR} scType 
     * @param {BSTR} Param 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-scriptcommand
     */
    ScriptCommand(scType, Param) {
        scType := scType is String ? BSTR.Alloc(scType).Value : scType
        Param := Param is String ? BSTR.Alloc(Param).Value : Param

        ComCall(7, this, "ptr", scType, "ptr", Param)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-newstream
     */
    NewStream() {
        ComCall(8, this)
    }

    /**
     * 
     * @param {Integer} Result 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-disconnect
     */
    Disconnect(Result) {
        ComCall(9, this, "int", Result)
    }

    /**
     * 
     * @param {VARIANT_BOOL} Start 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-buffering
     */
    Buffering(Start) {
        ComCall(10, this, "short", Start)
    }

    /**
     * Indicates a significant problem.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error() {
        ComCall(11, this)
    }

    /**
     * Indicates a problem that is not immediately significant, but may cause future problems.
     * @param {Integer} WarningType 
     * @param {Integer} Param 
     * @param {BSTR} Description 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Warning(WarningType, Param, Description) {
        Description := Description is String ? BSTR.Alloc(Description).Value : Description

        ComCall(12, this, "int", WarningType, "int", Param, "ptr", Description)
    }

    /**
     * 
     * @param {Integer} Result 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-endofstream
     */
    EndOfStream(Result) {
        ComCall(13, this, "int", Result)
    }

    /**
     * 
     * @param {Float} oldPosition 
     * @param {Float} newPosition 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-positionchange
     */
    PositionChange(oldPosition, newPosition) {
        ComCall(14, this, "double", oldPosition, "double", newPosition)
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-markerhit
     */
    MarkerHit(MarkerNum) {
        ComCall(15, this, "int", MarkerNum)
    }

    /**
     * 
     * @param {Integer} NewDurationUnit 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-durationunitchange
     */
    DurationUnitChange(NewDurationUnit) {
        ComCall(16, this, "int", NewDurationUnit)
    }

    /**
     * 
     * @param {Integer} CdromNum 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-cdrommediachange
     */
    CdromMediaChange(CdromNum) {
        ComCall(17, this, "int", CdromNum)
    }

    /**
     * 
     * @param {IDispatch} Playlist 
     * @param {Integer} change 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playlistchange
     */
    PlaylistChange(Playlist, change) {
        ComCall(18, this, "ptr", Playlist, "int", change)
    }

    /**
     * 
     * @param {Integer} change 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-currentplaylistchange
     */
    CurrentPlaylistChange(change) {
        ComCall(19, this, "int", change)
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-currentplaylistitemavailable
     */
    CurrentPlaylistItemAvailable(bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        ComCall(20, this, "ptr", bstrItemName)
    }

    /**
     * 
     * @param {IDispatch} Item 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mediachange
     */
    MediaChange(Item) {
        ComCall(21, this, "ptr", Item)
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-currentmediaitemavailable
     */
    CurrentMediaItemAvailable(bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        ComCall(22, this, "ptr", bstrItemName)
    }

    /**
     * 
     * @param {IDispatch} pdispMedia 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-currentitemchange
     */
    CurrentItemChange(pdispMedia) {
        ComCall(23, this, "ptr", pdispMedia)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mediacollectionchange
     */
    MediaCollectionChange() {
        ComCall(24, this)
    }

    /**
     * 
     * @param {BSTR} bstrAttribName 
     * @param {BSTR} bstrAttribVal 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mediacollectionattributestringadded
     */
    MediaCollectionAttributeStringAdded(bstrAttribName, bstrAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrAttribVal := bstrAttribVal is String ? BSTR.Alloc(bstrAttribVal).Value : bstrAttribVal

        ComCall(25, this, "ptr", bstrAttribName, "ptr", bstrAttribVal)
    }

    /**
     * 
     * @param {BSTR} bstrAttribName 
     * @param {BSTR} bstrAttribVal 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mediacollectionattributestringremoved
     */
    MediaCollectionAttributeStringRemoved(bstrAttribName, bstrAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrAttribVal := bstrAttribVal is String ? BSTR.Alloc(bstrAttribVal).Value : bstrAttribVal

        ComCall(26, this, "ptr", bstrAttribName, "ptr", bstrAttribVal)
    }

    /**
     * 
     * @param {BSTR} bstrAttribName 
     * @param {BSTR} bstrOldAttribVal 
     * @param {BSTR} bstrNewAttribVal 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mediacollectionattributestringchanged
     */
    MediaCollectionAttributeStringChanged(bstrAttribName, bstrOldAttribVal, bstrNewAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrOldAttribVal := bstrOldAttribVal is String ? BSTR.Alloc(bstrOldAttribVal).Value : bstrOldAttribVal
        bstrNewAttribVal := bstrNewAttribVal is String ? BSTR.Alloc(bstrNewAttribVal).Value : bstrNewAttribVal

        ComCall(27, this, "ptr", bstrAttribName, "ptr", bstrOldAttribVal, "ptr", bstrNewAttribVal)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playlistcollectionchange
     */
    PlaylistCollectionChange() {
        ComCall(28, this)
    }

    /**
     * 
     * @param {BSTR} bstrPlaylistName 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playlistcollectionplaylistadded
     */
    PlaylistCollectionPlaylistAdded(bstrPlaylistName) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(29, this, "ptr", bstrPlaylistName)
    }

    /**
     * 
     * @param {BSTR} bstrPlaylistName 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playlistcollectionplaylistremoved
     */
    PlaylistCollectionPlaylistRemoved(bstrPlaylistName) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(30, this, "ptr", bstrPlaylistName)
    }

    /**
     * 
     * @param {BSTR} bstrPlaylistName 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playlistcollectionplaylistsetasdeleted
     */
    PlaylistCollectionPlaylistSetAsDeleted(bstrPlaylistName, varfIsDeleted) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(31, this, "ptr", bstrPlaylistName, "short", varfIsDeleted)
    }

    /**
     * 
     * @param {BSTR} ModeName 
     * @param {VARIANT_BOOL} NewValue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-modechange
     */
    ModeChange(ModeName, NewValue) {
        ModeName := ModeName is String ? BSTR.Alloc(ModeName).Value : ModeName

        ComCall(32, this, "ptr", ModeName, "short", NewValue)
    }

    /**
     * 
     * @param {IDispatch} pMediaObject 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mediaerror
     */
    MediaError(pMediaObject) {
        ComCall(33, this, "ptr", pMediaObject)
    }

    /**
     * 
     * @param {IDispatch} pItem 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-openplaylistswitch
     */
    OpenPlaylistSwitch(pItem) {
        ComCall(34, this, "ptr", pItem)
    }

    /**
     * 
     * @param {BSTR} strDomain 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-domainchange
     */
    DomainChange(strDomain) {
        strDomain := strDomain is String ? BSTR.Alloc(strDomain).Value : strDomain

        ComCall(35, this, "ptr", strDomain)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-switchedtoplayerapplication
     */
    SwitchedToPlayerApplication() {
        ComCall(36, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-switchedtocontrol
     */
    SwitchedToControl() {
        ComCall(37, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playerdockedstatechange
     */
    PlayerDockedStateChange() {
        ComCall(38, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-playerreconnect
     */
    PlayerReconnect() {
        ComCall(39, this)
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-click
     */
    Click(nButton, nShiftState, fX, fY) {
        ComCall(40, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-doubleclick
     */
    DoubleClick(nButton, nShiftState, fX, fY) {
        ComCall(41, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * 
     * @param {Integer} nKeyCode 
     * @param {Integer} nShiftState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-keydown
     */
    KeyDown(nKeyCode, nShiftState) {
        ComCall(42, this, "short", nKeyCode, "short", nShiftState)
    }

    /**
     * 
     * @param {Integer} nKeyAscii 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-keypress
     */
    KeyPress(nKeyAscii) {
        ComCall(43, this, "short", nKeyAscii)
    }

    /**
     * 
     * @param {Integer} nKeyCode 
     * @param {Integer} nShiftState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-keyup
     */
    KeyUp(nKeyCode, nShiftState) {
        ComCall(44, this, "short", nKeyCode, "short", nShiftState)
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mousedown
     */
    MouseDown(nButton, nShiftState, fX, fY) {
        ComCall(45, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mousemove
     */
    MouseMove(nButton, nShiftState, fX, fY) {
        ComCall(46, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents-mouseup
     */
    MouseUp(nButton, nShiftState, fX, fY) {
        ComCall(47, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
    }
}
