#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AUXCAPS structure describes the capabilities of an auxiliary output device. (AUXCAPSA)
 * @remarks
 * > [!NOTE]
  * > The mmeapi.h header defines AUXCAPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-auxcapsa
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class AUXCAPSA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 1

    /**
     * Manufacturer identifier for the device driver for the auxiliary audio device. Manufacturer identifiers are defined in <a href="https://docs.microsoft.com/windows/desktop/Multimedia/manufacturer-and-product-identifiers">Manufacturer and Product Identifiers</a>.
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Product identifier for the auxiliary audio device. Currently, no product identifiers are defined for auxiliary audio devices.
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Version number of the device driver for the auxiliary audio device. The high-order byte is the major version number, and the low-order byte is the minor version number.
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
     * Type of the auxiliary audio output:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUXCAPS_AUXIN"></a><a id="auxcaps_auxin"></a><dl>
     * <dt><b>AUXCAPS_AUXIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio output from auxiliary input jacks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUXCAPS_CDAUDIO"></a><a id="auxcaps_cdaudio"></a><dl>
     * <dt><b>AUXCAPS_CDAUDIO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio output from an internal CD-ROM drive.
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
     * @type {Integer}
     */
    wReserved1 {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * Describes optional functionality supported by the auxiliary audio device.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUXCAPS_LRVOLUME"></a><a id="auxcaps_lrvolume"></a><dl>
     * <dt><b>AUXCAPS_LRVOLUME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports separate left and right volume control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AUXCAPS_VOLUME"></a><a id="auxcaps_volume"></a><dl>
     * <dt><b>AUXCAPS_VOLUME</b></dt>
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
     * If a device supports volume changes, the AUXCAPS_VOLUME flag will be set. If a device supports separate volume changes on the left and right channels, both AUXCAPS_VOLUME and the AUXCAPS_LRVOLUME will be set.
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
