#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ImageItemData {
    #StructPack 8

    Size : UInt32

    Position : UInt32

    Desc : IntPtr

    DescSize : UInt32

    Data : IntPtr

    DataSize : UInt32

    Cookie : UInt32

}
