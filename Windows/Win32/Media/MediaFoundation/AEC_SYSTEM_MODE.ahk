#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the processing mode for the voice capture DSP. This enumeration is used with the MFPKEY_WMAAECMA_SYSTEM_MODE property.
 * @remarks
 * In all modes, the DSP applies noise suppression and automatic gain control by default. To disable noise suppression, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-wmaaecma-featr-nsproperty">MFPKEY_WMAAECMA_FEATR_NS</a> property. To disable automatic gain control, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-wmaaecma-featr-agcproperty">MFPKEY_WMAAECMA_FEATR_AGC</a> property.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-aec_system_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class AEC_SYSTEM_MODE extends Win32Enum{

    /**
     * AEC processing only.
     * @type {Integer (Int32)}
     */
    static SINGLE_CHANNEL_AEC => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ADAPTIVE_ARRAY_ONLY => 1

    /**
     * Microphone array processing only.
     * @type {Integer (Int32)}
     */
    static OPTIBEAM_ARRAY_ONLY => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ADAPTIVE_ARRAY_AND_AEC => 3

    /**
     * Microphone array processing and AEC processing.
     * @type {Integer (Int32)}
     */
    static OPTIBEAM_ARRAY_AND_AEC => 4

    /**
     * No microphone array processing and no AEC processing.
     * @type {Integer (Int32)}
     */
    static SINGLE_CHANNEL_NSAGC => 5

    /**
     * Uninitialized. This value is the initial value of the MFPKEY_WMAAECMA_SYSTEM_MODE property. Do not set this value.
     * @type {Integer (Int32)}
     */
    static MODE_NOT_SET => 6
}
