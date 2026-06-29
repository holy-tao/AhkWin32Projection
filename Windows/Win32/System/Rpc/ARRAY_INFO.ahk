#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct ARRAY_INFO {
    #StructPack 8

    Dimension : Int32

    BufferConformanceMark : IntPtr

    BufferVarianceMark : IntPtr

    MaxCountArray : IntPtr

    OffsetArray : IntPtr

    ActualCountArray : IntPtr

}
