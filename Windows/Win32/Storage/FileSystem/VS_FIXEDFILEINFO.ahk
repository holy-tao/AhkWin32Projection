#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains version information for a file. This information is language and code page independent.
 * @see https://docs.microsoft.com/windows/win32/api//verrsrc/ns-verrsrc-vs_fixedfileinfo
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VS_FIXEDFILEINFO extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Contains the value 0xFEEF04BD. This is used with the 
     * 					<b>szKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/menurc/vs-versioninfo">VS_VERSIONINFO</a> structure when searching a file for the <b>VS_FIXEDFILEINFO</b> structure.
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The binary version number of this structure. The high-order word of this member contains the major version number, and the low-order word contains the minor version number.
     * @type {Integer}
     */
    dwStrucVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The most significant 32 bits of the file's binary version number. This member is used with 
     * 					<b>dwFileVersionLS</b> to form a 64-bit value used for numeric comparisons.
     * @type {Integer}
     */
    dwFileVersionMS {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The least significant 32 bits of the file's binary version number. This member is used with 
     * 					<b>dwFileVersionMS</b> to form a 64-bit value used for numeric comparisons.
     * @type {Integer}
     */
    dwFileVersionLS {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The most significant 32 bits of the binary version number of the product with which this file was distributed. This member is used with 
     * 					<b>dwProductVersionLS</b> to form a 64-bit value used for numeric comparisons.
     * @type {Integer}
     */
    dwProductVersionMS {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The least significant 32 bits of the binary version number of the product with which this file was distributed. This member is used with 
     * 					<b>dwProductVersionMS</b> to form a 64-bit value used for numeric comparisons.
     * @type {Integer}
     */
    dwProductVersionLS {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Contains a bitmask that specifies the valid bits in 
     * 					<b>dwFileFlags</b>. A bit is valid only if it was defined when the file was created.
     * @type {Integer}
     */
    dwFileFlagsMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFileFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFileOS {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFileType {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The function of the file. The possible values depend on the value of 
     * 					<b>dwFileType</b>. For all values of 
     * 					<b>dwFileType</b> not described in the following list, 
     * 					<b>dwFileSubtype</b> is zero. 
     * 
     * 
     * If 
     * 						<b>dwFileType</b> is <b>VFT_DRV</b>,
     * @type {Integer}
     */
    dwFileSubtype {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The most significant 32 bits of the file's 64-bit binary creation date and time stamp.
     * @type {Integer}
     */
    dwFileDateMS {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The least significant 32 bits of the file's 64-bit binary creation date and time stamp.
     * @type {Integer}
     */
    dwFileDateLS {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
