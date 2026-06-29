#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct READ_WRITE_MSR {
    #StructPack 8

    Msr : UInt32

    Value : Int64

}
