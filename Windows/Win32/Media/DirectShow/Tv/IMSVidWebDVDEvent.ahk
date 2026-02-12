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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/dvdnotify
     */
    DVDNotify(lEventCode, lParam1, lParam2) {
        result := ComCall(8, this, "int", lEventCode, "ptr", lParam1, "ptr", lParam2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playforwards-method
     */
    PlayForwards(bEnabled) {
        result := ComCall(9, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playbackwards-method
     */
    PlayBackwards(bEnabled) {
        result := ComCall(10, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ShowMenu method displays the specified menu on the screen.
     * @remarks
     * DVD menu names can be somewhat confusing. The title menu is another name for the Video Manager Menu, the main menu for the entire disc; it generally lists all the video title sets available on the disc. The root menu is the menu for one video title set, which can contain one title or a group of titles. All the titles in a title set share the same Subpicture, Audio, and Angle menus.
     * @param {Integer} MenuID 
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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/showmenu-method
     */
    ShowMenu(MenuID, bEnabled) {
        result := ComCall(11, this, "int", MenuID, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume(bEnabled) {
        result := ComCall(12, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    SelectOrActivateButton(bEnabled) {
        result := ComCall(13, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StillOff method resumes playback, canceling still mode.
     * @remarks
     * The [DVD Navigator](dvd-navigator-filter.md) goes into still mode when it encounters a still frame authored on the disc. It notifies your application by sending an EC\_DVD\_STILL\_ON event. Still mode is different from the DVD Navigator being in a paused state because of a user operation. Calling `StillOff` resumes playback from still mode but does not restart the DVD Navigator when it is in a paused state.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/stilloff-method
     */
    StillOff(bEnabled) {
        result := ComCall(14, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    PauseOn(bEnabled) {
        result := ComCall(15, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ChangeCurrentAudioStream event is sent when the disc enables or disables changing the audio stream.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/changecurrentaudiostream
     */
    ChangeCurrentAudioStream(bEnabled) {
        result := ComCall(16, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ChangeCurrentSubpictureStream event is sent when the disc enables or disables changing the subpicture stream.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/changecurrentsubpicturestream
     */
    ChangeCurrentSubpictureStream(bEnabled) {
        result := ComCall(17, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ChangeCurrentAngle event is sent when the disc enables or disables changing the angle.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/changecurrentangle
     */
    ChangeCurrentAngle(bEnabled) {
        result := ComCall(18, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playattimeintitle-method
     */
    PlayAtTimeInTitle(bEnabled) {
        result := ComCall(19, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playattime-method
     */
    PlayAtTime(bEnabled) {
        result := ComCall(20, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playchapterintitle-method
     */
    PlayChapterInTitle(bEnabled) {
        result := ComCall(21, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playchapter-method
     */
    PlayChapter(bEnabled) {
        result := ComCall(22, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReplayChapter method starts playback at the beginning of the current chapter.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/replaychapter-method
     */
    ReplayChapter(bEnabled) {
        result := ComCall(23, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PlayNextChapter method starts playback from the next chapter in the current title.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playnextchapter-method
     */
    PlayNextChapter(bEnabled) {
        result := ComCall(24, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop(bEnabled) {
        result := ComCall(25, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReturnFromSubmenu method returns display from a submenu to its parent menu, or to the current title if the menu is a top-level menu.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/returnfromsubmenu-method
     */
    ReturnFromSubmenu(bEnabled) {
        result := ComCall(26, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playtitle-method
     */
    PlayTitle(bEnabled) {
        result := ComCall(27, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PlayPrevChapter method starts playback from the previous chapter in the current title.
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/playprevchapter-method
     */
    PlayPrevChapter(bEnabled) {
        result := ComCall(28, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeKaraokePresMode(bEnabled) {
        result := ComCall(29, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    ChangeVideoPresMode(bEnabled) {
        result := ComCall(30, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
