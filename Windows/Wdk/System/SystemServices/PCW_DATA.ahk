#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_DATA {
    #StructPack 8

    Data : IntPtr

    Size : UInt32

}
