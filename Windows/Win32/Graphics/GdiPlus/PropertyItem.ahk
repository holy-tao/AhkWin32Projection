#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct PropertyItem {
    #StructPack 8

    id : UInt32

    length : UInt32

    type : UInt16

    value : IntPtr

}
