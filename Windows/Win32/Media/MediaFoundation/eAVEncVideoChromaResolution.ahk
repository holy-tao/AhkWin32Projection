#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies chroma resolution. This enumeration is used with the AVEncVideoInputChromaResolution and AVEncVideoOutputChromaResolution properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideochromaresolution
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoChromaResolution extends Win32Enum {

    /**
     * Use the same chroma resolution as the input video. This flag applies to the <b>AVEncVideoOutputChromaResolution</b> property only.
     * Native name: eAVEncVideoChromaResolution_SameAsSource
     * @type {Integer (Int32)}
     */
    static SameAsSource => 0

    /**
     * 4:4:4 (no downsampling).
     * Native name: eAVEncVideoChromaResolution_444
     * @type {Integer (Int32)}
     */
    static 444 => 1

    /**
     * 4:2:2 (2:1 horizontal downsampling, with no vertical downsampling).
     * Native name: eAVEncVideoChromaResolution_422
     * @type {Integer (Int32)}
     */
    static 422 => 2

    /**
     * 4:2:0 (2:1 horizontal downsampling, with 2:1 vertical downsampling).
     * Native name: eAVEncVideoChromaResolution_420
     * @type {Integer (Int32)}
     */
    static 420 => 3

    /**
     * 4:1:1 (4:1 horizontal downsampling, with no vertical downsampling).
     * Native name: eAVEncVideoChromaResolution_411
     * @type {Integer (Int32)}
     */
    static 411 => 4
}
