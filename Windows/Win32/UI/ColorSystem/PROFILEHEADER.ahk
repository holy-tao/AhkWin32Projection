#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\CIEXYZ.ahk

/**
 * Contains information that describes the contents of a device profile file. This header occurs at the beginning of a device profile file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-profileheader
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class PROFILEHEADER extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The size of the profile in bytes.
     * @type {Integer}
     */
    phSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The identification number of the CMM that is used in the profile. Identification numbers are registered with the ICC.
     * @type {Integer}
     */
    phCMMType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The version number of the profile. The version number is determined by the ICC. The current major version number is 02h. The current minor version number is 10h. The major and minor version numbers are in binary coded decimal (BCD). They must be stored in the following format.
     * 
     * | Byte Number | Contents                                                                                                                  |
     * |-------------|---------------------------------------------------------------------------------------------------------------------------|
     * | 0           | Major version number in BCD.                                                                                              |
     * | 1           | Minor version number in the most significant nibble of this byte. Bug fix version number in the least significant nibble. |
     * | 2           | Reserved. Must be set to 0.                                                                                               |
     * | 3           | Reserved. Must be set to 0.                                                                                               |
     * @type {Integer}
     */
    phVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    phClass {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A signature value that indicates the color space in which the profile data is defined. The member can be any of value from the [Color Space Constants](/windows/win32/wcs/color-space-constants).
     * @type {Integer}
     */
    phDataColorSpace {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    phConnectionSpace {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The date and time that the profile was created.
     * @type {Array<UInt32>}
     */
    phDateTime{
        get {
            if(!this.HasProp("__phDateTimeProxyArray"))
                this.__phDateTimeProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__phDateTimeProxyArray
        }
    }

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    phSignature {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * 
     * @type {Integer}
     */
    phPlatform {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Bit flags containing hints that the CMM uses to interpret the profile data. The member can be set to the following values.
     * 
     * <table>
     * <colgroup>
     * <col />
     * <col />
     * </colgroup>
     * <thead>
     * <tr class="header">
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * </thead>
     * <tbody>
     * <tr class="odd">
     * <td>
     * <table>
     * <tbody>
     * <tr class="odd">
     * <td>FLAG_EMBEDDEDPROFILE</td>
     * 
     * </tr>
     * </tbody>
     * </table>
     * 
     * <p> </p></td>
     * <td>
     * <table>
     * <tbody>
     * <tr class="odd">
     * <td>The profile is embedded in a bitmap file.</td>
     * 
     * </tr>
     * </tbody>
     * </table>
     * 
     * <p> </p></td>
     * </tr>
     * <tr class="even">
     * <td>
     * <table>
     * <tbody>
     * <tr class="odd">
     * <td>FLAG_DEPENDENTONDATA</td>
     * 
     * </tr>
     * </tbody>
     * </table>
     * 
     * <p> </p></td>
     * <td>
     * <table>
     * <tbody>
     * <tr class="odd">
     * <td>The profile can't be used independently of the embedded color data. Used for profiles that are embedded in bitmap files.</td>
     * 
     * </tr>
     * </tbody>
     * </table>
     * 
     * <p> </p></td>
     * </tr>
     * </tbody>
     * </table>
     * @type {Integer}
     */
    phProfileFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The identification number of the device profile manufacturer. All manufacturer identification numbers are registered with the ICC.
     * @type {Integer}
     */
    phManufacturer {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The device manufacturer's device model number. All model identification numbers are registered with the ICC.
     * @type {Integer}
     */
    phModel {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Array<UInt32>}
     */
    phAttributes{
        get {
            if(!this.HasProp("__phAttributesProxyArray"))
                this.__phAttributesProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "uint")
            return this.__phAttributesProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    phRenderingIntent {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Profile illuminant.
     * @type {CIEXYZ}
     */
    phIlluminant{
        get {
            if(!this.HasProp("__phIlluminant"))
                this.__phIlluminant := CIEXYZ(this.ptr + 72)
            return this.__phIlluminant
        }
    }

    /**
     * Signature of the software that created the profile. Signatures are registered with the ICC.
     * @type {Integer}
     */
    phCreator {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    phReserved{
        get {
            if(!this.HasProp("__phReservedProxyArray"))
                this.__phReservedProxyArray := Win32FixedArray(this.ptr + 88, 1, Primitive, "char")
            return this.__phReservedProxyArray
        }
    }
}
