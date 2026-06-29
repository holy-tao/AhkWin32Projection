#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_EXTSTA_CAPABILITY {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uScanSSIDListSize : UInt32

    uDesiredBSSIDListSize : UInt32

    uDesiredSSIDListSize : UInt32

    uExcludedMacAddressListSize : UInt32

    uPrivacyExemptionListSize : UInt32

    uKeyMappingTableSize : UInt32

    uDefaultKeyTableSize : UInt32

    uWEPKeyValueMaxLength : UInt32

    uPMKIDCacheSize : UInt32

    uMaxNumPerSTADefaultKeyTables : UInt32

}
