#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies chroma resolution. This enumeration is used with the AVEncVideoInputChromaResolution and AVEncVideoOutputChromaResolution properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideochromaresolution
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoChromaResolution extends Win32Enum{

    /**
     * Use the same chroma resolution as the input video. This flag applies to the <b>AVEncVideoOutputChromaResolution</b> property only.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaResolution_SameAsSource => 0

    /**
     * 4:4:4 (no downsampling).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaResolution_444 => 1

    /**
     * 4:2:2 (2:1 horizontal downsampling, with no vertical downsampling).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaResolution_422 => 2

    /**
     * 4:2:0 (2:1 horizontal downsampling, with 2:1 vertical downsampling).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaResolution_420 => 3

    /**
     * 4:1:1 (4:1 horizontal downsampling, with no vertical downsampling).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaResolution_411 => 4
}
