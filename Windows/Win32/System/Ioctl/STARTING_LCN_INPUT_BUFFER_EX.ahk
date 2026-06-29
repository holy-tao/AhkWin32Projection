#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STARTING_LCN_INPUT_BUFFER_EX {
    #StructPack 8

    StartingLcn : Int64

    Flags : UInt32

}
