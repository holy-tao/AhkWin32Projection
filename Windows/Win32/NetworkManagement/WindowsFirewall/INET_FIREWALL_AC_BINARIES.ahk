#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The INET_FIREWALL_AC_BINARIES structure contains the binary paths to applications running in an app container.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-inet_firewall_ac_binaries
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INET_FIREWALL_AC_BINARIES {
    #StructPack 8

    /**
     * The number of paths in the <b>binaries</b> member.
     */
    count : UInt32

    /**
     * Paths to the applications running in the app container.
     */
    binaries : PWSTR.Ptr

}
