#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LOGON_HOURS {
    #StructPack 8

    UnitsPerWeek : UInt16

    LogonHours : IntPtr

}
