#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdControl
     * @type {Guid}
     */
    static IID => Guid("{a70efe61-e2a3-11d0-a9be-00aa0061be93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TitlePlay", "ChapterPlay", "TimePlay", "StopForResume", "GoUp", "TimeSearch", "ChapterSearch", "PrevPGSearch", "TopPGSearch", "NextPGSearch", "ForwardScan", "BackwardScan", "MenuCall", "Resume", "UpperButtonSelect", "LowerButtonSelect", "LeftButtonSelect", "RightButtonSelect", "ButtonActivate", "ButtonSelectAndActivate", "StillOff", "PauseOn", "PauseOff", "MenuLanguageSelect", "AudioStreamChange", "SubpictureStreamChange", "AngleChange", "ParentalLevelSelect", "ParentalCountrySelect", "KaraokeAudioPresentationModeChange", "VideoModePreferrence", "SetRoot", "MouseActivate", "MouseSelect", "ChapterPlayAutoStop"]

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Finds the media file with the specified title index and plays it back.
     * @param {Integer} ulTitle Value that specifies the title number DirectShow will play back; this value must be from 1 through 99.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-titleplay
     */
    TitlePlay(ulTitle) {
        result := ComCall(3, this, "uint", ulTitle, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Plays the media file with the specified title index and chapter value.
     * @param {Integer} ulTitle Value that specifies the title number DirectShow will play back; this value must be from 1 through 99.
     * @param {Integer} ulChapter Value that specifies the chapter within the specified title where DirectShow will start playback; this value must be from 1 through 999.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-chapterplay
     */
    ChapterPlay(ulTitle, ulChapter) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Plays the media file with the specified title index, starting at the specified time.
     * @param {Integer} ulTitle Value that specifies the title number DirectShow will play back; this value must be from 1 through 99.
     * @param {Integer} bcdTime Pointer to the [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) structure where DirectShow will start playback.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-timeplay
     */
    TimePlay(ulTitle, bcdTime) {
        result := ComCall(5, this, "uint", ulTitle, "uint", bcdTime, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Transitions playback to the DVD_DOMAIN_Stop state after saving resume information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-stopforresume
     */
    StopForResume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current media file and starts playback of the designated previous program chain (PGC).
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-goup
     */
    GoUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current chapter and starts playback from the specified time in the same media file.
     * @param {Integer} bcdTime Pointer to the [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) structure where DirectShow will start playback.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-timesearch
     */
    TimeSearch(bcdTime) {
        result := ComCall(8, this, "uint", bcdTime, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current chapter and starts playback from the specified chapter within the same title.
     * @param {Integer} ulChapter Chapter value that specifies the point where playback will begin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-chaptersearch
     */
    ChapterSearch(ulChapter) {
        result := ComCall(9, this, "uint", ulChapter, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current program and starts playback from the previous program within the program chain (PGC).
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-prevpgsearch
     */
    PrevPGSearch() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current program and restarts playback of the current program within the program chain (PGC).
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-toppgsearch
     */
    TopPGSearch() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current program and starts playback from the next program within the program chain (PGC).
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-nextpgsearch
     */
    NextPGSearch() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Searches forward through the current disc at the specified speed.
     * @param {Float} dwSpeed Value that specifies how quickly DirectShow will search through the media file. This value is a multiplier, where 1.0 is the authored speed, so a value of 2.5 will search forward at two and one-half times the authored speed, while a value of 0.5 will search forward at half the authored speed. Note that the actual speed of playback depends on the capabilities of the video decoder, and might differ from the specified rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-forwardscan
     */
    ForwardScan(dwSpeed) {
        result := ComCall(13, this, "double", dwSpeed, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Searches backward through the current disc at the specified speed.
     * @param {Float} dwSpeed Value that specifies how quickly DirectShow will search through the media file. This value is a multiplier, where 1.0 is the authored speed, so a value of 2.5 will search backward at two and one-half times the authored speed, while a value of 0.5 will search backward at half the authored speed. The actual speed of playback depends on the capabilities of the video decoder, and might differ from the specified rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-backwardscan
     */
    BackwardScan(dwSpeed) {
        result := ComCall(14, this, "double", dwSpeed, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Displays the specified menu on the screen.
     * @param {Integer} MenuID Value that specifies the menu to display. Member of the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_menu_id">DVD_MENU_ID</a> enumerated data type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-menucall
     */
    MenuCall(MenuID) {
        result := ComCall(15, this, "int", MenuID, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Returns to playing back a title from a menu.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-resume
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the upper directional button from the displayed menu.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-upperbuttonselect
     */
    UpperButtonSelect() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the lower directional button from the displayed menu.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-lowerbuttonselect
     */
    LowerButtonSelect() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the left directional button from the displayed menu.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-leftbuttonselect
     */
    LeftButtonSelect() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the right directional button from the displayed menu.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-rightbuttonselect
     */
    RightButtonSelect() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Activates the selected button.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-buttonactivate
     */
    ButtonActivate() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects and activates the specified button.
     * @param {Integer} ulButton Value that specifies the button that will be selected and activated, which must be from 1 through 36.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-buttonselectandactivate
     */
    ButtonSelectAndActivate(ulButton) {
        result := ComCall(22, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Resumes playback, canceling still mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-stilloff
     */
    StillOff() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Pauses the current media file playback.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-pauseon
     */
    PauseOn() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Resumes playback of the current media file after a pause.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-pauseoff
     */
    PauseOff() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the displayed language for navigation menus.
     * @param {Integer} Language Value that specifies the new language.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-menulanguageselect
     */
    MenuLanguageSelect(Language) {
        result := ComCall(26, this, "uint", Language, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the current audio stream.
     * @param {Integer} ulAudio Value that specifies the audio track to use, which must be from 0 through 7.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-audiostreamchange
     */
    AudioStreamChange(ulAudio) {
        result := ComCall(27, this, "uint", ulAudio, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the new subpicture stream and enables or disables it for display.
     * @param {Integer} ulSubPicture Value that specifies the source of the subpicture, which must be from 0 through 32, or 63.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0-31</td>
     * <td>Indicates that the stream is valid.</td>
     * </tr>
     * <tr>
     * <td>32</td>
     * <td>Enables you to toggle the display without changing the current stream (that is, change <i>bDisplay</i> without altering the current stream).</td>
     * </tr>
     * <tr>
     * <td>63</td>
     * <td>Indicates that the stream is the dummy stream.</td>
     * </tr>
     * </table>
     * @param {BOOL} bDisplay Value that specifies whether the subpicture is enabled; <b>TRUE</b> makes the subpicture visible and <b>FALSE</b> hides it.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-subpicturestreamchange
     */
    SubpictureStreamChange(ulSubPicture, bDisplay) {
        result := ComCall(28, this, "uint", ulSubPicture, "int", bDisplay, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the new display angle.
     * @param {Integer} ulAngle Value of the new angle, which must be from 1 through 9.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-anglechange
     */
    AngleChange(ulAngle) {
        result := ComCall(29, this, "uint", ulAngle, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the parental access level for the current media file.
     * @param {Integer} ulParentalLevel Value that specifies the current media file parental access level. Should be a value from 1 to 8, inclusive. Predefined parental levels are as follows:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>The rating is G, General.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>The rating is PG, Parental Guidance Suggested.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>The rating is PG-13, Parental Guidance Suggested, not recommended for those under 13.</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>The rating is R, Restricted.</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>The rating is NC-17.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-parentallevelselect
     */
    ParentalLevelSelect(ulParentalLevel) {
        result := ComCall(30, this, "uint", ulParentalLevel, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the current country/region for controlling parental access levels.
     * @param {Integer} wCountry Value that specifies the current country/region according to the Alpha-2 Code defined in ISO3166. See Remarks.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-parentalcountryselect
     */
    ParentalCountrySelect(wCountry) {
        result := ComCall(31, this, "ushort", wCountry, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the audio playback mode to karaoke.
     * @param {Integer} ulMode Requested audio playback mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-karaokeaudiopresentationmodechange
     */
    KaraokeAudioPresentationModeChange(ulMode) {
        result := ComCall(32, this, "uint", ulMode, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the video display mode the user prefers.
     * @param {Integer} ulPreferredDisplayMode Value that specifies the new display mode for DVD content. Member of the [DVD_PREFERRED_DISPLAY_MODE](/windows/desktop/api/strmif/ne-strmif-dvd_preferred_display_mode) enumerated data type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-videomodepreferrence
     */
    VideoModePreferrence(ulPreferredDisplayMode) {
        result := ComCall(33, this, "uint", ulPreferredDisplayMode, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the root directory containing the DVD-Video volume.
     * @param {PWSTR} pszPath Pointer to the directory name to set as the root directory.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-setroot
     */
    SetRoot(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(34, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects and activates a DVD button in response to a mouse click.
     * @param {POINT} point Specified point within the display window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-mouseactivate
     */
    MouseActivate(point) {
        result := ComCall(35, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects a DVD button in response to mouse movement.
     * @param {POINT} point Specified point within the display window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-mouseselect
     */
    MouseSelect(point) {
        result := ComCall(36, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Instructs the DVD player to start playing at the specified chapter within the specified title and play the number of chapters specified.
     * @param {Integer} ulTitle Title number for playback.
     * @param {Integer} ulChapter Chapter number to start playback.
     * @param {Integer} ulChaptersToPlay Number of chapters to play from the start chapter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol-chapterplayautostop
     */
    ChapterPlayAutoStop(ulTitle, ulChapter, ulChaptersToPlay) {
        result := ComCall(37, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "HRESULT")
        return result
    }
}
