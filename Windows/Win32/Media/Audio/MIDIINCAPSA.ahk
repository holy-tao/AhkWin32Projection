#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDIINCAPS structure describes the capabilities of a MIDI input device.
 * @remarks
 * 
 * > [!NOTE]
 * > The mmeapi.h header defines MIDIINCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmeapi/ns-mmeapi-midiincapsa
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIDIINCAPSA extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Manufacturer identifier of the device driver for the MIDI input device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Product identifier of the MIDI input device. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Version number of the device driver for the MIDI input device. The high-order byte is the major version number, and the low-order byte is the minor version number.
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
     * Reserved; must be zero.
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
