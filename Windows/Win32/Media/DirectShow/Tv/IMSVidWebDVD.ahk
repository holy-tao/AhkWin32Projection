#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DVDTextStringType.ahk" { DVDTextStringType }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DVDMenuIDConstants.ahk" { DVDMenuIDConstants }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IMSVidPlayback.ahk" { IMSVidPlayback }
#Import ".\DVDSPExt.ahk" { DVDSPExt }
#Import ".\IMSVidRect.ahk" { IMSVidRect }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidWebDVD extends IMSVidPlayback {
    /**
     * The interface identifier for IMSVidWebDVD
     * @type {Guid}
     */
    static IID := Guid("{cf45f88b-ac56-4ee2-a73a-ed04e2885d3c}")

    /**
     * The class identifier for MSVidWebDVD
     * @type {Guid}
     */
    static CLSID := Guid("{011b3619-fe63-4814-8a84-15a194ce9ce3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidWebDVD interfaces
    */
    struct Vtbl extends IMSVidPlayback.Vtbl {
        OnDVDEvent                       : IntPtr
        PlayTitle                        : IntPtr
        PlayChapterInTitle               : IntPtr
        PlayChapter                      : IntPtr
        PlayChaptersAutoStop             : IntPtr
        PlayAtTime                       : IntPtr
        PlayAtTimeInTitle                : IntPtr
        PlayPeriodInTitleAutoStop        : IntPtr
        ReplayChapter                    : IntPtr
        PlayPrevChapter                  : IntPtr
        PlayNextChapter                  : IntPtr
        StillOff                         : IntPtr
        get_AudioLanguage                : IntPtr
        ShowMenu                         : IntPtr
        Resume                           : IntPtr
        ReturnFromSubmenu                : IntPtr
        get_ButtonsAvailable             : IntPtr
        get_CurrentButton                : IntPtr
        SelectAndActivateButton          : IntPtr
        ActivateButton                   : IntPtr
        SelectRightButton                : IntPtr
        SelectLeftButton                 : IntPtr
        SelectLowerButton                : IntPtr
        SelectUpperButton                : IntPtr
        ActivateAtPosition               : IntPtr
        SelectAtPosition                 : IntPtr
        get_ButtonAtPosition             : IntPtr
        get_NumberOfChapters             : IntPtr
        get_TotalTitleTime               : IntPtr
        get_TitlesAvailable              : IntPtr
        get_VolumesAvailable             : IntPtr
        get_CurrentVolume                : IntPtr
        get_CurrentDiscSide              : IntPtr
        get_CurrentDomain                : IntPtr
        get_CurrentChapter               : IntPtr
        get_CurrentTitle                 : IntPtr
        get_CurrentTime                  : IntPtr
        DVDTimeCode2bstr                 : IntPtr
        get_DVDDirectory                 : IntPtr
        put_DVDDirectory                 : IntPtr
        IsSubpictureStreamEnabled        : IntPtr
        IsAudioStreamEnabled             : IntPtr
        get_CurrentSubpictureStream      : IntPtr
        put_CurrentSubpictureStream      : IntPtr
        get_SubpictureLanguage           : IntPtr
        get_CurrentAudioStream           : IntPtr
        put_CurrentAudioStream           : IntPtr
        get_AudioStreamsAvailable        : IntPtr
        get_AnglesAvailable              : IntPtr
        get_CurrentAngle                 : IntPtr
        put_CurrentAngle                 : IntPtr
        get_SubpictureStreamsAvailable   : IntPtr
        get_SubpictureOn                 : IntPtr
        put_SubpictureOn                 : IntPtr
        get_DVDUniqueID                  : IntPtr
        AcceptParentalLevelChange        : IntPtr
        NotifyParentalLevelChange        : IntPtr
        SelectParentalCountry            : IntPtr
        SelectParentalLevel              : IntPtr
        get_TitleParentalLevels          : IntPtr
        get_PlayerParentalCountry        : IntPtr
        get_PlayerParentalLevel          : IntPtr
        Eject                            : IntPtr
        UOPValid                         : IntPtr
        get_SPRM                         : IntPtr
        get_GPRM                         : IntPtr
        put_GPRM                         : IntPtr
        get_DVDTextStringType            : IntPtr
        get_DVDTextString                : IntPtr
        get_DVDTextNumberOfStrings       : IntPtr
        get_DVDTextNumberOfLanguages     : IntPtr
        get_DVDTextLanguageLCID          : IntPtr
        RegionChange                     : IntPtr
        get_DVDAdm                       : IntPtr
        DeleteBookmark                   : IntPtr
        RestoreBookmark                  : IntPtr
        SaveBookmark                     : IntPtr
        SelectDefaultAudioLanguage       : IntPtr
        SelectDefaultSubpictureLanguage  : IntPtr
        get_PreferredSubpictureStream    : IntPtr
        get_DefaultMenuLanguage          : IntPtr
        put_DefaultMenuLanguage          : IntPtr
        get_DefaultSubpictureLanguage    : IntPtr
        get_DefaultAudioLanguage         : IntPtr
        get_DefaultSubpictureLanguageExt : IntPtr
        get_DefaultAudioLanguageExt      : IntPtr
        get_LanguageFromLCID             : IntPtr
        get_KaraokeAudioPresentationMode : IntPtr
        put_KaraokeAudioPresentationMode : IntPtr
        get_KaraokeChannelContent        : IntPtr
        get_KaraokeChannelAssignment     : IntPtr
        RestorePreferredSettings         : IntPtr
        get_ButtonRect                   : IntPtr
        get_DVDScreenInMouseCoordinates  : IntPtr
        put_DVDScreenInMouseCoordinates  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidWebDVD.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ButtonsAvailable {
        get => this.get_ButtonsAvailable()
    }

    /**
     * @type {Integer} 
     */
    CurrentButton {
        get => this.get_CurrentButton()
    }

    /**
     * @type {BSTR} 
     */
    TotalTitleTime {
        get => this.get_TotalTitleTime()
    }

    /**
     * @type {Integer} 
     */
    TitlesAvailable {
        get => this.get_TitlesAvailable()
    }

    /**
     * @type {Integer} 
     */
    VolumesAvailable {
        get => this.get_VolumesAvailable()
    }

    /**
     * @type {Integer} 
     */
    CurrentVolume {
        get => this.get_CurrentVolume()
    }

    /**
     * @type {Integer} 
     */
    CurrentDiscSide {
        get => this.get_CurrentDiscSide()
    }

    /**
     * @type {Integer} 
     */
    CurrentDomain {
        get => this.get_CurrentDomain()
    }

    /**
     * @type {Integer} 
     */
    CurrentChapter {
        get => this.get_CurrentChapter()
    }

    /**
     * @type {Integer} 
     */
    CurrentTitle {
        get => this.get_CurrentTitle()
    }

    /**
     * @type {BSTR} 
     */
    CurrentTime {
        get => this.get_CurrentTime()
    }

    /**
     * @type {BSTR} 
     */
    DVDDirectory {
        get => this.get_DVDDirectory()
        set => this.put_DVDDirectory(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentSubpictureStream {
        get => this.get_CurrentSubpictureStream()
        set => this.put_CurrentSubpictureStream(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentAudioStream {
        get => this.get_CurrentAudioStream()
        set => this.put_CurrentAudioStream(value)
    }

    /**
     * @type {Integer} 
     */
    AudioStreamsAvailable {
        get => this.get_AudioStreamsAvailable()
    }

    /**
     * @type {Integer} 
     */
    AnglesAvailable {
        get => this.get_AnglesAvailable()
    }

    /**
     * @type {Integer} 
     */
    CurrentAngle {
        get => this.get_CurrentAngle()
        set => this.put_CurrentAngle(value)
    }

    /**
     * @type {Integer} 
     */
    SubpictureStreamsAvailable {
        get => this.get_SubpictureStreamsAvailable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SubpictureOn {
        get => this.get_SubpictureOn()
        set => this.put_SubpictureOn(value)
    }

    /**
     * @type {BSTR} 
     */
    DVDUniqueID {
        get => this.get_DVDUniqueID()
    }

    /**
     * @type {Integer} 
     */
    PlayerParentalCountry {
        get => this.get_PlayerParentalCountry()
    }

    /**
     * @type {Integer} 
     */
    PlayerParentalLevel {
        get => this.get_PlayerParentalLevel()
    }

    /**
     * @type {Integer} 
     */
    DVDTextNumberOfLanguages {
        get => this.get_DVDTextNumberOfLanguages()
    }

    /**
     * @type {IDispatch} 
     */
    DVDAdm {
        get => this.get_DVDAdm()
    }

    /**
     * @type {Integer} 
     */
    PreferredSubpictureStream {
        get => this.get_PreferredSubpictureStream()
    }

    /**
     * @type {Integer} 
     */
    DefaultMenuLanguage {
        get => this.get_DefaultMenuLanguage()
        set => this.put_DefaultMenuLanguage(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultSubpictureLanguage {
        get => this.get_DefaultSubpictureLanguage()
    }

    /**
     * @type {Integer} 
     */
    DefaultAudioLanguage {
        get => this.get_DefaultAudioLanguage()
    }

    /**
     * @type {DVDSPExt} 
     */
    DefaultSubpictureLanguageExt {
        get => this.get_DefaultSubpictureLanguageExt()
    }

    /**
     * @type {Integer} 
     */
    DefaultAudioLanguageExt {
        get => this.get_DefaultAudioLanguageExt()
    }

    /**
     * @type {Integer} 
     */
    KaraokeAudioPresentationMode {
        get => this.get_KaraokeAudioPresentationMode()
        set => this.put_KaraokeAudioPresentationMode(value)
    }

    /**
     * @type {IMSVidRect} 
     */
    DVDScreenInMouseCoordinates {
        get => this.get_DVDScreenInMouseCoordinates()
        set => this.put_DVDScreenInMouseCoordinates(value)
    }

    /**
     * 
     * @param {Integer} lEvent 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     */
    OnDVDEvent(lEvent, lParam1, lParam2) {
        result := ComCall(32, this, "int", lEvent, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }

    /**
     * The PlayTitle method starts playback at the beginning of the specified title.
     * @param {Integer} lTitle 
     * @returns {HRESULT} <span id="iTitle"></span><span id="ititle"></span><span id="ITITLE"></span>*iTitle*
     * 
     * Specifies the title as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playtitle-method
     */
    PlayTitle(lTitle) {
        result := ComCall(33, this, "int", lTitle, "HRESULT")
        return result
    }

    /**
     * The PlayChapterInTitle method plays the specified chapter in the specified title.
     * @remarks
     * This method starts playback at the specified chapter and then continues playing indefinitely. If you want to play only a particular chapter, use [**PlayChaptersAutoStop**](playchaptersautostop-method.md).
     * @param {Integer} lTitle 
     * @param {Integer} lChapter 
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
    PlayChapterInTitle(lTitle, lChapter) {
        result := ComCall(34, this, "int", lTitle, "int", lChapter, "HRESULT")
        return result
    }

    /**
     * The PlayChapter method starts playback from the specified chapter within the current title.
     * @remarks
     * When the end of the specified chapter is reached, this method continues playing subsequent chapters, if any exist. If you want to play only a specified chapter, use [**PlayChaptersAutoStop**](playchaptersautostop-method.md).
     * @param {Integer} lChapter 
     * @returns {HRESULT} <span id="iChapter"></span><span id="ichapter"></span><span id="ICHAPTER"></span>*iChapter*
     * 
     * Specifies the chapter index in the current title as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playchapter-method
     */
    PlayChapter(lChapter) {
        result := ComCall(35, this, "int", lChapter, "HRESULT")
        return result
    }

    /**
     * The PlayChaptersAutoStop method starts playback at the specified chapter in the specified title and for the number of chapters specified.
     * @remarks
     * When the last chapter has played, this method causes an [**EC\_DVD\_CHAPTER\_AUTOSTOP**](ec-dvd-chapter-autostop.md) event notification to be sent to the application.
     * @param {Integer} lTitle 
     * @param {Integer} lstrChapter 
     * @param {Integer} lChapterCount 
     * @returns {HRESULT} <span id="iTitle"></span><span id="ititle"></span><span id="ITITLE"></span>*iTitle*
     * 
     * Specifies the title as an Integer value.
     * 
     * 
     * <span id="iChapter"></span><span id="ichapter"></span><span id="ICHAPTER"></span>*iChapter*
     * 
     * Specifies the start chapter as an Integer value.
     * 
     * 
     * <span id="iChapterCount"></span><span id="ichaptercount"></span><span id="ICHAPTERCOUNT"></span>*iChapterCount*
     * 
     * Specifies the number of chapters to play as an Integer value.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playchaptersautostop-method
     */
    PlayChaptersAutoStop(lTitle, lstrChapter, lChapterCount) {
        result := ComCall(36, this, "int", lTitle, "int", lstrChapter, "int", lChapterCount, "HRESULT")
        return result
    }

    /**
     * The PlayAtTime method starts playback in the current title at the specified time.
     * @param {BSTR} strTime 
     * @returns {HRESULT} <span id="sTime"></span><span id="stime"></span><span id="STIME"></span>*sTime*
     * 
     * Specifies the time at which to start playing as a string. The string must be in the format "hh:mm:ss:ff" (specifying hours, minutes, seconds, frames).
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playattime-method
     */
    PlayAtTime(strTime) {
        strTime := strTime is String ? BSTR.Alloc(strTime).Value : strTime

        result := ComCall(37, this, BSTR, strTime, "HRESULT")
        return result
    }

    /**
     * The PlayAtTimeInTitle method starts playback at the specified time within the specified title.
     * @param {Integer} lTitle 
     * @param {BSTR} strTime 
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
    PlayAtTimeInTitle(lTitle, strTime) {
        strTime := strTime is String ? BSTR.Alloc(strTime).Value : strTime

        result := ComCall(38, this, "int", lTitle, BSTR, strTime, "HRESULT")
        return result
    }

    /**
     * The PlayPeriodInTitleAutoStop method starts playback at the specified time in the specified title until the specified stop time.
     * @param {Integer} lTitle 
     * @param {BSTR} strStartTime 
     * @param {BSTR} strEndTime 
     * @returns {HRESULT} <span id="iTitle"></span><span id="ititle"></span><span id="ITITLE"></span>*iTitle*
     * 
     * Specifies the title as an Integer.
     * 
     * 
     * <span id="sStartTime"></span><span id="sstarttime"></span><span id="SSTARTTIME"></span>*sStartTime*
     * 
     * Specifies the start time as a string in "hh:mm:ss:ff" format (specifying hours, minutes, seconds, frames).
     * 
     * 
     * <span id="sEndTime"></span><span id="sendtime"></span><span id="SENDTIME"></span>*sEndTime*
     * 
     * Specifies the end time as a String in "hh:mm:ss:ff" format.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playperiodintitleautostop-method
     */
    PlayPeriodInTitleAutoStop(lTitle, strStartTime, strEndTime) {
        strStartTime := strStartTime is String ? BSTR.Alloc(strStartTime).Value : strStartTime
        strEndTime := strEndTime is String ? BSTR.Alloc(strEndTime).Value : strEndTime

        result := ComCall(39, this, "int", lTitle, BSTR, strStartTime, BSTR, strEndTime, "HRESULT")
        return result
    }

    /**
     * The ReplayChapter method starts playback at the beginning of the current chapter.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/replaychapter-method
     */
    ReplayChapter() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * The PlayPrevChapter method starts playback from the previous chapter in the current title.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playprevchapter-method
     */
    PlayPrevChapter() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * The PlayNextChapter method starts playback from the next chapter in the current title.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/playnextchapter-method
     */
    PlayNextChapter() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * The StillOff method resumes playback, canceling still mode.
     * @remarks
     * The [DVD Navigator](dvd-navigator-filter.md) goes into still mode when it encounters a still frame authored on the disc. It notifies your application by sending an EC\_DVD\_STILL\_ON event. Still mode is different from the DVD Navigator being in a paused state because of a user operation. Calling `StillOff` resumes playback from still mode but does not restart the DVD Navigator when it is in a paused state.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/stilloff-method
     */
    StillOff() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {VARIANT_BOOL} fFormat 
     * @returns {BSTR} 
     */
    get_AudioLanguage(lStream, fFormat) {
        strAudioLang := BSTR.Owned()
        result := ComCall(44, this, "int", lStream, VARIANT_BOOL, fFormat, BSTR.Ptr, strAudioLang, "HRESULT")
        return strAudioLang
    }

    /**
     * The ShowMenu method displays the specified menu on the screen.
     * @remarks
     * DVD menu names can be somewhat confusing. The title menu is another name for the Video Manager Menu, the main menu for the entire disc; it generally lists all the video title sets available on the disc. The root menu is the menu for one video title set, which can contain one title or a group of titles. All the titles in a title set share the same Subpicture, Audio, and Angle menus.
     * @param {DVDMenuIDConstants} MenuID 
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
    ShowMenu(MenuID) {
        result := ComCall(45, this, DVDMenuIDConstants, MenuID, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * The ReturnFromSubmenu method returns display from a submenu to its parent menu, or to the current title if the menu is a top-level menu.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/returnfromsubmenu-method
     */
    ReturnFromSubmenu() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ButtonsAvailable() {
        result := ComCall(48, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentButton() {
        result := ComCall(49, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The SelectAndActivateButton method selects and activates the specified button.
     * @remarks
     * Use this method when implementing custom mouse handling after setting [**DisableAutoMouseProcessing**](disableautomouseprocessing-property.md) to **true**.
     * 
     * This method highlights the specified button and activate it automatically.
     * @param {Integer} lButton 
     * @returns {HRESULT} <span id="iButton"></span><span id="ibutton"></span><span id="IBUTTON"></span>*iButton*
     * 
     * Specifies the button as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectandactivatebutton-method
     */
    SelectAndActivateButton(lButton) {
        result := ComCall(50, this, "int", lButton, "HRESULT")
        return result
    }

    /**
     * The ActivateButton method activates the selected menu button.
     * @remarks
     * Use this method when implementing custom mouse handling after setting [**DisableAutoMouseProcessing**](disableautomouseprocessing-property.md) to **true**.
     * 
     * Use this method to activate a button that has been selected through the [**SelectLeftButton**](selectleftbutton-method.md), [**SelectLowerButton**](selectlowerbutton-method.md), [**SelectUpperButton**](selectupperbutton-method.md), or [**SelectRightButton**](selectrightbutton-method.md) method.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/activatebutton-method
     */
    ActivateButton() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    /**
     * The SelectRightButton method selects the right directional button from the displayed menu.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectrightbutton-method
     */
    SelectRightButton() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    /**
     * The SelectLeftButton method selects the left directional button from the displayed menu.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectleftbutton-method
     */
    SelectLeftButton() {
        result := ComCall(53, this, "HRESULT")
        return result
    }

    /**
     * The SelectLowerButton method selects the lower directional button from the displayed menu.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectlowerbutton-method
     */
    SelectLowerButton() {
        result := ComCall(54, this, "HRESULT")
        return result
    }

    /**
     * The SelectUpperButton method selects the upper directional button from the displayed menu.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectupperbutton-method
     */
    SelectUpperButton() {
        result := ComCall(55, this, "HRESULT")
        return result
    }

    /**
     * The ActivateAtPosition method activates the menu button at the specified position.
     * @remarks
     * Use this method when implementing custom mouse handling after setting [**DisableAutoMouseProcessing**](disableautomouseprocessing-property.md) to **true**.
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} <span id="xPos"></span><span id="xpos"></span><span id="XPOS"></span>*xPos*
     * 
     * Specifies x-coordinate as an Integer.
     * 
     * 
     * <span id="yPos"></span><span id="ypos"></span><span id="YPOS"></span>*yPos*
     * 
     * Specifies the y-coordinate as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/activateatposition-method
     */
    ActivateAtPosition(xPos, yPos) {
        result := ComCall(56, this, "int", xPos, "int", yPos, "HRESULT")
        return result
    }

    /**
     * The SelectAtPosition method selects the menu button at the specified mouse pointer coordinates.
     * @remarks
     * Use this method when implementing custom mouse handling after setting [**DisableAutoMouseProcessing**](disableautomouseprocessing-property.md) to **true**.
     * 
     * Selecting merely highlights the button. To send the command associated with a button that has been selected, call [**ActivateButton**](activatebutton-method.md).
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} <span id="xPos"></span><span id="xpos"></span><span id="XPOS"></span>*xPos*
     * 
     * Specifies the x-coordinate as an Integer.
     * 
     * 
     * <span id="yPos"></span><span id="ypos"></span><span id="YPOS"></span>*yPos*
     * 
     * Specifies the y-coordinate as an Integer.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectatposition-method
     */
    SelectAtPosition(xPos, yPos) {
        result := ComCall(57, this, "int", xPos, "int", yPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {Integer} 
     */
    get_ButtonAtPosition(xPos, yPos) {
        result := ComCall(58, this, "int", xPos, "int", yPos, "int*", &plButton := 0, "HRESULT")
        return plButton
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @returns {Integer} 
     */
    get_NumberOfChapters(lTitle) {
        result := ComCall(59, this, "int", lTitle, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TotalTitleTime() {
        pVal := BSTR.Owned()
        result := ComCall(60, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TitlesAvailable() {
        result := ComCall(61, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VolumesAvailable() {
        result := ComCall(62, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentVolume() {
        result := ComCall(63, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentDiscSide() {
        result := ComCall(64, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentDomain() {
        result := ComCall(65, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentChapter() {
        result := ComCall(66, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentTitle() {
        result := ComCall(67, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CurrentTime() {
        pVal := BSTR.Owned()
        result := ComCall(68, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The DVDTimeCode2bstr method retrieves a string indicating the current time on the disc.
     * @remarks
     * This method is read only.
     * @param {Integer} _timeCode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/dvdtimecode2bstr-method
     */
    DVDTimeCode2bstr(_timeCode) {
        pTimeStr := BSTR.Owned()
        result := ComCall(69, this, "int", _timeCode, BSTR.Ptr, pTimeStr, "HRESULT")
        return pTimeStr
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DVDDirectory() {
        pVal := BSTR.Owned()
        result := ComCall(70, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DVDDirectory(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(71, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * The IsSubpictureStreamEnabled method retrieves a value indicating whether the specified subpicture stream is enabled in the current title.
     * @remarks
     * Although a disc can contain up to 32 subpicture streams, each stream is not necessarily available for each title. Always verify that a stream is available for a title before setting the [**CurrentSubpictureStream**](currentsubpicturestream-property.md) property.
     * @param {Integer} lstream 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/issubpicturestreamenabled-method
     */
    IsSubpictureStreamEnabled(lstream) {
        result := ComCall(72, this, "int", lstream, VARIANT_BOOL.Ptr, &fEnabled := 0, "HRESULT")
        return fEnabled
    }

    /**
     * The IsAudioStreamEnabled method retrieves a value indicating whether the specified audio stream is enabled in the current title.
     * @remarks
     * Although a disc can contain up to eight independent audio streams, each stream is not necessarily available for each title. For example, a main movie title might have three audio streams for English, Spanish, and Japanese, but the "Coming Attractions" title might have only one audio stream in English. Always verify that a stream is available for a title before setting the [**CurrentAudioStream**](currentaudiostream-property.md) property.
     * @param {Integer} lstream 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/isaudiostreamenabled-method
     */
    IsAudioStreamEnabled(lstream) {
        result := ComCall(73, this, "int", lstream, VARIANT_BOOL.Ptr, &fEnabled := 0, "HRESULT")
        return fEnabled
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentSubpictureStream() {
        result := ComCall(74, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentSubpictureStream(newVal) {
        result := ComCall(75, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @returns {BSTR} 
     */
    get_SubpictureLanguage(lStream) {
        strLanguage := BSTR.Owned()
        result := ComCall(76, this, "int", lStream, BSTR.Ptr, strLanguage, "HRESULT")
        return strLanguage
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentAudioStream() {
        result := ComCall(77, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentAudioStream(newVal) {
        result := ComCall(78, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioStreamsAvailable() {
        result := ComCall(79, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AnglesAvailable() {
        result := ComCall(80, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentAngle() {
        result := ComCall(81, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentAngle(newVal) {
        result := ComCall(82, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubpictureStreamsAvailable() {
        result := ComCall(83, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SubpictureOn() {
        result := ComCall(84, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_SubpictureOn(newVal) {
        result := ComCall(85, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DVDUniqueID() {
        pVal := BSTR.Owned()
        result := ComCall(86, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The AcceptParentalLevelChange method accepts or rejects the new temporary parental management level.
     * @remarks
     * Call this method in response to an EC\_DVD\_PARENTAL\_LEVEL\_CHANGE event notification to specify whether the DVD Navigator should play the content with the new parental level, or branch to where the disc specifies if the new level is rejected.
     * @param {VARIANT_BOOL} fAccept 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} <span id="bAccept"></span><span id="baccept"></span><span id="BACCEPT"></span>*bAccept*
     * 
     * Specifies the new parental level as a Boolean value.
     * 
     * 
     * 
     * | Value | Description                               |
     * |-------|-------------------------------------------|
     * | true  | Accept the new parental management level. |
     * | false | Reject the new parental management level. |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/acceptparentallevelchange-method
     */
    AcceptParentalLevelChange(fAccept, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(87, this, VARIANT_BOOL, fAccept, BSTR, strUserName, BSTR, strPassword, "HRESULT")
        return result
    }

    /**
     * The NotifyParentalLevelChange method enables or disables the event handling for temporary parental management level commands.
     * @remarks
     * Parental management notifications are disabled by default. This means that temporary parental commands from the disc are allowed but ignored and disc will play without interruption. Call this method during initialization of your application if you need to handle temporary parental management level commands from the disc. To disable parental management after it is enabled, call this method with an argument of false. For more details on parental management, see [**AcceptParentalLevelChange**](acceptparentallevelchange-method.md).
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} <span id="bNotify"></span><span id="bnotify"></span><span id="BNOTIFY"></span>*bNotify*
     * 
     * Specifies a Boolean value indicating whether or not the application is notified when the MSWebDVD object encounters video segments with a rating more restrictive than the overall rating for the disc.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/notifyparentallevelchange-method
     */
    NotifyParentalLevelChange(newVal) {
        result := ComCall(88, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * The SelectParentalCountry method sets the specified parental country/region for subsequent playback.
     * @remarks
     * The parental country/region determines how the parental levels are interpreted.
     * @param {Integer} lCountry 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} <span id="iCountry"></span><span id="icountry"></span><span id="ICOUNTRY"></span>*iCountry*
     * 
     * Specifies the country/region as an Integer.
     * 
     * 
     * <span id="sUserName"></span><span id="susername"></span><span id="SUSERNAME"></span>*sUserName*
     * 
     * Specifies the current logged-on user as a String. (Currently ignored.)
     * 
     * 
     * <span id="sPassword"></span><span id="spassword"></span><span id="SPASSWORD"></span>*sPassword*
     * 
     * Specifies the application password String.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectparentalcountry-method
     */
    SelectParentalCountry(lCountry, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(89, this, "int", lCountry, BSTR, strUserName, BSTR, strPassword, "HRESULT")
        return result
    }

    /**
     * The SelectParentalLevel method sets the specified parental level for subsequent playback.
     * @remarks
     * This method sets the access level in the MSWebDVD object, which determines what content the user can play back. Higher levels can play lower-level content but lower levels can't play higher-level content. The exact meaning of the eight DVD parental management levels varies depending on the country/region. In the United States and Canada, the levels are mapped to the Motion Picture Association of America (MPAA) rating categories. Parental management in the DVD Navigator is disabled by default.
     * @param {Integer} lParentalLevel 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} <span id="iLevel"></span><span id="ilevel"></span><span id="ILEVEL"></span>*iLevel*
     * 
     * Specifies the parental management level as an Integer. To enable the parental management, the *iLevel* parameter must range from 1 through 8. To disable the parental management, set *iLevel* to -1.
     * 
     * 
     * <span id="sUserName"></span><span id="susername"></span><span id="SUSERNAME"></span>*sUserName*
     * 
     * Specifies the current user as a String. (Currently ignored.)
     * 
     * 
     * <span id="sPassword"></span><span id="spassword"></span><span id="SPASSWORD"></span>*sPassword*
     * 
     * Specifies the password currently stored in the registry as a String.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectparentallevel-method
     */
    SelectParentalLevel(lParentalLevel, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(90, this, "int", lParentalLevel, BSTR, strUserName, BSTR, strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @returns {Integer} 
     */
    get_TitleParentalLevels(lTitle) {
        result := ComCall(91, this, "int", lTitle, "int*", &plParentalLevels := 0, "HRESULT")
        return plParentalLevels
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlayerParentalCountry() {
        result := ComCall(92, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlayerParentalLevel() {
        result := ComCall(93, this, "int*", &plParentalLevel := 0, "HRESULT")
        return plParentalLevel
    }

    /**
     * The Eject method ejects or inserts a disc from or into the DVD drive.
     * @remarks
     * On some DVD drives, this method acts as a toggle, ejecting and inserting on alternate calls. This is hardware-dependent.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/eject-method
     */
    Eject() {
        result := ComCall(94, this, "HRESULT")
        return result
    }

    /**
     * The UOPValid method retrieves a value that indicates whether the specified user operation (UOP) is currently valid.
     * @param {Integer} lUOP 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/uopvalid-method
     */
    UOPValid(lUOP) {
        result := ComCall(95, this, "int", lUOP, VARIANT_BOOL.Ptr, &pfValid := 0, "HRESULT")
        return pfValid
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    get_SPRM(lIndex) {
        result := ComCall(96, this, "int", lIndex, "short*", &psSPRM := 0, "HRESULT")
        return psSPRM
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    get_GPRM(lIndex) {
        result := ComCall(97, this, "int", lIndex, "short*", &psSPRM := 0, "HRESULT")
        return psSPRM
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} sValue 
     * @returns {HRESULT} 
     */
    put_GPRM(lIndex, sValue) {
        result := ComCall(98, this, "int", lIndex, "short", sValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Integer} lStringIndex 
     * @returns {DVDTextStringType} 
     */
    get_DVDTextStringType(lLangIndex, lStringIndex) {
        result := ComCall(99, this, "int", lLangIndex, "int", lStringIndex, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Integer} lStringIndex 
     * @returns {BSTR} 
     */
    get_DVDTextString(lLangIndex, lStringIndex) {
        pstrText := BSTR.Owned()
        result := ComCall(100, this, "int", lLangIndex, "int", lStringIndex, BSTR.Ptr, pstrText, "HRESULT")
        return pstrText
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @returns {Integer} 
     */
    get_DVDTextNumberOfStrings(lLangIndex) {
        result := ComCall(101, this, "int", lLangIndex, "int*", &plNumOfStrings := 0, "HRESULT")
        return plNumOfStrings
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DVDTextNumberOfLanguages() {
        result := ComCall(102, this, "int*", &plNumOfLangs := 0, "HRESULT")
        return plNumOfLangs
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @returns {Integer} 
     */
    get_DVDTextLanguageLCID(lLangIndex) {
        result := ComCall(103, this, "int", lLangIndex, "int*", &lcid := 0, "HRESULT")
        return lcid
    }

    /**
     * The RegionChange method displays a system dialog box that enables the user to change the region associated with the DVD drive.
     * @remarks
     * The region for a DVD drive can be changed only five times.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/regionchange-method
     */
    RegionChange() {
        result := ComCall(104, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_DVDAdm() {
        result := ComCall(105, this, "ptr*", &pVal := 0, "HRESULT")
        return IDispatch(pVal)
    }

    /**
     * The DeleteBookmark method deletes the saved bookmark.
     * @remarks
     * There can only be one bookmark at a time.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/deletebookmark-method
     */
    DeleteBookmark() {
        result := ComCall(106, this, "HRESULT")
        return result
    }

    /**
     * The RestoreBookmark method moves the MSWebDVD object to the point on the disc as specified in the current bookmark, with all audio, video, and subpicture settings restored.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/restorebookmark-method
     */
    RestoreBookmark() {
        result := ComCall(107, this, "HRESULT")
        return result
    }

    /**
     * The SaveBookmark method saves the current disc position and state of the MSWebDVD object so the user can return to the same place later.
     * @remarks
     * A bookmark is a snapshot of the DVD Navigator's current state. This includes information such as where it is playing on the disc, and which audio and subpictures streams are selected. By saving a bookmark, the user can close the application, shut down the computer, and come back later to continue viewing the disc right where he or she left off, with all settings just as they were before. Only one bookmark can be saved at any given time. When you call `SaveBookmark`, the old bookmark is overwritten.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/savebookmark-method
     */
    SaveBookmark() {
        result := ComCall(108, this, "HRESULT")
        return result
    }

    /**
     * The SelectDefaultAudioLanguage method sets the current default audio language in the MSWebDVD object.
     * @param {Integer} lang 
     * @param {Integer} ext 
     * @returns {HRESULT} <span id="iLang"></span><span id="ilang"></span><span id="ILANG"></span>*iLang*
     * 
     * Specifies the language as an Integer LCID value.
     * 
     * 
     * <span id="iExt"></span><span id="iext"></span><span id="IEXT"></span>*iExt*
     * 
     * Specifies the DVD audio language extension as an integer value.
     * 
     * 
     * 
     * | Value | Description       |
     * |-------|-------------------|
     * | 0     | NotSpecified      |
     * | 1     | Captions          |
     * | 2     | VisuallyImpaired  |
     * | 3     | DirectorComments1 |
     * | 4     | DirectorComments2 |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectdefaultaudiolanguage-method
     */
    SelectDefaultAudioLanguage(lang, ext) {
        result := ComCall(109, this, "int", lang, "int", ext, "HRESULT")
        return result
    }

    /**
     * The SelectDefaultSubpictureLanguage method sets the current default subpicture language in the MSWebDVD object.
     * @remarks
     * The subpicture language extension provides further information about the subpicture.
     * @param {Integer} lang 
     * @param {DVDSPExt} ext 
     * @returns {HRESULT} <span id="iLang"></span><span id="ilang"></span><span id="ILANG"></span>*iLang*
     * 
     * Specifies the language as an Integer.
     * 
     * 
     * <span id="iExt"></span><span id="iext"></span><span id="IEXT"></span>*iExt*
     * 
     * Specifies the subpicture language extension as an Integer.
     * 
     * 
     * 
     * | Value | Description                    |
     * |-------|--------------------------------|
     * | 0     | Extension Not Specified        |
     * | 1     | Normal Captions                |
     * | 2     | Big Captions                   |
     * | 3     | Children's Captions            |
     * | 5     | Normal Closed Captions         |
     * | 6     | Big Closed Captions            |
     * | 7     | Children's Closed Captions     |
     * | 9     | Forced                         |
     * | 13    | Normal Director's Comments     |
     * | 14    | Big Director's Comments        |
     * | 15    | Children's Director's Comments |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/selectdefaultsubpicturelanguage-method
     */
    SelectDefaultSubpictureLanguage(lang, ext) {
        result := ComCall(110, this, "int", lang, DVDSPExt, ext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredSubpictureStream() {
        result := ComCall(111, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultMenuLanguage() {
        result := ComCall(112, this, "int*", &lang := 0, "HRESULT")
        return lang
    }

    /**
     * 
     * @param {Integer} lang 
     * @returns {HRESULT} 
     */
    put_DefaultMenuLanguage(lang) {
        result := ComCall(113, this, "int", lang, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSubpictureLanguage() {
        result := ComCall(114, this, "int*", &lang := 0, "HRESULT")
        return lang
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLanguage() {
        result := ComCall(115, this, "int*", &lang := 0, "HRESULT")
        return lang
    }

    /**
     * 
     * @returns {DVDSPExt} 
     */
    get_DefaultSubpictureLanguageExt() {
        result := ComCall(116, this, "int*", &ext := 0, "HRESULT")
        return ext
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLanguageExt() {
        result := ComCall(117, this, "int*", &ext := 0, "HRESULT")
        return ext
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {BSTR} 
     */
    get_LanguageFromLCID(lcid) {
        lang := BSTR.Owned()
        result := ComCall(118, this, "int", lcid, BSTR.Ptr, lang, "HRESULT")
        return lang
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KaraokeAudioPresentationMode() {
        result := ComCall(119, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_KaraokeAudioPresentationMode(newVal) {
        result := ComCall(120, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {Integer} lChan 
     * @returns {Integer} 
     */
    get_KaraokeChannelContent(lStream, lChan) {
        result := ComCall(121, this, "int", lStream, "int", lChan, "int*", &lContent := 0, "HRESULT")
        return lContent
    }

    /**
     * 
     * @param {Integer} lStream 
     * @returns {Integer} 
     */
    get_KaraokeChannelAssignment(lStream) {
        result := ComCall(122, this, "int", lStream, "int*", &lChannelAssignment := 0, "HRESULT")
        return lChannelAssignment
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestorePreferredSettings() {
        result := ComCall(123, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButton 
     * @returns {IMSVidRect} 
     */
    get_ButtonRect(lButton) {
        result := ComCall(124, this, "int", lButton, "ptr*", &pRect := 0, "HRESULT")
        return IMSVidRect(pRect)
    }

    /**
     * 
     * @returns {IMSVidRect} 
     */
    get_DVDScreenInMouseCoordinates() {
        result := ComCall(125, this, "ptr*", &ppRect := 0, "HRESULT")
        return IMSVidRect(ppRect)
    }

    /**
     * 
     * @param {IMSVidRect} pRect 
     * @returns {HRESULT} 
     */
    put_DVDScreenInMouseCoordinates(pRect) {
        result := ComCall(126, this, "ptr", pRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidWebDVD.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDVDEvent := CallbackCreate(GetMethod(implObj, "OnDVDEvent"), flags, 4)
        this.vtbl.PlayTitle := CallbackCreate(GetMethod(implObj, "PlayTitle"), flags, 2)
        this.vtbl.PlayChapterInTitle := CallbackCreate(GetMethod(implObj, "PlayChapterInTitle"), flags, 3)
        this.vtbl.PlayChapter := CallbackCreate(GetMethod(implObj, "PlayChapter"), flags, 2)
        this.vtbl.PlayChaptersAutoStop := CallbackCreate(GetMethod(implObj, "PlayChaptersAutoStop"), flags, 4)
        this.vtbl.PlayAtTime := CallbackCreate(GetMethod(implObj, "PlayAtTime"), flags, 2)
        this.vtbl.PlayAtTimeInTitle := CallbackCreate(GetMethod(implObj, "PlayAtTimeInTitle"), flags, 3)
        this.vtbl.PlayPeriodInTitleAutoStop := CallbackCreate(GetMethod(implObj, "PlayPeriodInTitleAutoStop"), flags, 4)
        this.vtbl.ReplayChapter := CallbackCreate(GetMethod(implObj, "ReplayChapter"), flags, 1)
        this.vtbl.PlayPrevChapter := CallbackCreate(GetMethod(implObj, "PlayPrevChapter"), flags, 1)
        this.vtbl.PlayNextChapter := CallbackCreate(GetMethod(implObj, "PlayNextChapter"), flags, 1)
        this.vtbl.StillOff := CallbackCreate(GetMethod(implObj, "StillOff"), flags, 1)
        this.vtbl.get_AudioLanguage := CallbackCreate(GetMethod(implObj, "get_AudioLanguage"), flags, 4)
        this.vtbl.ShowMenu := CallbackCreate(GetMethod(implObj, "ShowMenu"), flags, 2)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.ReturnFromSubmenu := CallbackCreate(GetMethod(implObj, "ReturnFromSubmenu"), flags, 1)
        this.vtbl.get_ButtonsAvailable := CallbackCreate(GetMethod(implObj, "get_ButtonsAvailable"), flags, 2)
        this.vtbl.get_CurrentButton := CallbackCreate(GetMethod(implObj, "get_CurrentButton"), flags, 2)
        this.vtbl.SelectAndActivateButton := CallbackCreate(GetMethod(implObj, "SelectAndActivateButton"), flags, 2)
        this.vtbl.ActivateButton := CallbackCreate(GetMethod(implObj, "ActivateButton"), flags, 1)
        this.vtbl.SelectRightButton := CallbackCreate(GetMethod(implObj, "SelectRightButton"), flags, 1)
        this.vtbl.SelectLeftButton := CallbackCreate(GetMethod(implObj, "SelectLeftButton"), flags, 1)
        this.vtbl.SelectLowerButton := CallbackCreate(GetMethod(implObj, "SelectLowerButton"), flags, 1)
        this.vtbl.SelectUpperButton := CallbackCreate(GetMethod(implObj, "SelectUpperButton"), flags, 1)
        this.vtbl.ActivateAtPosition := CallbackCreate(GetMethod(implObj, "ActivateAtPosition"), flags, 3)
        this.vtbl.SelectAtPosition := CallbackCreate(GetMethod(implObj, "SelectAtPosition"), flags, 3)
        this.vtbl.get_ButtonAtPosition := CallbackCreate(GetMethod(implObj, "get_ButtonAtPosition"), flags, 4)
        this.vtbl.get_NumberOfChapters := CallbackCreate(GetMethod(implObj, "get_NumberOfChapters"), flags, 3)
        this.vtbl.get_TotalTitleTime := CallbackCreate(GetMethod(implObj, "get_TotalTitleTime"), flags, 2)
        this.vtbl.get_TitlesAvailable := CallbackCreate(GetMethod(implObj, "get_TitlesAvailable"), flags, 2)
        this.vtbl.get_VolumesAvailable := CallbackCreate(GetMethod(implObj, "get_VolumesAvailable"), flags, 2)
        this.vtbl.get_CurrentVolume := CallbackCreate(GetMethod(implObj, "get_CurrentVolume"), flags, 2)
        this.vtbl.get_CurrentDiscSide := CallbackCreate(GetMethod(implObj, "get_CurrentDiscSide"), flags, 2)
        this.vtbl.get_CurrentDomain := CallbackCreate(GetMethod(implObj, "get_CurrentDomain"), flags, 2)
        this.vtbl.get_CurrentChapter := CallbackCreate(GetMethod(implObj, "get_CurrentChapter"), flags, 2)
        this.vtbl.get_CurrentTitle := CallbackCreate(GetMethod(implObj, "get_CurrentTitle"), flags, 2)
        this.vtbl.get_CurrentTime := CallbackCreate(GetMethod(implObj, "get_CurrentTime"), flags, 2)
        this.vtbl.DVDTimeCode2bstr := CallbackCreate(GetMethod(implObj, "DVDTimeCode2bstr"), flags, 3)
        this.vtbl.get_DVDDirectory := CallbackCreate(GetMethod(implObj, "get_DVDDirectory"), flags, 2)
        this.vtbl.put_DVDDirectory := CallbackCreate(GetMethod(implObj, "put_DVDDirectory"), flags, 2)
        this.vtbl.IsSubpictureStreamEnabled := CallbackCreate(GetMethod(implObj, "IsSubpictureStreamEnabled"), flags, 3)
        this.vtbl.IsAudioStreamEnabled := CallbackCreate(GetMethod(implObj, "IsAudioStreamEnabled"), flags, 3)
        this.vtbl.get_CurrentSubpictureStream := CallbackCreate(GetMethod(implObj, "get_CurrentSubpictureStream"), flags, 2)
        this.vtbl.put_CurrentSubpictureStream := CallbackCreate(GetMethod(implObj, "put_CurrentSubpictureStream"), flags, 2)
        this.vtbl.get_SubpictureLanguage := CallbackCreate(GetMethod(implObj, "get_SubpictureLanguage"), flags, 3)
        this.vtbl.get_CurrentAudioStream := CallbackCreate(GetMethod(implObj, "get_CurrentAudioStream"), flags, 2)
        this.vtbl.put_CurrentAudioStream := CallbackCreate(GetMethod(implObj, "put_CurrentAudioStream"), flags, 2)
        this.vtbl.get_AudioStreamsAvailable := CallbackCreate(GetMethod(implObj, "get_AudioStreamsAvailable"), flags, 2)
        this.vtbl.get_AnglesAvailable := CallbackCreate(GetMethod(implObj, "get_AnglesAvailable"), flags, 2)
        this.vtbl.get_CurrentAngle := CallbackCreate(GetMethod(implObj, "get_CurrentAngle"), flags, 2)
        this.vtbl.put_CurrentAngle := CallbackCreate(GetMethod(implObj, "put_CurrentAngle"), flags, 2)
        this.vtbl.get_SubpictureStreamsAvailable := CallbackCreate(GetMethod(implObj, "get_SubpictureStreamsAvailable"), flags, 2)
        this.vtbl.get_SubpictureOn := CallbackCreate(GetMethod(implObj, "get_SubpictureOn"), flags, 2)
        this.vtbl.put_SubpictureOn := CallbackCreate(GetMethod(implObj, "put_SubpictureOn"), flags, 2)
        this.vtbl.get_DVDUniqueID := CallbackCreate(GetMethod(implObj, "get_DVDUniqueID"), flags, 2)
        this.vtbl.AcceptParentalLevelChange := CallbackCreate(GetMethod(implObj, "AcceptParentalLevelChange"), flags, 4)
        this.vtbl.NotifyParentalLevelChange := CallbackCreate(GetMethod(implObj, "NotifyParentalLevelChange"), flags, 2)
        this.vtbl.SelectParentalCountry := CallbackCreate(GetMethod(implObj, "SelectParentalCountry"), flags, 4)
        this.vtbl.SelectParentalLevel := CallbackCreate(GetMethod(implObj, "SelectParentalLevel"), flags, 4)
        this.vtbl.get_TitleParentalLevels := CallbackCreate(GetMethod(implObj, "get_TitleParentalLevels"), flags, 3)
        this.vtbl.get_PlayerParentalCountry := CallbackCreate(GetMethod(implObj, "get_PlayerParentalCountry"), flags, 2)
        this.vtbl.get_PlayerParentalLevel := CallbackCreate(GetMethod(implObj, "get_PlayerParentalLevel"), flags, 2)
        this.vtbl.Eject := CallbackCreate(GetMethod(implObj, "Eject"), flags, 1)
        this.vtbl.UOPValid := CallbackCreate(GetMethod(implObj, "UOPValid"), flags, 3)
        this.vtbl.get_SPRM := CallbackCreate(GetMethod(implObj, "get_SPRM"), flags, 3)
        this.vtbl.get_GPRM := CallbackCreate(GetMethod(implObj, "get_GPRM"), flags, 3)
        this.vtbl.put_GPRM := CallbackCreate(GetMethod(implObj, "put_GPRM"), flags, 3)
        this.vtbl.get_DVDTextStringType := CallbackCreate(GetMethod(implObj, "get_DVDTextStringType"), flags, 4)
        this.vtbl.get_DVDTextString := CallbackCreate(GetMethod(implObj, "get_DVDTextString"), flags, 4)
        this.vtbl.get_DVDTextNumberOfStrings := CallbackCreate(GetMethod(implObj, "get_DVDTextNumberOfStrings"), flags, 3)
        this.vtbl.get_DVDTextNumberOfLanguages := CallbackCreate(GetMethod(implObj, "get_DVDTextNumberOfLanguages"), flags, 2)
        this.vtbl.get_DVDTextLanguageLCID := CallbackCreate(GetMethod(implObj, "get_DVDTextLanguageLCID"), flags, 3)
        this.vtbl.RegionChange := CallbackCreate(GetMethod(implObj, "RegionChange"), flags, 1)
        this.vtbl.get_DVDAdm := CallbackCreate(GetMethod(implObj, "get_DVDAdm"), flags, 2)
        this.vtbl.DeleteBookmark := CallbackCreate(GetMethod(implObj, "DeleteBookmark"), flags, 1)
        this.vtbl.RestoreBookmark := CallbackCreate(GetMethod(implObj, "RestoreBookmark"), flags, 1)
        this.vtbl.SaveBookmark := CallbackCreate(GetMethod(implObj, "SaveBookmark"), flags, 1)
        this.vtbl.SelectDefaultAudioLanguage := CallbackCreate(GetMethod(implObj, "SelectDefaultAudioLanguage"), flags, 3)
        this.vtbl.SelectDefaultSubpictureLanguage := CallbackCreate(GetMethod(implObj, "SelectDefaultSubpictureLanguage"), flags, 3)
        this.vtbl.get_PreferredSubpictureStream := CallbackCreate(GetMethod(implObj, "get_PreferredSubpictureStream"), flags, 2)
        this.vtbl.get_DefaultMenuLanguage := CallbackCreate(GetMethod(implObj, "get_DefaultMenuLanguage"), flags, 2)
        this.vtbl.put_DefaultMenuLanguage := CallbackCreate(GetMethod(implObj, "put_DefaultMenuLanguage"), flags, 2)
        this.vtbl.get_DefaultSubpictureLanguage := CallbackCreate(GetMethod(implObj, "get_DefaultSubpictureLanguage"), flags, 2)
        this.vtbl.get_DefaultAudioLanguage := CallbackCreate(GetMethod(implObj, "get_DefaultAudioLanguage"), flags, 2)
        this.vtbl.get_DefaultSubpictureLanguageExt := CallbackCreate(GetMethod(implObj, "get_DefaultSubpictureLanguageExt"), flags, 2)
        this.vtbl.get_DefaultAudioLanguageExt := CallbackCreate(GetMethod(implObj, "get_DefaultAudioLanguageExt"), flags, 2)
        this.vtbl.get_LanguageFromLCID := CallbackCreate(GetMethod(implObj, "get_LanguageFromLCID"), flags, 3)
        this.vtbl.get_KaraokeAudioPresentationMode := CallbackCreate(GetMethod(implObj, "get_KaraokeAudioPresentationMode"), flags, 2)
        this.vtbl.put_KaraokeAudioPresentationMode := CallbackCreate(GetMethod(implObj, "put_KaraokeAudioPresentationMode"), flags, 2)
        this.vtbl.get_KaraokeChannelContent := CallbackCreate(GetMethod(implObj, "get_KaraokeChannelContent"), flags, 4)
        this.vtbl.get_KaraokeChannelAssignment := CallbackCreate(GetMethod(implObj, "get_KaraokeChannelAssignment"), flags, 3)
        this.vtbl.RestorePreferredSettings := CallbackCreate(GetMethod(implObj, "RestorePreferredSettings"), flags, 1)
        this.vtbl.get_ButtonRect := CallbackCreate(GetMethod(implObj, "get_ButtonRect"), flags, 3)
        this.vtbl.get_DVDScreenInMouseCoordinates := CallbackCreate(GetMethod(implObj, "get_DVDScreenInMouseCoordinates"), flags, 2)
        this.vtbl.put_DVDScreenInMouseCoordinates := CallbackCreate(GetMethod(implObj, "put_DVDScreenInMouseCoordinates"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDVDEvent)
        CallbackFree(this.vtbl.PlayTitle)
        CallbackFree(this.vtbl.PlayChapterInTitle)
        CallbackFree(this.vtbl.PlayChapter)
        CallbackFree(this.vtbl.PlayChaptersAutoStop)
        CallbackFree(this.vtbl.PlayAtTime)
        CallbackFree(this.vtbl.PlayAtTimeInTitle)
        CallbackFree(this.vtbl.PlayPeriodInTitleAutoStop)
        CallbackFree(this.vtbl.ReplayChapter)
        CallbackFree(this.vtbl.PlayPrevChapter)
        CallbackFree(this.vtbl.PlayNextChapter)
        CallbackFree(this.vtbl.StillOff)
        CallbackFree(this.vtbl.get_AudioLanguage)
        CallbackFree(this.vtbl.ShowMenu)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.ReturnFromSubmenu)
        CallbackFree(this.vtbl.get_ButtonsAvailable)
        CallbackFree(this.vtbl.get_CurrentButton)
        CallbackFree(this.vtbl.SelectAndActivateButton)
        CallbackFree(this.vtbl.ActivateButton)
        CallbackFree(this.vtbl.SelectRightButton)
        CallbackFree(this.vtbl.SelectLeftButton)
        CallbackFree(this.vtbl.SelectLowerButton)
        CallbackFree(this.vtbl.SelectUpperButton)
        CallbackFree(this.vtbl.ActivateAtPosition)
        CallbackFree(this.vtbl.SelectAtPosition)
        CallbackFree(this.vtbl.get_ButtonAtPosition)
        CallbackFree(this.vtbl.get_NumberOfChapters)
        CallbackFree(this.vtbl.get_TotalTitleTime)
        CallbackFree(this.vtbl.get_TitlesAvailable)
        CallbackFree(this.vtbl.get_VolumesAvailable)
        CallbackFree(this.vtbl.get_CurrentVolume)
        CallbackFree(this.vtbl.get_CurrentDiscSide)
        CallbackFree(this.vtbl.get_CurrentDomain)
        CallbackFree(this.vtbl.get_CurrentChapter)
        CallbackFree(this.vtbl.get_CurrentTitle)
        CallbackFree(this.vtbl.get_CurrentTime)
        CallbackFree(this.vtbl.DVDTimeCode2bstr)
        CallbackFree(this.vtbl.get_DVDDirectory)
        CallbackFree(this.vtbl.put_DVDDirectory)
        CallbackFree(this.vtbl.IsSubpictureStreamEnabled)
        CallbackFree(this.vtbl.IsAudioStreamEnabled)
        CallbackFree(this.vtbl.get_CurrentSubpictureStream)
        CallbackFree(this.vtbl.put_CurrentSubpictureStream)
        CallbackFree(this.vtbl.get_SubpictureLanguage)
        CallbackFree(this.vtbl.get_CurrentAudioStream)
        CallbackFree(this.vtbl.put_CurrentAudioStream)
        CallbackFree(this.vtbl.get_AudioStreamsAvailable)
        CallbackFree(this.vtbl.get_AnglesAvailable)
        CallbackFree(this.vtbl.get_CurrentAngle)
        CallbackFree(this.vtbl.put_CurrentAngle)
        CallbackFree(this.vtbl.get_SubpictureStreamsAvailable)
        CallbackFree(this.vtbl.get_SubpictureOn)
        CallbackFree(this.vtbl.put_SubpictureOn)
        CallbackFree(this.vtbl.get_DVDUniqueID)
        CallbackFree(this.vtbl.AcceptParentalLevelChange)
        CallbackFree(this.vtbl.NotifyParentalLevelChange)
        CallbackFree(this.vtbl.SelectParentalCountry)
        CallbackFree(this.vtbl.SelectParentalLevel)
        CallbackFree(this.vtbl.get_TitleParentalLevels)
        CallbackFree(this.vtbl.get_PlayerParentalCountry)
        CallbackFree(this.vtbl.get_PlayerParentalLevel)
        CallbackFree(this.vtbl.Eject)
        CallbackFree(this.vtbl.UOPValid)
        CallbackFree(this.vtbl.get_SPRM)
        CallbackFree(this.vtbl.get_GPRM)
        CallbackFree(this.vtbl.put_GPRM)
        CallbackFree(this.vtbl.get_DVDTextStringType)
        CallbackFree(this.vtbl.get_DVDTextString)
        CallbackFree(this.vtbl.get_DVDTextNumberOfStrings)
        CallbackFree(this.vtbl.get_DVDTextNumberOfLanguages)
        CallbackFree(this.vtbl.get_DVDTextLanguageLCID)
        CallbackFree(this.vtbl.RegionChange)
        CallbackFree(this.vtbl.get_DVDAdm)
        CallbackFree(this.vtbl.DeleteBookmark)
        CallbackFree(this.vtbl.RestoreBookmark)
        CallbackFree(this.vtbl.SaveBookmark)
        CallbackFree(this.vtbl.SelectDefaultAudioLanguage)
        CallbackFree(this.vtbl.SelectDefaultSubpictureLanguage)
        CallbackFree(this.vtbl.get_PreferredSubpictureStream)
        CallbackFree(this.vtbl.get_DefaultMenuLanguage)
        CallbackFree(this.vtbl.put_DefaultMenuLanguage)
        CallbackFree(this.vtbl.get_DefaultSubpictureLanguage)
        CallbackFree(this.vtbl.get_DefaultAudioLanguage)
        CallbackFree(this.vtbl.get_DefaultSubpictureLanguageExt)
        CallbackFree(this.vtbl.get_DefaultAudioLanguageExt)
        CallbackFree(this.vtbl.get_LanguageFromLCID)
        CallbackFree(this.vtbl.get_KaraokeAudioPresentationMode)
        CallbackFree(this.vtbl.put_KaraokeAudioPresentationMode)
        CallbackFree(this.vtbl.get_KaraokeChannelContent)
        CallbackFree(this.vtbl.get_KaraokeChannelAssignment)
        CallbackFree(this.vtbl.RestorePreferredSettings)
        CallbackFree(this.vtbl.get_ButtonRect)
        CallbackFree(this.vtbl.get_DVDScreenInMouseCoordinates)
        CallbackFree(this.vtbl.put_DVDScreenInMouseCoordinates)
    }
}
