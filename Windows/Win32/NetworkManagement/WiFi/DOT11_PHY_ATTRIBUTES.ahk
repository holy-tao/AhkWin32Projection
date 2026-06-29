#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_ERP_PHY_ATTRIBUTES.ahk" { DOT11_ERP_PHY_ATTRIBUTES }
#Import ".\DOT11_SUPPORTED_DATA_RATES_VALUE_V2.ahk" { DOT11_SUPPORTED_DATA_RATES_VALUE_V2 }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_TEMP_TYPE.ahk" { DOT11_TEMP_TYPE }
#Import ".\DOT11_OFDM_PHY_ATTRIBUTES.ahk" { DOT11_OFDM_PHY_ATTRIBUTES }
#Import ".\DOT11_DIVERSITY_SUPPORT.ahk" { DOT11_DIVERSITY_SUPPORT }
#Import ".\DOT11_DATA_RATE_MAPPING_ENTRY.ahk" { DOT11_DATA_RATE_MAPPING_ENTRY }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_HRDSSS_PHY_ATTRIBUTES.ahk" { DOT11_HRDSSS_PHY_ATTRIBUTES }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PHY_ATTRIBUTES {
    #StructPack 4


    struct _PhySpecificAttributes {
        HRDSSSAttributes : DOT11_HRDSSS_PHY_ATTRIBUTES

        static __New() {
            DefineProp(this.Prototype, 'OFDMAttributes', { type: DOT11_OFDM_PHY_ATTRIBUTES, offset: 0 })
            DefineProp(this.Prototype, 'ERPAttributes', { type: DOT11_ERP_PHY_ATTRIBUTES, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Header : NDIS_OBJECT_HEADER

    PhyType : DOT11_PHY_TYPE

    bHardwarePhyState : BOOLEAN

    bSoftwarePhyState : BOOLEAN

    bCFPollable : BOOLEAN

    uMPDUMaxLength : UInt32

    TempType : DOT11_TEMP_TYPE

    DiversitySupport : DOT11_DIVERSITY_SUPPORT

    PhySpecificAttributes : DOT11_PHY_ATTRIBUTES._PhySpecificAttributes

    uNumberSupportedPowerLevels : UInt32

    TxPowerLevels : UInt32[8]

    uNumDataRateMappingEntries : UInt32

    DataRateMappingEntries : DOT11_DATA_RATE_MAPPING_ENTRY[126]

    SupportedDataRatesValue : DOT11_SUPPORTED_DATA_RATES_VALUE_V2

}
