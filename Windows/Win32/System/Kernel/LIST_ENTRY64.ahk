#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct LIST_ENTRY64 {
    #StructPack 8

    Flink : Int64

    Blink : Int64

}
