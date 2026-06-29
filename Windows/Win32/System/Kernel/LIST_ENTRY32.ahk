#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct LIST_ENTRY32 {
    #StructPack 4

    Flink : UInt32

    Blink : UInt32

}
