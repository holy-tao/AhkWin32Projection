#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the shape in which sound is emitted by an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdirectivitytype
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDirectivityType{

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
