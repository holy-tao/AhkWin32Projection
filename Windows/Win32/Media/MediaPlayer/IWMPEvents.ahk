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
     * 
     * @param {Integer} NewState 
     * @returns {String} Nothing - always returns an empty string
     */
    OpenStateChange(NewState) {
        ComCall(3, this, "int", NewState)
        return result
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {String} Nothing - always returns an empty string
     */
    PlayStateChange(NewState) {
        ComCall(4, this, "int", NewState)
        return result
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {String} Nothing - always returns an empty string
     */
    AudioLanguageChange(LangID) {
        ComCall(5, this, "int", LangID)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    StatusChange() {
        ComCall(6, this)
        return result
    }

    /**
     * 
     * @param {BSTR} scType 
     * @param {BSTR} Param 
     * @returns {String} Nothing - always returns an empty string
     */
    ScriptCommand(scType, Param) {
        scType := scType is String ? BSTR.Alloc(scType).Value : scType
        Param := Param is String ? BSTR.Alloc(Param).Value : Param

        ComCall(7, this, "ptr", scType, "ptr", Param)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    NewStream() {
        ComCall(8, this)
        return result
    }

    /**
     * 
     * @param {Integer} Result 
     * @returns {String} Nothing - always returns an empty string
     */
    Disconnect(Result) {
        ComCall(9, this, "int", Result)
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Start 
     * @returns {String} Nothing - always returns an empty string
     */
    Buffering(Start) {
        ComCall(10, this, "short", Start)
        return result
    }

    /**
     * Indicates a significant problem.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error() {
        ComCall(11, this)
        return result
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
        return result
    }

    /**
     * 
     * @param {Integer} Result 
     * @returns {String} Nothing - always returns an empty string
     */
    EndOfStream(Result) {
        ComCall(13, this, "int", Result)
        return result
    }

    /**
     * 
     * @param {Float} oldPosition 
     * @param {Float} newPosition 
     * @returns {String} Nothing - always returns an empty string
     */
    PositionChange(oldPosition, newPosition) {
        ComCall(14, this, "double", oldPosition, "double", newPosition)
        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @returns {String} Nothing - always returns an empty string
     */
    MarkerHit(MarkerNum) {
        ComCall(15, this, "int", MarkerNum)
        return result
    }

    /**
     * 
     * @param {Integer} NewDurationUnit 
     * @returns {String} Nothing - always returns an empty string
     */
    DurationUnitChange(NewDurationUnit) {
        ComCall(16, this, "int", NewDurationUnit)
        return result
    }

    /**
     * 
     * @param {Integer} CdromNum 
     * @returns {String} Nothing - always returns an empty string
     */
    CdromMediaChange(CdromNum) {
        ComCall(17, this, "int", CdromNum)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} Playlist 
     * @param {Integer} change 
     * @returns {String} Nothing - always returns an empty string
     */
    PlaylistChange(Playlist, change) {
        ComCall(18, this, "ptr", Playlist, "int", change)
        return result
    }

    /**
     * 
     * @param {Integer} change 
     * @returns {String} Nothing - always returns an empty string
     */
    CurrentPlaylistChange(change) {
        ComCall(19, this, "int", change)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @returns {String} Nothing - always returns an empty string
     */
    CurrentPlaylistItemAvailable(bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        ComCall(20, this, "ptr", bstrItemName)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} Item 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaChange(Item) {
        ComCall(21, this, "ptr", Item)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @returns {String} Nothing - always returns an empty string
     */
    CurrentMediaItemAvailable(bstrItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        ComCall(22, this, "ptr", bstrItemName)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdispMedia 
     * @returns {String} Nothing - always returns an empty string
     */
    CurrentItemChange(pdispMedia) {
        ComCall(23, this, "ptr", pdispMedia)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaCollectionChange() {
        ComCall(24, this)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribName 
     * @param {BSTR} bstrAttribVal 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaCollectionAttributeStringAdded(bstrAttribName, bstrAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrAttribVal := bstrAttribVal is String ? BSTR.Alloc(bstrAttribVal).Value : bstrAttribVal

        ComCall(25, this, "ptr", bstrAttribName, "ptr", bstrAttribVal)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribName 
     * @param {BSTR} bstrAttribVal 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaCollectionAttributeStringRemoved(bstrAttribName, bstrAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrAttribVal := bstrAttribVal is String ? BSTR.Alloc(bstrAttribVal).Value : bstrAttribVal

        ComCall(26, this, "ptr", bstrAttribName, "ptr", bstrAttribVal)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribName 
     * @param {BSTR} bstrOldAttribVal 
     * @param {BSTR} bstrNewAttribVal 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaCollectionAttributeStringChanged(bstrAttribName, bstrOldAttribVal, bstrNewAttribVal) {
        bstrAttribName := bstrAttribName is String ? BSTR.Alloc(bstrAttribName).Value : bstrAttribName
        bstrOldAttribVal := bstrOldAttribVal is String ? BSTR.Alloc(bstrOldAttribVal).Value : bstrOldAttribVal
        bstrNewAttribVal := bstrNewAttribVal is String ? BSTR.Alloc(bstrNewAttribVal).Value : bstrNewAttribVal

        ComCall(27, this, "ptr", bstrAttribName, "ptr", bstrOldAttribVal, "ptr", bstrNewAttribVal)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PlaylistCollectionChange() {
        ComCall(28, this)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPlaylistName 
     * @returns {String} Nothing - always returns an empty string
     */
    PlaylistCollectionPlaylistAdded(bstrPlaylistName) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(29, this, "ptr", bstrPlaylistName)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPlaylistName 
     * @returns {String} Nothing - always returns an empty string
     */
    PlaylistCollectionPlaylistRemoved(bstrPlaylistName) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(30, this, "ptr", bstrPlaylistName)
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPlaylistName 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {String} Nothing - always returns an empty string
     */
    PlaylistCollectionPlaylistSetAsDeleted(bstrPlaylistName, varfIsDeleted) {
        bstrPlaylistName := bstrPlaylistName is String ? BSTR.Alloc(bstrPlaylistName).Value : bstrPlaylistName

        ComCall(31, this, "ptr", bstrPlaylistName, "short", varfIsDeleted)
        return result
    }

    /**
     * 
     * @param {BSTR} ModeName 
     * @param {VARIANT_BOOL} NewValue 
     * @returns {String} Nothing - always returns an empty string
     */
    ModeChange(ModeName, NewValue) {
        ModeName := ModeName is String ? BSTR.Alloc(ModeName).Value : ModeName

        ComCall(32, this, "ptr", ModeName, "short", NewValue)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pMediaObject 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaError(pMediaObject) {
        ComCall(33, this, "ptr", pMediaObject)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {String} Nothing - always returns an empty string
     */
    OpenPlaylistSwitch(pItem) {
        ComCall(34, this, "ptr", pItem)
        return result
    }

    /**
     * 
     * @param {BSTR} strDomain 
     * @returns {String} Nothing - always returns an empty string
     */
    DomainChange(strDomain) {
        strDomain := strDomain is String ? BSTR.Alloc(strDomain).Value : strDomain

        ComCall(35, this, "ptr", strDomain)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SwitchedToPlayerApplication() {
        ComCall(36, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SwitchedToControl() {
        ComCall(37, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PlayerDockedStateChange() {
        ComCall(38, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PlayerReconnect() {
        ComCall(39, this)
        return result
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     */
    Click(nButton, nShiftState, fX, fY) {
        ComCall(40, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
        return result
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     */
    DoubleClick(nButton, nShiftState, fX, fY) {
        ComCall(41, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
        return result
    }

    /**
     * 
     * @param {Integer} nKeyCode 
     * @param {Integer} nShiftState 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyDown(nKeyCode, nShiftState) {
        ComCall(42, this, "short", nKeyCode, "short", nShiftState)
        return result
    }

    /**
     * 
     * @param {Integer} nKeyAscii 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyPress(nKeyAscii) {
        ComCall(43, this, "short", nKeyAscii)
        return result
    }

    /**
     * 
     * @param {Integer} nKeyCode 
     * @param {Integer} nShiftState 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyUp(nKeyCode, nShiftState) {
        ComCall(44, this, "short", nKeyCode, "short", nShiftState)
        return result
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     */
    MouseDown(nButton, nShiftState, fX, fY) {
        ComCall(45, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
        return result
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     */
    MouseMove(nButton, nShiftState, fX, fY) {
        ComCall(46, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
        return result
    }

    /**
     * 
     * @param {Integer} nButton 
     * @param {Integer} nShiftState 
     * @param {Integer} fX 
     * @param {Integer} fY 
     * @returns {String} Nothing - always returns an empty string
     */
    MouseUp(nButton, nShiftState, fX, fY) {
        ComCall(47, this, "short", nButton, "short", nShiftState, "int", fX, "int", fY)
        return result
    }
}
