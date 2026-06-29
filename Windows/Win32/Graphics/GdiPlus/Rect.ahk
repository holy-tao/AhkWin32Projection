#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a set of four floating-point numbers that represent the location and size of a rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-rect
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Rect {
    #StructPack 4

    X : Int32

    Y : Int32

    Width : Int32

    Height : Int32

}
