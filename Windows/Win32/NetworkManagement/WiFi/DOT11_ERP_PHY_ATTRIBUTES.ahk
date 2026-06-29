#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_HRDSSS_PHY_ATTRIBUTES.ahk" { DOT11_HRDSSS_PHY_ATTRIBUTES }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ERP_PHY_ATTRIBUTES {
    #StructPack 4

    HRDSSSAttributes : DOT11_HRDSSS_PHY_ATTRIBUTES

    bERPPBCCOptionImplemented : BOOLEAN

    bDSSSOFDMOptionImplemented : BOOLEAN

    bShortSlotTimeOptionImplemented : BOOLEAN

}
