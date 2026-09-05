#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the shape in which sound is emitted by an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdirectivitytype
 * @namespace Windows.Win32.Media.Audio
 */
class SpatialAudioHrtfDirectivityType extends Win32Enum {

    /**
     * The sound is emitted in all directions.
     * Native name: SpatialAudioHrtfDirectivity_OmniDirectional
     * @type {Integer (Int32)}
     */
    static OmniDirectional => 0

    /**
     * The sound is emitted in a cardioid shape.
     * Native name: SpatialAudioHrtfDirectivity_Cardioid
     * @type {Integer (Int32)}
     */
    static Cardioid => 1

    /**
     * The sound is emitted in a cone shape.
     * Native name: SpatialAudioHrtfDirectivity_Cone
     * @type {Integer (Int32)}
     */
    static Cone => 2
}
