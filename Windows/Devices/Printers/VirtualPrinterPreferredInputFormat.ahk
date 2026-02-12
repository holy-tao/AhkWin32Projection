#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class VirtualPrinterPreferredInputFormat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OpenXps => 0

    /**
     * @type {Integer (Int32)}
     */
    static PostScript => 1
}
