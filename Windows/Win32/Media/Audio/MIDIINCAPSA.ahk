#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The MIDIINCAPS structure describes the capabilities of a MIDI input device. (MIDIINCAPSA)
 * @remarks
 * > [!NOTE]
 * > The mmeapi.h header defines MIDIINCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midiincapsa
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct MIDIINCAPSA {
    #StructPack 4

    /**
     * Manufacturer identifier of the device driver for the MIDI input device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wMid : UInt16

    /**
     * Product identifier of the MIDI input device. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wPid : UInt16

    /**
     * Version number of the device driver for the MIDI input device. The high-order byte is the major version number, and the low-order byte is the minor version number.
     */
    vDriverVersion : UInt32

    /**
     * Product name in a null-terminated string.
     */
    szPname : CHAR[32]

    /**
     * Reserved; must be zero.
     */
    dwSupport : UInt32

}
