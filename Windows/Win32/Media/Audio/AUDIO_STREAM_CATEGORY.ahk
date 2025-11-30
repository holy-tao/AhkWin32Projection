#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the category of an audio stream.
 * @remarks
 * 
 * Note that only a subset of the audio stream categories are valid for certain stream types.
 * 
 * <table>
 * <tr>
 * <th>Stream type</th>
 * <th>Valid categories</th>
 * </tr>
 * <tr>
 * <td>Render stream</td>
 * <td>All categories are valid.</td>
 * </tr>
 * <tr>
 * <td>Capture stream</td>
 * <td>AudioCategory_Communications, AudioCategory_Speech, AudioCategory_Other</td>
 * </tr>
 * <tr>
 * <td>Loopback stream</td>
 * <td>AudioCategory_Other</td>
 * </tr>
 * </table>
 *  
 * 
 * Games should categorize their music streams as <b>AudioCategory_GameMedia</b> so that game music mutes automatically if another application plays music in the background. Music or video applications should categorize their streams as <b>AudioCategory_Media</b> or <b>AudioCategory_Movie</b> so they will take priority over <b>AudioCategory_GameMedia</b> streams. Game audio for in-game cinematics or cutscenes, when the audio is premixed or for creative reasons should take priority over background audio, should also be categorized as <b>Media</b> or <b>Movie</b>.
 * 
 * The values <b>AudioCategory_ForegroundOnlyMedia</b> and <b>AudioCategory_BackgroundCapableMedia</b> are deprecated. For Windows Store apps, these values will continue to function the same when running on Windows 10 as they did on Windows 8.1. Attempting to use these values in a Universal Windows Platform (UWP) app, will result in compilation errors and an exception at runtime. Using these values in a Windows desktop application built with the Windows 10   SDK the  will result in a compilation error.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audiosessiontypes/ne-audiosessiontypes-audio_stream_category
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_STREAM_CATEGORY extends Win32Enum{

    /**
     * Other audio stream.
     * @type {Integer (Int32)}
     */
    static AudioCategory_Other => 0

    /**
     * Media that will only stream when the app is in the foreground. This enumeration value has been deprecated. For more information, see the Remarks section.
     * @type {Integer (Int32)}
     */
    static AudioCategory_ForegroundOnlyMedia => 1

    /**
     * Real-time communications, such as VOIP or chat.
     * @type {Integer (Int32)}
     */
    static AudioCategory_Communications => 3

    /**
     * Alert sounds.
     * @type {Integer (Int32)}
     */
    static AudioCategory_Alerts => 4

    /**
     * Sound effects.
     * @type {Integer (Int32)}
     */
    static AudioCategory_SoundEffects => 5

    /**
     * Game sound effects.
     * @type {Integer (Int32)}
     */
    static AudioCategory_GameEffects => 6

    /**
     * Background audio for games.
     * @type {Integer (Int32)}
     */
    static AudioCategory_GameMedia => 7

    /**
     * Game chat audio. Similar to <b>AudioCategory_Communications</b> except that <b>AudioCategory_GameChat</b> will not attenuate other streams.
     * @type {Integer (Int32)}
     */
    static AudioCategory_GameChat => 8

    /**
     * Speech.
     * @type {Integer (Int32)}
     */
    static AudioCategory_Speech => 9

    /**
     * Stream that includes audio with dialog.
     * @type {Integer (Int32)}
     */
    static AudioCategory_Movie => 10

    /**
     * Stream that includes audio without dialog.
     * @type {Integer (Int32)}
     */
    static AudioCategory_Media => 11

    /**
     * Media is audio captured with the intent of capturing voice sources located in the ‘far field’. (Far away from the microphone.)
     * @type {Integer (Int32)}
     */
    static AudioCategory_FarFieldSpeech => 12

    /**
     * Media is captured audio that requires consistent speech processing for the captured audio stream across all Windows devices. Used by applications that process speech data using machine learning algorithms.
     * @type {Integer (Int32)}
     */
    static AudioCategory_UniformSpeech => 13

    /**
     * Media is audio captured with the intent of enabling dictation or typing by voice.
     * @type {Integer (Int32)}
     */
    static AudioCategory_VoiceTyping => 14
}
