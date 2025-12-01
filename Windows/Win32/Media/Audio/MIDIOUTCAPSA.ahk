#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDIOUTCAPS structure describes the capabilities of a MIDI output device. (MIDIOUTCAPSA)
 * @remarks
 * > [!NOTE]
 * > The mmeapi.h header defines MIDIOUTCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midioutcapsa
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIDIOUTCAPSA extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Manufacturer identifier of the device driver for the MIDI output device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Product identifier of the MIDI output device. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Version number of the device driver for the MIDI output device. The high-order byte is the major version number, and the low-order byte is the minor version number.
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
        get => StrGet(this.ptr + 8, 31, "UTF-8")
        set => StrPut(value, this.ptr + 8, 31, "UTF-8")
    }

    /**
     * Type of the MIDI output device. This value can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_MIDIPORT"></a><a id="mod_midiport"></a><dl>
     * <dt><b>MOD_MIDIPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MIDI hardware port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_SYNTH"></a><a id="mod_synth"></a><dl>
     * <dt><b>MOD_SYNTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Synthesizer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_SQSYNTH"></a><a id="mod_sqsynth"></a><dl>
     * <dt><b>MOD_SQSYNTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Square wave synthesizer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_FMSYNTH"></a><a id="mod_fmsynth"></a><dl>
     * <dt><b>MOD_FMSYNTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FM synthesizer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_MAPPER"></a><a id="mod_mapper"></a><dl>
     * <dt><b>MOD_MAPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft MIDI mapper.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_WAVETABLE"></a><a id="mod_wavetable"></a><dl>
     * <dt><b>MOD_WAVETABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hardware wavetable synthesizer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MOD_SWSYNTH"></a><a id="mod_swsynth"></a><dl>
     * <dt><b>MOD_SWSYNTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Software synthesizer.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wTechnology {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * Number of voices supported by an internal synthesizer device. If the device is a port, this member is not meaningful and is set to 0.
     * @type {Integer}
     */
    wVoices {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * Maximum number of simultaneous notes that can be played by an internal synthesizer device. If the device is a port, this member is not meaningful and is set to 0.
     * @type {Integer}
     */
    wNotes {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * Channels that an internal synthesizer device responds to, where the least significant bit refers to channel 0 and the most significant bit to channel 15. Port devices that transmit on all channels set this member to 0xFFFF.
     * @type {Integer}
     */
    wChannelMask {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * Optional functionality supported by the device. It can be one or more of the following:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIDICAPS_CACHE"></a><a id="midicaps_cache"></a><dl>
     * <dt><b>MIDICAPS_CACHE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports patch caching.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIDICAPS_LRVOLUME"></a><a id="midicaps_lrvolume"></a><dl>
     * <dt><b>MIDICAPS_LRVOLUME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports separate left and right volume control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIDICAPS_STREAM"></a><a id="midicaps_stream"></a><dl>
     * <dt><b>MIDICAPS_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provides direct support for the <a href="https://docs.microsoft.com/previous-versions/dd798487(v=vs.85)">midiStreamOut</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIDICAPS_VOLUME"></a><a id="midicaps_volume"></a><dl>
     * <dt><b>MIDICAPS_VOLUME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports volume control.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If a device supports volume changes, the MIDICAPS_VOLUME flag will be set for the dwSupport member. If a device supports separate volume changes on the left and right channels, both the MIDICAPS_VOLUME and the MIDICAPS_LRVOLUME flags will be set for this member.
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
