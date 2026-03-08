#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated. (IDvdControl)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvdcontrol
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
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulTitle Value that specifies the title number DirectShow will play back; this value must be from 1 through 99.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-titleplay
     */
    TitlePlay(ulTitle) {
        result := ComCall(3, this, "uint", ulTitle, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Plays the media file with the specified title index and chapter value.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulTitle Value that specifies the title number DirectShow will play back; this value must be from 1 through 99.
     * @param {Integer} ulChapter Value that specifies the chapter within the specified title where DirectShow will start playback; this value must be from 1 through 999.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-chapterplay
     */
    ChapterPlay(ulTitle, ulChapter) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Plays the media file with the specified title index, starting at the specified time.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulTitle Value that specifies the title number DirectShow will play back; this value must be from 1 through 99.
     * @param {Integer} bcdTime Pointer to the [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) structure where DirectShow will start playback.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-timeplay
     */
    TimePlay(ulTitle, bcdTime) {
        result := ComCall(5, this, "uint", ulTitle, "uint", bcdTime, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Transitions playback to the DVD_DOMAIN_Stop state after saving resume information.
     * @remarks
     * If no file is playing or paused, this method does nothing.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter transfers to the stopped state, but the filter graph remains in the DirectShow run state.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-stopforresume
     */
    StopForResume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current media file and starts playback of the designated previous program chain (PGC).
     * @remarks
     * Each PGC is associated with a previous PGC at authoring time, which this method sets as the new playback file.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-goup
     */
    GoUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current chapter and starts playback from the specified time in the same media file.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} bcdTime Pointer to the [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) structure where DirectShow will start playback.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-timesearch
     */
    TimeSearch(bcdTime) {
        result := ComCall(8, this, "uint", bcdTime, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current chapter and starts playback from the specified chapter within the same title.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulChapter Chapter value that specifies the point where playback will begin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-chaptersearch
     */
    ChapterSearch(ulChapter) {
        result := ComCall(9, this, "uint", ulChapter, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current program and starts playback from the previous program within the program chain (PGC).
     * @remarks
     * A program is usually equivalent to a chapter, and a PGC is usually equivalent to a title. In the case of One_Sequential_PGC_Titles, each program is required to be a chapter and each title has only one PGC, but in other cases (especially with random/shuffle PGCs and parental blocks) there can be more than one program between chapters and there can be more than one PGC in a title.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-prevpgsearch
     */
    PrevPGSearch() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current program and restarts playback of the current program within the program chain (PGC).
     * @remarks
     * A program is usually equivalent to a chapter, and a PGC is usually equivalent to a title. In the case of One_Sequential_PGC_Titles, each program is required to be a chapter and each title has only one PGC, but in other cases (especially with random/shuffle PGCs and parental blocks) there can be more than one program between chapters and there can be more than one PGC in a title.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-toppgsearch
     */
    TopPGSearch() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Halts playback of the current program and starts playback from the next program within the program chain (PGC).
     * @remarks
     * A program is usually equivalent to a chapter, and a PGC is usually equivalent to a title. In the case of One_Sequential_PGC_Titles, each program is required to be a chapter and each title has only one PGC, but in other cases (especially with random/shuffle PGCs and parental blocks) there can be more than one program between chapters and there can be more than one PGC in a title.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-nextpgsearch
     */
    NextPGSearch() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Searches forward through the current disc at the specified speed.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Float} dwSpeed Value that specifies how quickly DirectShow will search through the media file. This value is a multiplier, where 1.0 is the authored speed, so a value of 2.5 will search forward at two and one-half times the authored speed, while a value of 0.5 will search forward at half the authored speed. Note that the actual speed of playback depends on the capabilities of the video decoder, and might differ from the specified rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-forwardscan
     */
    ForwardScan(dwSpeed) {
        result := ComCall(13, this, "double", dwSpeed, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Searches backward through the current disc at the specified speed.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Float} dwSpeed Value that specifies how quickly DirectShow will search through the media file. This value is a multiplier, where 1.0 is the authored speed, so a value of 2.5 will search backward at two and one-half times the authored speed, while a value of 0.5 will search backward at half the authored speed. The actual speed of playback depends on the capabilities of the video decoder, and might differ from the specified rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-backwardscan
     */
    BackwardScan(dwSpeed) {
        result := ComCall(14, this, "double", dwSpeed, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Displays the specified menu on the screen.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} MenuID Value that specifies the menu to display. Member of the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_menu_id">DVD_MENU_ID</a> enumerated data type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-menucall
     */
    MenuCall(MenuID) {
        result := ComCall(15, this, "int", MenuID, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Returns to playing back a title from a menu.
     * @remarks
     * If the file is stopped or already running, this method does nothing.
     * 
     * This method returns to title playback in DVD_DOMAIN_Title. Applications typically call this method after <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> which puts the DVD Navigator in DVD_DOMAIN_VideoTitleSetMenu or DVD_DOMAIN_VideoManagerMenu.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu or DVD_DOMAIN_VideoTitleSetMenu. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-resume
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the upper directional button from the displayed menu.
     * @remarks
     * On physical or electronic remote control devices, there is often a group of four directional buttons used for certain types of operations (such as menu navigation). This method tells DirectShow that something (the user, probably) triggered the upper directional button.
     * 
     * Selecting a DVD button simply highlights the button but does not activate the button. Selecting is the Windows equivalent of tabbing to a button but not pressing the SPACEBAR or ENTER key. Activating is the Windows equivalent of pressing the SPACEBAR or ENTER key after tabbing to a button.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-upperbuttonselect
     */
    UpperButtonSelect() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the lower directional button from the displayed menu.
     * @remarks
     * On physical or electronic remote control devices, there is often a group of four directional buttons used for certain types of operations (such as menu navigation). This method tells DirectShow that something (the user, probably) triggered the lower directional button.
     * 
     * Selecting a DVD button simply highlights the button but does not activate the button. Selecting is the Windows equivalent of tabbing to a button but not pressing the SPACEBAR or ENTER key. Activating is the Windows equivalent of pressing the SPACEBAR or ENTER key after tabbing to a button.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-lowerbuttonselect
     */
    LowerButtonSelect() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the left directional button from the displayed menu.
     * @remarks
     * On physical or electronic remote control devices, there is often a group of four directional buttons used for certain types of operations (such as menu navigation). This method tells DirectShow that something (the user, probably) triggered the left directional button.
     * 
     * Selecting a DVD button simply highlights the button but does not activate the button. Selecting is the Windows equivalent of tabbing to a button but not pressing the SPACEBAR or ENTER key. Activating is the Windows equivalent of pressing the SPACEBAR or ENTER key after tabbing to a button.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-leftbuttonselect
     */
    LeftButtonSelect() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the right directional button from the displayed menu.
     * @remarks
     * On physical or electronic remote control devices, there is often a group of four directional buttons used for certain types of operations (such as menu navigation). This method tells DirectShow that something (the user, probably) triggered the right directional button.
     * 
     * Selecting a DVD button simply highlights the button but does not activate the button. Selecting is the Windows equivalent of tabbing to a button but not pressing the SPACEBAR or ENTER key. Activating is the Windows equivalent of pressing the SPACEBAR or ENTER key after tabbing to a button.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-rightbuttonselect
     */
    RightButtonSelect() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Activates the selected button.
     * @remarks
     * Selecting a DVD button simply highlights the button but does not activate the button. Selecting is equivalent of tabbing to a button but not pressing the SPACEBAR or ENTER key. Activating is equivalent of pressing the SPACEBAR or ENTER key after tabbing to a button.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-buttonactivate
     */
    ButtonActivate() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects and activates the specified button.
     * @remarks
     * Electronic remote control devices typically have a number of buttons that activate various functions of a DVD playback unit. Typically, you call this method when a user clicks a button on the control device; DirectShow then indicates that the button was selected (by playing a sound or changing a graphic, for example) and calls methods appropriate to which button was selected, such as <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-buttonactivate">ButtonActivate</a>.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulButton Value that specifies the button that will be selected and activated, which must be from 1 through 36.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-buttonselectandactivate
     */
    ButtonSelectAndActivate(ulButton) {
        result := ComCall(22, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Resumes playback, canceling still mode.
     * @remarks
     * If the display image was not in still-store mode, this method does nothing.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-stilloff
     */
    StillOff() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Pauses the current media file playback.
     * @remarks
     * This method freezes playback and any internal timers, similar to <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-pause">IMediaControl::Pause</a>. If the media file was not running, this method does nothing.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-pauseon
     */
    PauseOn() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Resumes playback of the current media file after a pause.
     * @remarks
     * If the media file was not paused in playback, this method does nothing.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-pauseoff
     */
    PauseOff() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the displayed language for navigation menus.
     * @remarks
     * This method selects the default language for menus.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * Applications specify languages with standard Windows LCIDs.
     * @param {Integer} Language Value that specifies the new language.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-menulanguageselect
     */
    MenuLanguageSelect(Language) {
        result := ComCall(26, this, "uint", Language, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the current audio stream.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * <c>AudioStreamChange</c> affects the audio of the current Video Title Set (VTS). When called from within a menu, this method sets the audio stream of the title from which the menu was called.
     * @param {Integer} ulAudio Value that specifies the audio track to use, which must be from 0 through 7.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-audiostreamchange
     */
    AudioStreamChange(ulAudio) {
        result := ComCall(27, this, "uint", ulAudio, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects the new subpicture stream and enables or disables it for display.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-subpicturestreamchange
     */
    SubpictureStreamChange(ulSubPicture, bDisplay) {
        result := ComCall(28, this, "uint", ulSubPicture, "int", bDisplay, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the new display angle.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulAngle Value of the new angle, which must be from 1 through 9.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-anglechange
     */
    AngleChange(ulAngle) {
        result := ComCall(29, this, "uint", ulAngle, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the parental access level for the current media file.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * This method sets the current user's access level; this access level determines what media files the user can play back. Higher levels can play lower-level content; lower levels can't play higher-level content. For example, adults can watch child-safe content, but children can't watch adult content.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter provides no restriction on setting the parental level. DVD player applications can enforce restrictions on the parental level setting, such as providing password protection for raising the current parental level. Parental management in the DVD Navigator is disabled by default.
     * 
     * To disable parental management, pass 0xffffffff for <i>ulParentalLevel</i>. If parental management is disabled, then the player will play the first program chain (PGC) in a parental block regardless of parental IDs.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-parentallevelselect
     */
    ParentalLevelSelect(ulParentalLevel) {
        result := ComCall(30, this, "uint", ulParentalLevel, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the current country/region for controlling parental access levels.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * The ISO3166 2-letter country/region codes in the <i>wCountry</i> parameter must be supplied to this method as a WORD. The conversion is demonstrated for the United States (US) in the following line of code.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * WORD wCountry  =  ( WORD( 'U' ) &lt;&lt; 8 ) | 'S';
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Integer} wCountry Value that specifies the current country/region according to the Alpha-2 Code defined in ISO3166. See Remarks.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-parentalcountryselect
     */
    ParentalCountrySelect(wCountry) {
        result := ComCall(31, this, "ushort", wCountry, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the audio playback mode to karaoke.
     * @remarks
     * Karaoke support is currently not implemented.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulMode Requested audio playback mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-karaokeaudiopresentationmodechange
     */
    KaraokeAudioPresentationModeChange(ulMode) {
        result := ComCall(32, this, "uint", ulMode, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the video display mode the user prefers.
     * @remarks
     * This method changes the default video window's aspect ratio, and can also specify a default aspect ratio conversion mechanism.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, DVD_DOMAIN_Title, or DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulPreferredDisplayMode Value that specifies the new display mode for DVD content. Member of the [DVD_PREFERRED_DISPLAY_MODE](/windows/desktop/api/strmif/ne-strmif-dvd_preferred_display_mode) enumerated data type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-videomodepreferrence
     */
    VideoModePreferrence(ulPreferredDisplayMode) {
        result := ComCall(33, this, "uint", ulPreferredDisplayMode, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Sets the root directory containing the DVD-Video volume.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Stop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * If you haven't set the root directory before calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-titleplay">IDvdControl::TitlePlay</a>, the first drive starting from C: that contains a VIDEO_TS directory in the top level directory will be used as the root.
     * @param {PWSTR} pszPath Pointer to the directory name to set as the root directory.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-setroot
     */
    SetRoot(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(34, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects and activates a DVD button in response to a mouse click.
     * @remarks
     * This method checks the specified point within the display window to see if it is within a current DVD button's highlight rectangle. If it is, this method selects and then activates the button.
     * 
     * DVD buttons do not all necessarily have highlight rectangles. Button rectangles can overlap, and the rectangles do not always correspond to the visual representation of DVD buttons.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {POINT} point Specified point within the display window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-mouseactivate
     */
    MouseActivate(point) {
        result := ComCall(35, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Selects a DVD button in response to mouse movement.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * This method checks the specified point within the display window to see if it is within a current DVD button's highlight rectangle. If it is, this method selects the button.
     * 
     * DVD buttons do not all necessarily have highlight rectangles. Button rectangles can overlap, and the rectangles do not always correspond to the visual representation of DVD buttons.
     * @param {POINT} point Specified point within the display window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-mouseselect
     */
    MouseSelect(point) {
        result := ComCall(36, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdControl interface is deprecated. Use IDvdControl2 instread. Instructs the DVD player to start playing at the specified chapter within the specified title and play the number of chapters specified.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * Chapters range from 1 through 999. See EC_DVD_CHAPTER_AUTOSTOP in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-notification-codes">DVD Event Notification Codes</a> for more information.
     * @param {Integer} ulTitle Title number for playback.
     * @param {Integer} ulChapter Chapter number to start playback.
     * @param {Integer} ulChaptersToPlay Number of chapters to play from the start chapter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-chapterplayautostop
     */
    ChapterPlayAutoStop(ulTitle, ulChapter, ulChaptersToPlay) {
        result := ComCall(37, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "HRESULT")
        return result
    }
}
