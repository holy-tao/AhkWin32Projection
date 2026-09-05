#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of acoustic environment that is simulated when audio is processed for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfenvironmenttype
 * @namespace Windows.Win32.Media.Audio
 */
class SpatialAudioHrtfEnvironmentType extends Win32Enum {

    /**
     * A small room.
     * Native name: SpatialAudioHrtfEnvironment_Small
     * @type {Integer (Int32)}
     */
    static Small => 0

    /**
     * A medium-sized room.
     * Native name: SpatialAudioHrtfEnvironment_Medium
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * A large room.
     * Native name: SpatialAudioHrtfEnvironment_Large
     * @type {Integer (Int32)}
     */
    static Large => 2

    /**
     * An outdoor space.
     * Native name: SpatialAudioHrtfEnvironment_Outdoors
     * @type {Integer (Int32)}
     */
    static Outdoors => 3

    /**
     * Reserved for Microsoft use. Apps should not use this value.
     * Native name: SpatialAudioHrtfEnvironment_Average
     * @type {Integer (Int32)}
     */
    static Average => 4
}
