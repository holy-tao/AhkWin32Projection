#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_SANITIZE_STATUS.ahk" { NVME_SANITIZE_STATUS }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SANITIZE_STATUS_LOG {
    #StructPack 4

    SPROG : UInt16

    SSTAT : NVME_SANITIZE_STATUS

    SCDW10 : UInt32

    EstimatedTimeForOverwrite : UInt32

    EstimatedTimeForBlockErase : UInt32

    EstimatedTimeForCryptoErase : UInt32

    EstimatedTimeForOverwriteWithNoDeallocateMediaModification : UInt32

    EstimatedTimeForBlockEraseWithNoDeallocateMediaModification : UInt32

    EstimatedTimeForCryptoEraseWithNoDeallocateMediaModification : UInt32

    Reserved : Int8[480]

}
