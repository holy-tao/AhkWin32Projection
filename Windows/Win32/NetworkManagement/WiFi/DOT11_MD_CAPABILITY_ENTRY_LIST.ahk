#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY.ahk" { DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MD_CAPABILITY_ENTRY_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11MDCapabilityEntry : DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY[1]

}
