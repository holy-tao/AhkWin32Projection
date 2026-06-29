#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct STRING64 {
    #StructPack 8

    Length : UInt16

    MaximumLength : UInt16

    Buffer : Int64

}
