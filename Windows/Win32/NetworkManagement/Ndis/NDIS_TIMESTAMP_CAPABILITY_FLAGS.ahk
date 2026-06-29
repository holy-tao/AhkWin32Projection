#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_TIMESTAMP_CAPABILITY_FLAGS {
    #StructPack 1

    PtpV2OverUdpIPv4EventMsgReceiveHw : BOOLEAN

    PtpV2OverUdpIPv4AllMsgReceiveHw : BOOLEAN

    PtpV2OverUdpIPv4EventMsgTransmitHw : BOOLEAN

    PtpV2OverUdpIPv4AllMsgTransmitHw : BOOLEAN

    PtpV2OverUdpIPv6EventMsgReceiveHw : BOOLEAN

    PtpV2OverUdpIPv6AllMsgReceiveHw : BOOLEAN

    PtpV2OverUdpIPv6EventMsgTransmitHw : BOOLEAN

    PtpV2OverUdpIPv6AllMsgTransmitHw : BOOLEAN

    AllReceiveHw : BOOLEAN

    AllTransmitHw : BOOLEAN

    TaggedTransmitHw : BOOLEAN

    AllReceiveSw : BOOLEAN

    AllTransmitSw : BOOLEAN

    TaggedTransmitSw : BOOLEAN

}
