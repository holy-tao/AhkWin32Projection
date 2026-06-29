#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_PREFETCH_EX {
    #StructPack 8

    Type : UInt32

    Count : UInt32

    Context : IntPtr

    Prefetch : Int64[1]

}
