#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of voice activity detection (VAD) for the voice capture DSP. This enumeration is used with the MFPKEY_WMAAECMA_FEATR_VAD property.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-aec_vad_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class AEC_VAD_MODE extends Win32Enum{

    /**
     * Voice activity detection is disabled.
     * @type {Integer (Int32)}
     */
    static AEC_VAD_DISABLED => 0

    /**
     * General purpose VAD. This setting attempts to balance the false detection rate and the missed detection rate. The output can have the following values.
     * 	     
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Non-speech.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Voiced speech.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Unvoiced speech.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Mixture of voiced and unvoiced speech.</td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static AEC_VAD_NORMAL => 1

    /**
     * Voice activity detection for automatic gain control and noise suppression. In this mode, the VAD threshold is higher than the normal mode, to reduce the false detection rate. The output distinguishes voiced speech from other sounds (non-speech or unvoiced speech). The output can have the following values.
     *         
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Non-speech or unvoiced speech.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Voiced speech.</td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static AEC_VAD_FOR_AGC => 2

    /**
     * Voice activity detection for silence suppression. In this mode, the output distinguishes speech (voiced or unvoiced) from non-speech. The output can have the following values.
     *         
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Non-speech.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Voiced or unvoiced speech.</td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static AEC_VAD_FOR_SILENCE_SUPPRESSION => 3
}
