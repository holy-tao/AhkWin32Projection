#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVScenarioInfo extends Win32Enum {

    /**
     * Native name: eAVScenarioInfo_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: eAVScenarioInfo_DisplayRemoting
     * @type {Integer (Int32)}
     */
    static DisplayRemoting => 1

    /**
     * Native name: eAVScenarioInfo_VideoConference
     * @type {Integer (Int32)}
     */
    static VideoConference => 2

    /**
     * Native name: eAVScenarioInfo_Archive
     * @type {Integer (Int32)}
     */
    static Archive => 3

    /**
     * Native name: eAVScenarioInfo_LiveStreaming
     * @type {Integer (Int32)}
     */
    static LiveStreaming => 4

    /**
     * Native name: eAVScenarioInfo_CameraRecord
     * @type {Integer (Int32)}
     */
    static CameraRecord => 5

    /**
     * Native name: eAVScenarioInfo_DisplayRemotingWithFeatureMap
     * @type {Integer (Int32)}
     */
    static DisplayRemotingWithFeatureMap => 6
}
