#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_PERF_STATS {
    #StructPack 4

    dwNumPacketsReceived : UInt32

    dwNumPacketsDuplicate : UInt32

    dwNumPacketsExpired : UInt32

    dwNumMilliSecondsProcessed : UInt32

    dwNumPacketsInActiveQueue : UInt32

    dwNumPacketsInPingQueue : UInt32

    dwNumDiscoversReceived : UInt32

    dwNumOffersSent : UInt32

    dwNumRequestsReceived : UInt32

    dwNumInformsReceived : UInt32

    dwNumAcksSent : UInt32

    dwNumNacksSent : UInt32

    dwNumDeclinesReceived : UInt32

    dwNumReleasesReceived : UInt32

    dwNumDelayedOfferInQueue : UInt32

    dwNumPacketsProcessed : UInt32

    dwNumPacketsInQuarWaitingQueue : UInt32

    dwNumPacketsInQuarReadyQueue : UInt32

    dwNumPacketsInQuarDecisionQueue : UInt32

}
