#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PHY_STATE_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uPhyId : UInt32

    bHardwarePhyState : BOOLEAN

    bSoftwarePhyState : BOOLEAN

}
