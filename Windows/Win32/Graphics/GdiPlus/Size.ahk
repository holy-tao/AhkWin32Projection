#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an ordered pair of floating-point numbers that specify a height and width.
 * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-size
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Size {
    #StructPack 4

    Width : Int32

    Height : Int32

}
