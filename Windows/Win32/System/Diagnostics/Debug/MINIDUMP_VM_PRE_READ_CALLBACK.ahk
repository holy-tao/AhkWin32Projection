#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_VM_PRE_READ_CALLBACK {
    #StructPack 8

    Offset : Int64

    Buffer : IntPtr

    Size : UInt32

}
