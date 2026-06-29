#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\CH_DESCRIPTION_TYPE.ahk" { CH_DESCRIPTION_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PHY_TYPE_INFO {
    #StructPack 4

    dot11PhyType : DOT11_PHY_TYPE

    bUseParameters : BOOLEAN

    uProbeDelay : UInt32

    uMinChannelTime : UInt32

    uMaxChannelTime : UInt32

    ChDescriptionType : CH_DESCRIPTION_TYPE

    uChannelListSize : UInt32

    ucChannelListBuffer : Int8[1]

}
