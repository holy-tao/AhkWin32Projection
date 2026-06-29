#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SUPPORTED_DSSS_CHANNEL.ahk" { DOT11_SUPPORTED_DSSS_CHANNEL }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_DSSS_CHANNEL_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11SupportedDSSSChannel : DOT11_SUPPORTED_DSSS_CHANNEL[1]

}
