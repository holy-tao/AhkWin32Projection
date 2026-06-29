#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSERROR {
    #StructPack 8

    Context : IntPtr

    Status : UInt32

}
