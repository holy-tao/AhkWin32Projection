#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CHANNEL_HINT.ahk" { DOT11_CHANNEL_HINT }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_OFFLOAD_NETWORK {
    #StructPack 4

    Ssid : DOT11_SSID

    UnicastCipher : DOT11_CIPHER_ALGORITHM

    AuthAlgo : DOT11_AUTH_ALGORITHM

    Dot11ChannelHints : DOT11_CHANNEL_HINT[4]

}
