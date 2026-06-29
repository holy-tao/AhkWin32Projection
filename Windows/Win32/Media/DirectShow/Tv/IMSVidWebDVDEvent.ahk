#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DVDMenuIDConstants.ahk" { DVDMenuIDConstants }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IMSVidPlaybackEvent.ahk" { IMSVidPlaybackEvent }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidWebDVDEvent extends IMSVidPlaybackEvent {
    /**
     * The interface identifier for IMSVidWebDVDEvent
     * @type {Guid}
     */
    static IID := Guid("{b4f7a674-9b83-49cb-a357-c63b871be958}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidWebDVDEvent interfaces
    */
    struct Vtbl extends IMSVidPlaybackEvent.Vtbl {
        DVDNotify                     : IntPtr
        PlayForwards                  : IntPtr
        PlayBackwards                 : IntPtr
        ShowMenu                      : IntPtr
        Resume                        : IntPtr
        SelectOrActivateButton        : IntPtr
        StillOff                      : IntPtr
        PauseOn                       : IntPtr
        ChangeCurrentAudioStream      : IntPtr
        ChangeCurrentSubpictureStream : IntPtr
        ChangeCurrentAngle            : IntPtr
        PlayAtTimeInTitle             : IntPtr
        PlayAtTime                    : IntPtr
        PlayChapterInTitle            : IntPtr
        PlayChapter                   : IntPtr
        ReplayChapter                 : IntPtr
        PlayNextChapter               : IntPtr
        Stop                          : IntPtr
        ReturnFromSubmenu             : IntPtr
        PlayTitle                     : IntPtr
        PlayPrevChapter               : IntPtr
        ChangeKaraokePresMode         : IntPtr
        ChangeVideoPresMode           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidWebDVDEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DVDNotify event notifies an application of many different DVD events and disc instructions.
     * @remarks
     * <span id="EventCode"></span><span id="eventcode"></span><span id="EVENTCODE"></span>*EventCode*
     * 
     * Specifies the DVD event notification code.
     * 
     * 
     * <span id="Param1"></span><span id="param1"></span><span id="PARAM1"></span>*Param1*
     * 
     * Can contain additional information related to the event.
     * 
     * 
     * <span id="Param2"></span><span id="param2"></span><span id="PARAM2"></span>*Param2*
     * 
     * Can contain additional information related to the event.
     * 
     * 
     * 
     * [DVD Event Notification Codes](dvd-notification-codes.md) gives a full explanation of all DVD event notification codes and their parameters.
     * @param {Integer} lEventCode 
     * @param {VARIANT} lParam1 
     * @param {VARIANT} lParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/dvdnotify
     */
    DVDNotify(lEventCode, lParam1, lParam2) {
        result := ComCall(8, this, "int", lEventCode, VARIANT, lParam1, VARIANT, lParam2, "HRESULT")
        return result
    }

    /**
     * The PlayForwards method starts forward playback from the current location at the specified speed.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="nSpeed"></span><span id="nspeed"></span><span id="NSPEED"></span>*nSpeed*
     * 
     * Specifies the speed at which to play as an Integer value. This value is a multiplier—1.0 is normal playback speed; 2.0 is double speed, 0.5 is half speed, and so on. When**nSpeed**does not equal 1.0, audio is muted and the subpicture is turned off.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playforwards-method
     */
    PlayForwards(bEnabled) {
        result := ComCall(9, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayBackwards method starts backward playback from the current location at the specified speed.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="nSpeed"></span><span id="nspeed"></span><span id="NSPEED"></span>*nSpeed*
     * 
     * Specifies the speed at which to play as a number. This number is a multiplier—1.0 is normal playback speed; 2.0 is double speed, 0.5 is half speed, and so on. When**nSpeed**does not equal 1.0, audio is muted and the subpicture is turned off.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playbackwards-method
     */
    PlayBackwards(bEnabled) {
        result := ComCall(10, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The ShowMenu method displays the specified menu on the screen.
     * @remarks
     * DVD menu names can be somewhat confusing. The title menu is another name for the Video Manager Menu, the main menu for the entire disc; it generally lists all the video title sets available on the disc. The root menu is the menu for one video title set, which can contain one title or a group of titles. All the titles in a title set share the same Subpicture, Audio, and Angle menus.
     * @param {DVDMenuIDConstants} MenuID 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="iMenuID"></span><span id="imenuid"></span><span id="IMENUID"></span>*iMenuID*
     * 
     * Specifies the menu ID as an Integer.
     * 
     * 
     * 
     * | Value | Description |
     * |-------|-------------|
     * | 2     | Title (Top) |
     * | 3     | Root        |
     * | 4     | Subpicture  |
     * | 5     | Audio       |
     * | 6     | Angle       |
     * | 7     | Chapter     |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/showmenu-method
     */
    ShowMenu(MenuID, bEnabled) {
        result := ComCall(11, this, DVDMenuIDConstants, MenuID, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume(bEnabled) {
        result := ComCall(12, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    SelectOrActivateButton(bEnabled) {
        result := ComCall(13, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The StillOff method resumes playback, canceling still mode.
     * @remarks
     * The [DVD Navigator](dvd-navigator-filter.md) goes into still mode when it encounters a still frame authored on the disc. It notifies your application by sending an EC\_DVD\_STILL\_ON event. Still mode is different from the DVD Navigator being in a paused state because of a user operation. Calling `StillOff` resumes playback from still mode but does not restart the DVD Navigator when it is in a paused state.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/stilloff-method
     */
    StillOff(bEnabled) {
        result := ComCall(14, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PauseOn(bEnabled) {
        result := ComCall(15, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The ChangeCurrentAudioStream event is sent when the disc enables or disables changing the audio stream.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/changecurrentaudiostream
     */
    ChangeCurrentAudioStream(bEnabled) {
        result := ComCall(16, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The ChangeCurrentSubpictureStream event is sent when the disc enables or disables changing the subpicture stream.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/changecurrentsubpicturestream
     */
    ChangeCurrentSubpictureStream(bEnabled) {
        result := ComCall(17, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The ChangeCurrentAngle event is sent when the disc enables or disables changing the angle.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/changecurrentangle
     */
    ChangeCurrentAngle(bEnabled) {
        result := ComCall(18, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayAtTimeInTitle method starts playback at the specified time within the specified title.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="sTime"></span><span id="stime"></span><span id="STIME"></span>*sTime*
     * 
     * Specifies the time at which to start playback as a string. The string must be in the format "hh:mm:ss:ff" (specifying hours, minutes, seconds, frames).
     * 
     * 
     * <span id="iTitle"></span><span id="ititle"></span><span id="ITITLE"></span>*iTitle*
     * 
     * Specifies the index of the title as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playattimeintitle-method
     */
    PlayAtTimeInTitle(bEnabled) {
        result := ComCall(19, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayAtTime method starts playback in the current title at the specified time.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="sTime"></span><span id="stime"></span><span id="STIME"></span>*sTime*
     * 
     * Specifies the time at which to start playing as a string. The string must be in the format "hh:mm:ss:ff" (specifying hours, minutes, seconds, frames).
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playattime-method
     */
    PlayAtTime(bEnabled) {
        result := ComCall(20, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayChapterInTitle method plays the specified chapter in the specified title.
     * @remarks
     * This method starts playback at the specified chapter and then continues playing indefinitely. If you want to play only a particular chapter, use [**PlayChaptersAutoStop**](playchaptersautostop-method.md).
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="iTitle"></span><span id="ititle"></span><span id="ITITLE"></span>*iTitle*
     * 
     * Specifies the title as an Integer value.
     * 
     * 
     * <span id="iChapter"></span><span id="ichapter"></span><span id="ICHAPTER"></span>*iChapter*
     * 
     * Specifies the chapter as an Integer value.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playchapterintitle-method
     */
    PlayChapterInTitle(bEnabled) {
        result := ComCall(21, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayChapter method starts playback from the specified chapter within the current title.
     * @remarks
     * When the end of the specified chapter is reached, this method continues playing subsequent chapters, if any exist. If you want to play only a specified chapter, use [**PlayChaptersAutoStop**](playchaptersautostop-method.md).
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="iChapter"></span><span id="ichapter"></span><span id="ICHAPTER"></span>*iChapter*
     * 
     * Specifies the chapter index in the current title as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playchapter-method
     */
    PlayChapter(bEnabled) {
        result := ComCall(22, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The ReplayChapter method starts playback at the beginning of the current chapter.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/replaychapter-method
     */
    ReplayChapter(bEnabled) {
        result := ComCall(23, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayNextChapter method starts playback from the next chapter in the current title.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playnextchapter-method
     */
    PlayNextChapter(bEnabled) {
        result := ComCall(24, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    Stop(bEnabled) {
        result := ComCall(25, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The ReturnFromSubmenu method returns display from a submenu to its parent menu, or to the current title if the menu is a top-level menu.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/returnfromsubmenu-method
     */
    ReturnFromSubmenu(bEnabled) {
        result := ComCall(26, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayTitle method starts playback at the beginning of the specified title.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} <span id="iTitle"></span><span id="ititle"></span><span id="ITITLE"></span>*iTitle*
     * 
     * Specifies the title as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playtitle-method
     */
    PlayTitle(bEnabled) {
        result := ComCall(27, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The PlayPrevChapter method starts playback from the previous chapter in the current title.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playprevchapter-method
     */
    PlayPrevChapter(bEnabled) {
        result := ComCall(28, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeKaraokePresMode(bEnabled) {
        result := ComCall(29, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeVideoPresMode(bEnabled) {
        result := ComCall(30, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidWebDVDEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DVDNotify := CallbackCreate(GetMethod(implObj, "DVDNotify"), flags, 4)
        this.vtbl.PlayForwards := CallbackCreate(GetMethod(implObj, "PlayForwards"), flags, 2)
        this.vtbl.PlayBackwards := CallbackCreate(GetMethod(implObj, "PlayBackwards"), flags, 2)
        this.vtbl.ShowMenu := CallbackCreate(GetMethod(implObj, "ShowMenu"), flags, 3)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 2)
        this.vtbl.SelectOrActivateButton := CallbackCreate(GetMethod(implObj, "SelectOrActivateButton"), flags, 2)
        this.vtbl.StillOff := CallbackCreate(GetMethod(implObj, "StillOff"), flags, 2)
        this.vtbl.PauseOn := CallbackCreate(GetMethod(implObj, "PauseOn"), flags, 2)
        this.vtbl.ChangeCurrentAudioStream := CallbackCreate(GetMethod(implObj, "ChangeCurrentAudioStream"), flags, 2)
        this.vtbl.ChangeCurrentSubpictureStream := CallbackCreate(GetMethod(implObj, "ChangeCurrentSubpictureStream"), flags, 2)
        this.vtbl.ChangeCurrentAngle := CallbackCreate(GetMethod(implObj, "ChangeCurrentAngle"), flags, 2)
        this.vtbl.PlayAtTimeInTitle := CallbackCreate(GetMethod(implObj, "PlayAtTimeInTitle"), flags, 2)
        this.vtbl.PlayAtTime := CallbackCreate(GetMethod(implObj, "PlayAtTime"), flags, 2)
        this.vtbl.PlayChapterInTitle := CallbackCreate(GetMethod(implObj, "PlayChapterInTitle"), flags, 2)
        this.vtbl.PlayChapter := CallbackCreate(GetMethod(implObj, "PlayChapter"), flags, 2)
        this.vtbl.ReplayChapter := CallbackCreate(GetMethod(implObj, "ReplayChapter"), flags, 2)
        this.vtbl.PlayNextChapter := CallbackCreate(GetMethod(implObj, "PlayNextChapter"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 2)
        this.vtbl.ReturnFromSubmenu := CallbackCreate(GetMethod(implObj, "ReturnFromSubmenu"), flags, 2)
        this.vtbl.PlayTitle := CallbackCreate(GetMethod(implObj, "PlayTitle"), flags, 2)
        this.vtbl.PlayPrevChapter := CallbackCreate(GetMethod(implObj, "PlayPrevChapter"), flags, 2)
        this.vtbl.ChangeKaraokePresMode := CallbackCreate(GetMethod(implObj, "ChangeKaraokePresMode"), flags, 2)
        this.vtbl.ChangeVideoPresMode := CallbackCreate(GetMethod(implObj, "ChangeVideoPresMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DVDNotify)
        CallbackFree(this.vtbl.PlayForwards)
        CallbackFree(this.vtbl.PlayBackwards)
        CallbackFree(this.vtbl.ShowMenu)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.SelectOrActivateButton)
        CallbackFree(this.vtbl.StillOff)
        CallbackFree(this.vtbl.PauseOn)
        CallbackFree(this.vtbl.ChangeCurrentAudioStream)
        CallbackFree(this.vtbl.ChangeCurrentSubpictureStream)
        CallbackFree(this.vtbl.ChangeCurrentAngle)
        CallbackFree(this.vtbl.PlayAtTimeInTitle)
        CallbackFree(this.vtbl.PlayAtTime)
        CallbackFree(this.vtbl.PlayChapterInTitle)
        CallbackFree(this.vtbl.PlayChapter)
        CallbackFree(this.vtbl.ReplayChapter)
        CallbackFree(this.vtbl.PlayNextChapter)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.ReturnFromSubmenu)
        CallbackFree(this.vtbl.PlayTitle)
        CallbackFree(this.vtbl.PlayPrevChapter)
        CallbackFree(this.vtbl.ChangeKaraokePresMode)
        CallbackFree(this.vtbl.ChangeVideoPresMode)
    }
}
