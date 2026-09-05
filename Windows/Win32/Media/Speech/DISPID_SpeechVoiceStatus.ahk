#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechVoiceStatus extends Win32Enum {

    /**
     * Native name: DISPID_SVSCurrentStreamNumber
     * @type {Integer (Int32)}
     */
    static SVSCurrentStreamNumber => 1

    /**
     * Native name: DISPID_SVSLastStreamNumberQueued
     * @type {Integer (Int32)}
     */
    static SVSLastStreamNumberQueued => 2

    /**
     * Native name: DISPID_SVSLastResult
     * @type {Integer (Int32)}
     */
    static SVSLastResult => 3

    /**
     * Native name: DISPID_SVSRunningState
     * @type {Integer (Int32)}
     */
    static SVSRunningState => 4

    /**
     * Native name: DISPID_SVSInputWordPosition
     * @type {Integer (Int32)}
     */
    static SVSInputWordPosition => 5

    /**
     * Native name: DISPID_SVSInputWordLength
     * @type {Integer (Int32)}
     */
    static SVSInputWordLength => 6

    /**
     * Native name: DISPID_SVSInputSentencePosition
     * @type {Integer (Int32)}
     */
    static SVSInputSentencePosition => 7

    /**
     * Native name: DISPID_SVSInputSentenceLength
     * @type {Integer (Int32)}
     */
    static SVSInputSentenceLength => 8

    /**
     * Native name: DISPID_SVSLastBookmark
     * @type {Integer (Int32)}
     */
    static SVSLastBookmark => 9

    /**
     * Native name: DISPID_SVSLastBookmarkId
     * @type {Integer (Int32)}
     */
    static SVSLastBookmarkId => 10

    /**
     * Native name: DISPID_SVSPhonemeId
     * @type {Integer (Int32)}
     */
    static SVSPhonemeId => 11

    /**
     * Native name: DISPID_SVSVisemeId
     * @type {Integer (Int32)}
     */
    static SVSVisemeId => 12
}
