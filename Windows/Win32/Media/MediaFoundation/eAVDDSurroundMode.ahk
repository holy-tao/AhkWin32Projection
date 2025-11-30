#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the audio is encoded in Dolby Surround. This enumeration is used with the AVDDSurroundMode property.
 * @remarks
 * 
 * If the audio stream is Dolby AC-3, this property reflects the value of the dsurmod field in the bit stream.
 * 
 * <table>
 * <tr>
 * <th>Bit field
 *             </th>
 * <th>Value
 *             </th>
 * </tr>
 * <tr>
 * <td>00</td>
 * <td>eAVDDSurroundMode_NotIndicated</td>
 * </tr>
 * <tr>
 * <td>01</td>
 * <td>eAVDDSurroundMode_No</td>
 * </tr>
 * <tr>
 * <td>10</td>
 * <td>eAVDDSurroundMode_Yes</td>
 * </tr>
 * </table>
 *  
 * 
 * If the audio stream is any other format, the value is eAVDDSurroundMode_No.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavddsurroundmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDDSurroundMode extends Win32Enum{

    /**
     * The bit stream does not indicate whether the audio is encoded in Dolby Surround.
     * @type {Integer (Int32)}
     */
    static eAVDDSurroundMode_NotIndicated => 0

    /**
     * The bit stream is not encoded in Dolby Surround.
     * @type {Integer (Int32)}
     */
    static eAVDDSurroundMode_No => 1

    /**
     * The bit stream is encoded in Dolby Surround.
     * @type {Integer (Int32)}
     */
    static eAVDDSurroundMode_Yes => 2
}
