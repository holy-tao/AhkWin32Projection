#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies the pixel format and size of a component plane.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmapplanedescription
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapPlaneDescription {
    #StructPack 4

    /**
     * Describes the pixel format of the plane.
     */
    Format : Guid

    /**
     * Component width of the plane.
     */
    Width : UInt32

    /**
     * Component height of the plane.
     */
    Height : UInt32

}
