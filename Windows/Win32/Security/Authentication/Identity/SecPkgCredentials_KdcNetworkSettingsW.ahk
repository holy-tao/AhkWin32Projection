#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCredentials_KdcNetworkSettingsW {
    #StructPack 4

    Version : UInt32

    Flags : UInt32

    ProxyServerOffset : UInt16

    ProxyServerLength : UInt16

    ClientTlsCredOffset : UInt16

    ClientTlsCredLength : UInt16

    DcDiscoveryFlags : UInt32

}
