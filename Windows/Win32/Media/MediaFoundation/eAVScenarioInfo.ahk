#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVScenarioInfo extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_DisplayRemoting => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_VideoConference => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_Archive => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_LiveStreaming => 4

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_CameraRecord => 5

    /**
     * @type {Integer (Int32)}
     */
    static eAVScenarioInfo_DisplayRemotingWithFeatureMap => 6
}
