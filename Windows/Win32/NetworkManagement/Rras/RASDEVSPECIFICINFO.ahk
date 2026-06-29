#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to send a cookie for server validation and bypass point-to-point (PPP) authentication.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-rasdevspecificinfo
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @architecture X64, Arm64
 */
export default struct RASDEVSPECIFICINFO {
    #StructPack 8

    /**
     * The size, in bytes, of the cookie in <b>pbDevSpecificInfo</b>.
     */
    dwSize : UInt32

    /**
     * A pointer to a BLOB that contains the authentication cookie.
     */
    pbDevSpecificInfo : IntPtr

}
