#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSQUALITY {
    #StructPack 8

    Context : IntPtr

    Proportion : UInt32

    DeltaTime : Int64

}
