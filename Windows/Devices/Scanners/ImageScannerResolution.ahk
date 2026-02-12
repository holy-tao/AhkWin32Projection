#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies the scan resolution.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.scanners.imagescannerresolution
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class ImageScannerResolution extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The horizontal size.
     * @type {Float}
     */
    DpiX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The vertical size.
     * @type {Float}
     */
    DpiY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
