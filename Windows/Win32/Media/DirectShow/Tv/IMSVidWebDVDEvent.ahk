#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidPlaybackEvent.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidWebDVDEvent extends IMSVidPlaybackEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidWebDVDEvent
     * @type {Guid}
     */
    static IID => Guid("{b4f7a674-9b83-49cb-a357-c63b871be958}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DVDNotify", "PlayForwards", "PlayBackwards", "ShowMenu", "Resume", "SelectOrActivateButton", "StillOff", "PauseOn", "ChangeCurrentAudioStream", "ChangeCurrentSubpictureStream", "ChangeCurrentAngle", "PlayAtTimeInTitle", "PlayAtTime", "PlayChapterInTitle", "PlayChapter", "ReplayChapter", "PlayNextChapter", "Stop", "ReturnFromSubmenu", "PlayTitle", "PlayPrevChapter", "ChangeKaraokePresMode", "ChangeVideoPresMode"]

    /**
     * 
     * @param {Integer} lEventCode 
     * @param {VARIANT} lParam1 
     * @param {VARIANT} lParam2 
     * @returns {HRESULT} 
     */
    DVDNotify(lEventCode, lParam1, lParam2) {
        result := ComCall(8, this, "int", lEventCode, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayForwards(bEnabled) {
        result := ComCall(9, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayBackwards(bEnabled) {
        result := ComCall(10, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ShowMenu(MenuID, bEnabled) {
        result := ComCall(11, this, "int", MenuID, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    Resume(bEnabled) {
        result := ComCall(12, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    SelectOrActivateButton(bEnabled) {
        result := ComCall(13, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    StillOff(bEnabled) {
        result := ComCall(14, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PauseOn(bEnabled) {
        result := ComCall(15, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeCurrentAudioStream(bEnabled) {
        result := ComCall(16, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeCurrentSubpictureStream(bEnabled) {
        result := ComCall(17, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeCurrentAngle(bEnabled) {
        result := ComCall(18, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayAtTimeInTitle(bEnabled) {
        result := ComCall(19, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayAtTime(bEnabled) {
        result := ComCall(20, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayChapterInTitle(bEnabled) {
        result := ComCall(21, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayChapter(bEnabled) {
        result := ComCall(22, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ReplayChapter(bEnabled) {
        result := ComCall(23, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayNextChapter(bEnabled) {
        result := ComCall(24, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    Stop(bEnabled) {
        result := ComCall(25, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ReturnFromSubmenu(bEnabled) {
        result := ComCall(26, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayTitle(bEnabled) {
        result := ComCall(27, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PlayPrevChapter(bEnabled) {
        result := ComCall(28, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeKaraokePresMode(bEnabled) {
        result := ComCall(29, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeVideoPresMode(bEnabled) {
        result := ComCall(30, this, "short", bEnabled, "HRESULT")
        return result
    }
}
