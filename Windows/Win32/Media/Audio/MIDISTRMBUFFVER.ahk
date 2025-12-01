#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDISTRMBUFFVER structure contains version information for a long MIDI event of the MEVT_VERSION type.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midistrmbuffver
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIDISTRMBUFFVER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Version of the stream. The high 16 bits contain the major version, and the low 16 bits contain the minor version. The version number for the first implementation of MIDI streams should be 1.0.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Manufacturer identifier. Manufacturer identifiers are defined in Manufacturer and Product Identifiers.
     * @type {Integer}
     */
    dwMid {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * OEM version of the stream. Original equipment manufacturers can use this field to version-stamp any custom events they have specified. If a custom event is specified, it must be the first event sent after the stream is opened.
     * @type {Integer}
     */
    dwOEMVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
