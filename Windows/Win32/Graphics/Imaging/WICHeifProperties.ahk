#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the properties of a High Efficiency Image Format (HEIF) image.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicheifproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICHeifProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
