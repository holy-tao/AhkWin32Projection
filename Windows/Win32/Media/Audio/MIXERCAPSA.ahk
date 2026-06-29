#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The MIXERCAPS structure describes the capabilities of a mixer device. (MIXERCAPSA)
 * @remarks
 * > [!NOTE]
 * > The mmeapi.h header defines MIXERCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercapsa
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct MIXERCAPSA {
    #StructPack 4

    /**
     * A manufacturer identifier for the mixer device driver. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wMid : UInt16

    /**
     * A product identifier for the mixer device driver. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     */
    wPid : UInt16

    /**
     * Version number of the mixer device driver. The high-order byte is the major version number, and the low-order byte is the minor version number.
     */
    vDriverVersion : UInt32

    /**
     * Name of the product. If the mixer device driver supports multiple cards, this string must uniquely and easily identify (potentially to a user) the specific card.
     */
    szPname : CHAR[32]

    /**
     * Various support information for the mixer device driver. No extended support bits are currently defined.
     */
    fdwSupport : UInt32

    /**
     * The number of audio line destinations available through the mixer device. All mixer devices must support at least one destination line, so this member cannot be zero. Destination indexes used in the <b>dwDestination</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure range from zero to the value specified in the <b>cDestinations</b> member minus one.
     */
    cDestinations : UInt32

}
