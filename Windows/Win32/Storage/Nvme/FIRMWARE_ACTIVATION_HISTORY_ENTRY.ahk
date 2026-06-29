#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct FIRMWARE_ACTIVATION_HISTORY_ENTRY {
    #StructPack 8

    VersionNumber : Int8

    Length : Int8

    Reserved0 : UInt16

    ActivationCount : UInt16

    Timestamp : Int64

    Reserved1 : Int64

    PowerCycleCount : Int64

    PreviousFirmware : Int64

    NewFirmware : Int64

    SlotNumber : Int8

    CommitActionType : Int8

    Result : UInt16

    Reserved2 : Int8[14]

}
