#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The WAVEINCAPS structure describes the capabilities of a waveform-audio input device. (WAVEINCAPSA)
 * @remarks
 * > [!NOTE]
 * > The mmeapi.h header defines WAVEINCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveincapsa
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct WAVEINCAPSA {
    #StructPack 4

    /**
     * Manufacturer identifier for the device driver for the waveform-audio input device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wMid : UInt16

    /**
     * Product identifier for the waveform-audio input device. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wPid : UInt16

    /**
     * Version number of the device driver for the waveform-audio input device. The high-order byte is the major version number, and the low-order byte is the minor version number.
     */
    vDriverVersion : UInt32

    /**
     * Product name in a null-terminated string.
     */
    szPname : CHAR[32]

    /**
     * Standard formats that are supported. Can be a combination of the following:
     * 
     * <table>
     * <tr>
     * <th>Format</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_1M08</td>
     * <td>11.025 kHz, mono, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_1M16</td>
     * <td>11.025 kHz, mono, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_1S08</td>
     * <td>11.025 kHz, stereo, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_1S16</td>
     * <td>11.025 kHz, stereo, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_2M08</td>
     * <td>22.05 kHz, mono, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_2M16</td>
     * <td>22.05 kHz, mono, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_2S08</td>
     * <td>22.05 kHz, stereo, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_2S16</td>
     * <td>22.05 kHz, stereo, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_4M08</td>
     * <td>44.1 kHz, mono, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_4M16</td>
     * <td>44.1 kHz, mono, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_4S08</td>
     * <td>44.1 kHz, stereo, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_4S16</td>
     * <td>44.1 kHz, stereo, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_96M08</td>
     * <td>96 kHz, mono, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_96M16</td>
     * <td>96 kHz, mono, 16-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_96S08</td>
     * <td>96 kHz, stereo, 8-bit</td>
     * </tr>
     * <tr>
     * <td>WAVE_FORMAT_96S16</td>
     * <td>96 kHz, stereo, 16-bit</td>
     * </tr>
     * </table>
     */
    dwFormats : UInt32

    /**
     * Number specifying whether the device supports mono (1) or stereo (2) input.
     */
    wChannels : UInt16

    wReserved1 : UInt16

}
