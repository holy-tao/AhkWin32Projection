#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_LATENCY_MONITORING_ENTRY {
    #StructPack 2

    ActiveBucketTimerThreshold : UInt16

    ActiveThresholdA : Int8

    ActiveThresholdB : Int8

    ActiveThresholdC : Int8

    ActiveThresholdD : Int8

    ActiveLatencyConfig : UInt16

    ActiveLatencyMinimumWindow : Int8

    DebugLogTriggerEnable : UInt16

    DiscardDebugLog : Int8

    LatencyMonitorFeatureEnable : Int8

    Reserved0 : Int8[4083]

}
