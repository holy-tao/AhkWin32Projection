#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the voice capture DSP performs microphone array processing. This enumeration is used with the MFPKEY_WMAAECMA_FEATR_MICARR_MODE property.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-mic_array_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MIC_ARRAY_MODE extends Win32Enum{

    /**
     * Use a single channel. Specify the channel number in the last 8 bits of the value.
     * @type {Integer (Int32)}
     */
    static MICARRAY_SINGLE_CHAN => 0

    /**
     * Sum all of the channels.
     * @type {Integer (Int32)}
     */
    static MICARRAY_SIMPLE_SUM => 256

    /**
     * Use beam forming with a beam selected by the DSP. After processing starts, you can query which beam was selected by reading the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-wmaaecma-featr-micarr-beamproperty">MFPKEY_WMAAECMA_FEATR_MICARR_BEAM</a> property.
     * @type {Integer (Int32)}
     */
    static MICARRAY_SINGLE_BEAM => 512

    /**
     * Use beam forming with the center beam.
     * @type {Integer (Int32)}
     */
    static MICARRAY_FIXED_BEAM => 1024

    /**
     * Use beam forming with a beam selected by the application. If you set this value, set the MFPKEY_WMAAECMA_FEATR_MICARR_BEAM property to specify the beam.
     * @type {Integer (Int32)}
     */
    static MICARRAY_EXTERN_BEAM => 2048
}
