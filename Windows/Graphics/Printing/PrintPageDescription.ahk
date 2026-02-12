#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\Foundation\RECT.ahk

/**
 * Represents the data that describes a document page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printpagedescription
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintPageDescription extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The page size in device independent pixels (DIPs).
     * @type {SIZE}
     */
    PageSize{
        get {
            if(!this.HasProp("__PageSize"))
                this.__PageSize := SIZE(0, this)
            return this.__PageSize
        }
    }

    /**
     * The [Rect](../windows.foundation/rect.md) within the page size on which content may actually be printed. Content outside of the rectangle, whether less or greater than the page size, will be cropped by the print target. The  is specified in device independent pixels (DIPs).
     * @type {RECT}
     */
    ImageableRect{
        get {
            if(!this.HasProp("__ImageableRect"))
                this.__ImageableRect := RECT(8, this)
            return this.__ImageableRect
        }
    }

    /**
     * The resolution in dots per inch (DPI) for the X dimension of the page.
     * @type {Integer}
     */
    DpiX {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The resolution in dots per inch (DPI) for the Y dimension of the page.
     * @type {Integer}
     */
    DpiY {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
