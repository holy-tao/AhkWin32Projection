#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SUPPORTED_OFDM_FREQUENCY.ahk" { DOT11_SUPPORTED_OFDM_FREQUENCY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_OFDM_FREQUENCY_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11SupportedOFDMFrequency : DOT11_SUPPORTED_OFDM_FREQUENCY[1]

}
