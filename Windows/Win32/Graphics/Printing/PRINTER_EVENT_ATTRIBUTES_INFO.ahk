#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_EVENT_ATTRIBUTES_INFO {
    #StructPack 4

    cbSize : UInt32 := this.Size

    dwOldAttributes : UInt32

    dwNewAttributes : UInt32

}
