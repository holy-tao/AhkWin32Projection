#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PRINTER_OPTIONSA {
    #StructPack 4

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

}
