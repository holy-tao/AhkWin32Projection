#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the nominal range for a video source. This enumeration is used with the AVEncVideoInputChromaSubsampling and AVEncVideoOutputChromaSubsampling properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolornominalrange
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoColorNominalRange extends Win32Enum {

    /**
     * Use the same nominal range as the input video. This flag applies to the <b>AVEncVideoOutputChromaSubsampling</b> property only.
     * Native name: eAVEncVideoColorNominalRange_SameAsSource
     * @type {Integer (Int32)}
     */
    static SameAsSource => 0

    /**
     * The normalized range [0..1] maps to [0...255] for 8-bit samples, or [0..1023] for 10-bit samples.
     * Native name: eAVEncVideoColorNominalRange_0_255
     * @type {Integer (Int32)}
     */
    static 0_255 => 1

    /**
     * The normalized range [0..1] maps to [16...235] for 8-bit samples, or [64..940] for 10-bit samples.
     * Native name: eAVEncVideoColorNominalRange_16_235
     * @type {Integer (Int32)}
     */
    static 16_235 => 2

    /**
     * The normalized range [0..1] maps to [48...208] for 8-bit samples.
     * Native name: eAVEncVideoColorNominalRange_48_208
     * @type {Integer (Int32)}
     */
    static 48_208 => 3
}
