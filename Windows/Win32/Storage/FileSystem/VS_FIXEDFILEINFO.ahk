#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VS_FIXEDFILEINFO_FILE_OS.ahk" { VS_FIXEDFILEINFO_FILE_OS }
#Import ".\VS_FIXEDFILEINFO_FILE_FLAGS.ahk" { VS_FIXEDFILEINFO_FILE_FLAGS }

/**
 * Contains version information for a file. This information is language and code page independent.
 * @see https://learn.microsoft.com/windows/win32/api/verrsrc/ns-verrsrc-vs_fixedfileinfo
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VS_FIXEDFILEINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Contains the value 0xFEEF04BD. This is used with the 
     * 					<b>szKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/menurc/vs-versioninfo">VS_VERSIONINFO</a> structure when searching a file for the <b>VS_FIXEDFILEINFO</b> structure.
     */
    dwSignature : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The binary version number of this structure. The high-order word of this member contains the major version number, and the low-order word contains the minor version number.
     */
    dwStrucVersion : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The most significant 32 bits of the file's binary version number. This member is used with 
     * 					<b>dwFileVersionLS</b> to form a 64-bit value used for numeric comparisons.
     */
    dwFileVersionMS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The least significant 32 bits of the file's binary version number. This member is used with 
     * 					<b>dwFileVersionMS</b> to form a 64-bit value used for numeric comparisons.
     */
    dwFileVersionLS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The most significant 32 bits of the binary version number of the product with which this file was distributed. This member is used with 
     * 					<b>dwProductVersionLS</b> to form a 64-bit value used for numeric comparisons.
     */
    dwProductVersionMS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The least significant 32 bits of the binary version number of the product with which this file was distributed. This member is used with 
     * 					<b>dwProductVersionMS</b> to form a 64-bit value used for numeric comparisons.
     */
    dwProductVersionLS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Contains a bitmask that specifies the valid bits in 
     * 					<b>dwFileFlags</b>. A bit is valid only if it was defined when the file was created.
     */
    dwFileFlagsMask : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwFileFlags : VS_FIXEDFILEINFO_FILE_FLAGS

    /**
     * Type: <b>DWORD</b>
     */
    dwFileOS : VS_FIXEDFILEINFO_FILE_OS

    /**
     * Type: <b>DWORD</b>
     */
    dwFileType : UInt32

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
     */
    dwFileSubtype : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The most significant 32 bits of the file's 64-bit binary creation date and time stamp.
     */
    dwFileDateMS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The least significant 32 bits of the file's 64-bit binary creation date and time stamp.
     */
    dwFileDateLS : UInt32

}
