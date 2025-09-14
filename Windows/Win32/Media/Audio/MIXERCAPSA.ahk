#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERCAPS structure describes the capabilities of a mixer device. (MIXERCAPSA)
 * @remarks
 * > [!NOTE]
  * > The mmeapi.h header defines MIXERCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercapsa
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIXERCAPSA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 1

    /**
     * A manufacturer identifier for the mixer device driver. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A product identifier for the mixer device driver. Product identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Version number of the mixer device driver. The high-order byte is the major version number, and the low-order byte is the minor version number.
     * @type {Integer}
     */
    vDriverVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Name of the product. If the mixer device driver supports multiple cards, this string must uniquely and easily identify (potentially to a user) the specific card.
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
     * Various support information for the mixer device driver. No extended support bits are currently defined.
     * @type {Integer}
     */
    fdwSupport {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of audio line destinations available through the mixer device. All mixer devices must support at least one destination line, so this member cannot be zero. Destination indexes used in the <b>dwDestination</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure range from zero to the value specified in the <b>cDestinations</b> member minus one.
     * @type {Integer}
     */
    cDestinations {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
