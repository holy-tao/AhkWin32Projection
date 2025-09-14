#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WAVEOUTCAPS structure describes the capabilities of a waveform-audio output device. (WAVEOUTCAPSA)
 * @remarks
 * If a device supports volume changes, the WAVECAPS_VOLUME flag will be set for the <b>dwSupport</b> member. If a device supports separate volume changes on the left and right channels, both the WAVECAPS_VOLUME and the WAVECAPS_LRVOLUME flags will be set for this member.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The mmeapi.h header defines WAVEOUTCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveoutcapsa
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class WAVEOUTCAPSA extends Win32Struct
{
    static sizeof => 52

    static packingSize => 1

    /**
     * Manufacturer identifier for the device driver for the device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Product identifier for the device. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Version number of the device driver for the device. The high-order byte is the major version number, and the low-order byte is the minor version number.
     * @type {Integer}
     */
    vDriverVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Product name in a null-terminated string.
     * @type {Array<SByte>}
     */
    szPname{
        get {
            if(!this.HasProp("__szPnameProxyArray"))
                this.__szPnameProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__szPnameProxyArray
        }
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
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Number specifying whether the device supports mono (1) or stereo (2) output.
     * @type {Integer}
     */
    wChannels {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    wReserved1 {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * Optional functionality supported by the device. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WAVECAPS_LRVOLUME</td>
     * <td>Supports separate left and right volume control.</td>
     * </tr>
     * <tr>
     * <td>WAVECAPS_PITCH</td>
     * <td>Supports pitch control.</td>
     * </tr>
     * <tr>
     * <td>WAVECAPS_PLAYBACKRATE</td>
     * <td>Supports playback rate control.</td>
     * </tr>
     * <tr>
     * <td>WAVECAPS_SYNC</td>
     * <td>The driver is synchronous and will block while playing a buffer.</td>
     * </tr>
     * <tr>
     * <td>WAVECAPS_VOLUME</td>
     * <td>Supports volume control.</td>
     * </tr>
     * <tr>
     * <td>WAVECAPS_SAMPLEACCURATE</td>
     * <td>Returns sample-accurate position information.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
