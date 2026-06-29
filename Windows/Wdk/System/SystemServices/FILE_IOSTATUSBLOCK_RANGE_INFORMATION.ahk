#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_IOSTATUSBLOCK_RANGE_INFORMATION {
    #StructPack 8

    IoStatusBlockRange : IntPtr

    Length : UInt32

}
