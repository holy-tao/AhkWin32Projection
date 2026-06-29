#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct TP_POOL_STACK_INFORMATION {
    #StructPack 8

    StackReserve : IntPtr

    StackCommit : IntPtr

}
