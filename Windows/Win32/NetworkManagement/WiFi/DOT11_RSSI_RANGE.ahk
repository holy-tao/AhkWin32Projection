#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RSSI_RANGE {
    #StructPack 4

    dot11PhyType : DOT11_PHY_TYPE

    uRSSIMin : UInt32

    uRSSIMax : UInt32

}
