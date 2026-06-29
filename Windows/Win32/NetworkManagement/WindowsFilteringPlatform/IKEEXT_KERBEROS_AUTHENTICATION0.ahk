#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_KERBEROS_AUTHENTICATION_FLAGS.ahk" { IKEEXT_KERBEROS_AUTHENTICATION_FLAGS }

/**
 * Contains information needed for preshared key authentication. (IKEEXT_KERBEROS_AUTHENTICATION0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_kerberos_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_KERBEROS_AUTHENTICATION0 {
    #StructPack 4

    flags : IKEEXT_KERBEROS_AUTHENTICATION_FLAGS

}
