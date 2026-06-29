#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the shape in which sound is emitted by an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdirectivitytype
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfDirectivityType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The sound is emitted in all directions.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfDirectivity_OmniDirectional => 0

    /**
     * The sound is emitted in a cardioid shape.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfDirectivity_Cardioid => 1

    /**
     * The sound is emitted in a cone shape.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfDirectivity_Cone => 2
}
