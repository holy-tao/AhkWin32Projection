#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of acoustic environment that is simulated when audio is processed for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfenvironmenttype
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfEnvironmentType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
