#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3 {
    #StructPack 8


    struct _BadUserNANDBlockCount {
        RawCount : Int8[6]

        Normalized : Int8[2]

    }

    struct _BadSystemNANDBlockCount {
        RawCount : Int8[6]

        Normalized : Int8[2]

    }

    struct _EndToEndCorrectionCounts {
        DetectedCounts : UInt32

        CorrectedCounts : UInt32

    }

    struct _UserDataEraseCounts {
        MaximumCount : UInt32

        MinimumCount : UInt32

    }

    struct _ThermalThrottling {
        EventCount : Int8

        Status : Int8

    }

    struct _DSSDSpecVersion {
        Errata : Int8

        PointVersion : UInt16

        MinorVersion : UInt16

        MajorVersion : Int8

    }

    MediaUnitsWritten : Int8[16]

    MediaUnitsRead : Int8[16]

    BadUserNANDBlockCount : NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3._BadUserNANDBlockCount

    BadSystemNANDBlockCount : NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3._BadSystemNANDBlockCount

    XORRecoveryCount : Int64

    UnrecoverableReadErrorCount : Int64

    SoftECCErrorCount : Int64

    EndToEndCorrectionCounts : NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3._EndToEndCorrectionCounts

    PercentageSystemDataUsed : Int8

    RefreshCount : Int8[7]

    UserDataEraseCounts : NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3._UserDataEraseCounts

    ThermalThrottling : NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3._ThermalThrottling

    DSSDSpecVersion : NVME_OCP_DEVICE_SMART_INFORMATION_LOG_V3._DSSDSpecVersion

    PCIeCorrectableErrorCount : Int64

    IncompleteShutdownCount : UInt32

    Reserved1 : UInt32

    PercentageFreeBlocks : Int8

    Reserved2 : Int8[7]

    CapacitorHealth : UInt16

    NvmeErrata : Int8

    Reserved3 : Int8[5]

    UnalignedIOCount : Int64

    SecurityVersionNumber : Int64

    NUSE : Int64

    PLPStartCount : Int8[16]

    EnduranceEstimate : Int8[16]

    PCIeLinkRetrainingCount : Int64

    PowerStateChangeCount : Int64

    Reserved4 : Int8[286]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
