#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_REG_DOMAIN_VALUE {
    #StructPack 4

    uRegDomainsSupportIndex : UInt32

    uRegDomainsSupportValue : UInt32

}
