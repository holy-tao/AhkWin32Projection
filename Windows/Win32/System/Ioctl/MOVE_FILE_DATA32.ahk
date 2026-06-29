#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @architecture X64, Arm64
 */
export default struct MOVE_FILE_DATA32 {
    #StructPack 8

    FileHandle : UInt32

    StartingVcn : Int64

    StartingLcn : Int64

    ClusterCount : UInt32

}
