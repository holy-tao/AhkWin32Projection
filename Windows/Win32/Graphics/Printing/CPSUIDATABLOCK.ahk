#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct CPSUIDATABLOCK {
    #StructPack 8

    cbData : UInt32

    pbData : IntPtr

}
