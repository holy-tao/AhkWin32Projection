#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY {
    #StructPack 4

    uMultiDomainCapabilityIndex : UInt32

    uFirstChannelNumber : UInt32

    uNumberOfChannels : UInt32

    lMaximumTransmitPowerLevel : Int32

}
