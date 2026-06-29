#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_ROLLFORWARD_REDO_INFORMATION {
    #StructPack 8

    LastVirtualClock : Int64

    LastRedoLsn : Int64

    HighestRecoveryLsn : Int64

    Flags : UInt32

}
