#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_REG_DOMAIN_VALUE.ahk" { DOT11_REG_DOMAIN_VALUE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_REG_DOMAINS_SUPPORT_VALUE {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11RegDomainValue : DOT11_REG_DOMAIN_VALUE[1]

}
