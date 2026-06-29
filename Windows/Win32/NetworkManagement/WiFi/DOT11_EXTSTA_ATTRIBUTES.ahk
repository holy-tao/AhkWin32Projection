#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_AUTH_CIPHER_PAIR.ahk" { DOT11_AUTH_CIPHER_PAIR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_EXTSTA_ATTRIBUTES {
    #StructPack 8

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

    bStrictlyOrderedServiceClassImplemented : BOOLEAN

    ucSupportedQoSProtocolFlags : Int8

    bSafeModeImplemented : BOOLEAN

    uNumSupportedCountryOrRegionStrings : UInt32

    pSupportedCountryOrRegionStrings : IntPtr

    uInfraNumSupportedUcastAlgoPairs : UInt32

    pInfraSupportedUcastAlgoPairs : DOT11_AUTH_CIPHER_PAIR.Ptr

    uInfraNumSupportedMcastAlgoPairs : UInt32

    pInfraSupportedMcastAlgoPairs : DOT11_AUTH_CIPHER_PAIR.Ptr

    uAdhocNumSupportedUcastAlgoPairs : UInt32

    pAdhocSupportedUcastAlgoPairs : DOT11_AUTH_CIPHER_PAIR.Ptr

    uAdhocNumSupportedMcastAlgoPairs : UInt32

    pAdhocSupportedMcastAlgoPairs : DOT11_AUTH_CIPHER_PAIR.Ptr

    bAutoPowerSaveMode : BOOLEAN

    uMaxNetworkOffloadListSize : UInt32

    bMFPCapable : BOOLEAN

    uInfraNumSupportedMcastMgmtAlgoPairs : UInt32

    pInfraSupportedMcastMgmtAlgoPairs : DOT11_AUTH_CIPHER_PAIR.Ptr

    bNeighborReportSupported : BOOLEAN

    bAPChannelReportSupported : BOOLEAN

    bActionFramesSupported : BOOLEAN

    bANQPQueryOffloadSupported : BOOLEAN

    bHESSIDConnectionSupported : BOOLEAN

}
