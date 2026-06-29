#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2 {
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

    MediaUnitsWritten : Int8[16]

    MediaUnitsRead : Int8[16]

    BadUserNANDBlockCount : NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2._BadUserNANDBlockCount

    BadSystemNANDBlockCount : NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2._BadSystemNANDBlockCount

    XORRecoveryCount : Int64

    UnrecoverableReadErrorCount : Int64

    SoftECCErrorCount : Int64

    EndToEndCorrectionCounts : NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2._EndToEndCorrectionCounts

    PercentageSystemDataUsed : Int8

    RefreshCount : Int8[7]

    UserDataEraseCounts : NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2._UserDataEraseCounts

    ThermalThrottling : NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2._ThermalThrottling

    Reserved0 : Int8[6]

    PCIeCorrectableErrorCount : Int64

    IncompleteShutdownCount : UInt32

    Reserved1 : UInt32

    PercentageFreeBlocks : Int8

    Reserved2 : Int8[7]

    CapacitorHealth : UInt16

    Reserved3 : Int8[6]

    UnalignedIOCount : Int64

    SecurityVersionNumber : Int64

    NUSE : Int64

    PLPStartCount : Int8[16]

    EnduranceEstimate : Int8[16]

    Reserved4 : Int8[302]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
