#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WAVEINCAPS structure describes the capabilities of a waveform-audio input device.
 * @remarks
 * 
 * > [!NOTE]
 * > The mmeapi.h header defines WAVEINCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmeapi/ns-mmeapi-waveincapsw
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class WAVEINCAPSW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * Manufacturer identifier for the device driver for the waveform-audio input device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Product identifier for the waveform-audio input device. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Version number of the device driver for the waveform-audio input device. The high-order byte is the major version number, and the low-order byte is the minor version number.
     * @type {Integer}
     */
    vDriverVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Product name in a null-terminated string.
     * @type {String}
     */
    szPname {
        get => StrGet(this.ptr + 8, 31, "UTF-16")
        set => StrPut(value, this.ptr + 8, 31, "UTF-16")
    }

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
     * @type {Integer}
     */
    dwFormats {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Number specifying whether the device supports mono (1) or stereo (2) input.
     * @type {Integer}
     */
    wChannels {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    wReserved1 {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }
}
