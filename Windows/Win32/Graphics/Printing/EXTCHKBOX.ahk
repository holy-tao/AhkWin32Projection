#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EXTCHKBOX {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    pTitle : IntPtr

    pSeparator : IntPtr

    pCheckedName : IntPtr

    IconID : IntPtr

    wReserved : UInt16[4]

    dwReserved : IntPtr[2]

}
