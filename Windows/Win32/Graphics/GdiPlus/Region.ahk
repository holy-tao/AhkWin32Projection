#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Region class describes an area of the display surface.
 * @remarks
 * 
  * A GDI+ region is stored in world coordinates whereas a GDI region is stored in device coordinates. Therefore, a GDI+ region is scalable and a GDI region is not. For more information, see the <b>Scalable Regions</b> section in <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-new-features-about">New Features</a>.
  * 
  * An application can use regions to clip the output of drawing operations. The Window Manager uses regions to define the drawing area of windows. These regions are called clipping regions. An application can also use regions in hit-testing operations, such as checking whether a point is in a region or whether a rectangle intersects a region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-regions-about">Regions</a>, <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-clipping-about">Clipping</a>, and <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-using-regions-use">Using Regions</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-region
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Region extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
