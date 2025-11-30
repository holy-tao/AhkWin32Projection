#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the nominal range for a video source. This enumeration is used with the AVEncVideoInputChromaSubsampling and AVEncVideoOutputChromaSubsampling properties.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencvideocolornominalrange
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoColorNominalRange extends Win32Enum{

    /**
     * Use the same nominal range as the input video. This flag applies to the <b>AVEncVideoOutputChromaSubsampling</b> property only.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorNominalRange_SameAsSource => 0

    /**
     * The normalized range [0..1] maps to [0...255] for 8-bit samples, or [0..1023] for 10-bit samples.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorNominalRange_0_255 => 1

    /**
     * The normalized range [0..1] maps to [16...235] for 8-bit samples, or [64..940] for 10-bit samples.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorNominalRange_16_235 => 2

    /**
     * The normalized range [0..1] maps to [48...208] for 8-bit samples.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorNominalRange_48_208 => 3
}
