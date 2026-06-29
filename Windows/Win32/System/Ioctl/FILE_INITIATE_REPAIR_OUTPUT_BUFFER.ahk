#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_INITIATE_REPAIR_OUTPUT_BUFFER {
    #StructPack 8

    Hint1 : Int64

    Hint2 : Int64

    Clsn : Int64

    Status : UInt32

}
