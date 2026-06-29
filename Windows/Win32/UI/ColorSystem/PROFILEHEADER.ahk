#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\CIEXYZ.ahk" { CIEXYZ }

/**
 * Contains information that describes the contents of a device profile file. This header occurs at the beginning of a device profile file.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-profileheader
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct PROFILEHEADER {
    #StructPack 4

    /**
     * The size of the profile in bytes.
     */
    phSize : UInt32

    /**
     * The identification number of the CMM that is used in the profile. Identification numbers are registered with the ICC.
     */
    phCMMType : UInt32

    /**
     * The version number of the profile. The version number is determined by the ICC. The current major version number is 02h. The current minor version number is 10h. The major and minor version numbers are in binary coded decimal (BCD). They must be stored in the following format.
     * 
     * | Byte Number | Contents                                                                                                                  |
     * |-------------|---------------------------------------------------------------------------------------------------------------------------|
     * | 0           | Major version number in BCD.                                                                                              |
     * | 1           | Minor version number in the most significant nibble of this byte. Bug fix version number in the least significant nibble. |
     * | 2           | Reserved. Must be set to 0.                                                                                               |
     * | 3           | Reserved. Must be set to 0.                                                                                               |
     */
    phVersion : UInt32

    phClass : UInt32

    /**
     * A signature value that indicates the color space in which the profile data is defined. The member can be any of value from the [Color Space Constants](/windows/win32/wcs/color-space-constants).
     */
    phDataColorSpace : UInt32

    phConnectionSpace : UInt32

    /**
     * The date and time that the profile was created.
     */
    phDateTime : UInt32[3]

    /**
     * Reserved for internal use.
     */
    phSignature : UInt32

    phPlatform : UInt32

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
     */
    phProfileFlags : UInt32

    /**
     * The identification number of the device profile manufacturer. All manufacturer identification numbers are registered with the ICC.
     */
    phManufacturer : UInt32

    /**
     * The device manufacturer's device model number. All model identification numbers are registered with the ICC.
     */
    phModel : UInt32

    phAttributes : UInt32[2]

    phRenderingIntent : UInt32

    /**
     * Profile illuminant.
     */
    phIlluminant : CIEXYZ

    /**
     * Signature of the software that created the profile. Signatures are registered with the ICC.
     */
    phCreator : UInt32

    /**
     * Reserved.
     */
    phReserved : Int8[44]

}
