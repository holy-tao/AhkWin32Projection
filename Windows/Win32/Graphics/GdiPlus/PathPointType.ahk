#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct PathPointType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeLine => 1

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeBezier => 3

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypePathTypeMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeDashMode => 16

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypePathMarker => 32

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeCloseSubpath => 128

    /**
     * @type {Integer (Int32)}
     */
    static PathPointTypeBezier3 => 3
}
