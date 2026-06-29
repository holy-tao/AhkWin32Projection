#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PRINTER_OPTIONSW {
    #StructPack 4

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

}
