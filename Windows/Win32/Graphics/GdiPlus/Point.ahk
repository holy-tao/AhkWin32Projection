#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an ordered pair of floating-point x- and y-coordinates that defines a point in a two-dimensional plane.
 * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-point
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Point {
    #StructPack 4

    X : Int32

    Y : Int32

}
