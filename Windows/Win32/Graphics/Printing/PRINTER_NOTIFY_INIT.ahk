#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_NOTIFY_INIT {
    #StructPack 4

    Size : UInt32

    Reserved : UInt32

    PollTime : UInt32

}
