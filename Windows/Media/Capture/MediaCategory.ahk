#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for types of media categories.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacategory
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCategory extends Win32Enum{

    /**
     * Media category is other.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Media is intended for real-time communications.
     * @type {Integer (Int32)}
     */
    static Communications => 1

    /**
     * General media.
     * @type {Integer (Int32)}
     */
    static Media => 2

    /**
     * Media is game chat.
     * @type {Integer (Int32)}
     */
    static GameChat => 3

    /**
     * Media is speech.
     * @type {Integer (Int32)}
     */
    static Speech => 4

    /**
     * Media is audio captured with the intent of capturing voice sources located in the ‘far field’. (Far away from the microphone.)
     * @type {Integer (Int32)}
     */
    static FarFieldSpeech => 5

    /**
     * Media is captured audio that requires consistent speech processing for the captured audio stream across all Windows devices. Used by applications that process speech data using machine learning algorithms.
     * @type {Integer (Int32)}
     */
    static UniformSpeech => 6

    /**
     * Media is audio captured with the intent of enabling dictation or typing by voice.
     * @type {Integer (Int32)}
     */
    static VoiceTyping => 7
}
