#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REFS_SMR_VOLUME_GC_STATE.ahk" { REFS_SMR_VOLUME_GC_STATE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REFS_SMR_VOLUME_INFO_OUTPUT {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    SizeOfRandomlyWritableTier : Int64

    FreeSpaceInRandomlyWritableTier : Int64

    SizeofSMRTier : Int64

    FreeSpaceInSMRTier : Int64

    UsableFreeSpaceInSMRTier : Int64

    VolumeGcState : REFS_SMR_VOLUME_GC_STATE

    VolumeGcLastStatus : UInt32

    CurrentGcBandFillPercentage : UInt32

    Unused : Int64[6]

}
