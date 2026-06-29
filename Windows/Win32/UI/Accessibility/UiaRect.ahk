#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the position and size of a rectangle, in screen coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiarect
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaRect {
    #StructPack 8

    /**
     * Type: <b>double</b>
     * 
     * Position of the left side.
     */
    left : Float64

    /**
     * Type: <b>double</b>
     * 
     * Position of the top side.
     */
    top : Float64

    /**
     * Type: <b>double</b>
     * 
     * Width.
     */
    width : Float64

    /**
     * Type: <b>double</b>
     * 
     * Height.
     */
    height : Float64

}
