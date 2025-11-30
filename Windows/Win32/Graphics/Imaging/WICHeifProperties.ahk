#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the properties of a High Efficiency Image Format (HEIF) image.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicheifproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICHeifProperties extends Win32Enum{

    /**
     * [VT_UI2] Indicates the orientation of the image.
     * 
     * The value of this property uses the same numbering scheme as the <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-photo-orientation">System.Photo.Orientation</a> property. For example, a value of 1 (PHOTO_ORIENTATION_NORMAL) indicates a 0 degree rotation.
     * @type {Integer (Int32)}
     */
    static WICHeifOrientation => 1

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifLayeredImageCanvasColor => 2

    /**
     * @type {Integer (Int32)}
     */
    static WICHeifLayeredImageLayerPositions => 3
}
