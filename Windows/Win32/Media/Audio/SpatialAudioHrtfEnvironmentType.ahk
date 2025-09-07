#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of acoustic environment that is simulated when audio is processed for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfenvironmenttype
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfEnvironmentType{

    /**
     * A small room.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfEnvironment_Small => 0

    /**
     * A medium-sized room.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfEnvironment_Medium => 1

    /**
     * A large room.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfEnvironment_Large => 2

    /**
     * An outdoor space.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfEnvironment_Outdoors => 3

    /**
     * Reserved for Microsoft use. Apps should not use this value.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfEnvironment_Average => 4
}
