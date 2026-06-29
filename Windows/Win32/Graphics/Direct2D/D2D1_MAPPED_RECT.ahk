#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes mapped memory from the ID2D1Bitmap1::Map API.
 * @remarks
 * The mapped rectangle is used to map a rectangle into the caller's address space.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_mapped_rect
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_MAPPED_RECT {
    #StructPack 8

    /**
     * The size in bytes of an individual scanline in the bitmap.
     */
    pitch : UInt32

    /**
     * The data inside the bitmap.
     */
    bits : IntPtr

}
