#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the coordinates of a point.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiapoint
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaPoint {
    #StructPack 8

    /**
     * Type: <b>double</b>
     * 
     * The horizontal screen coordinate.
     */
    x : Float64

    /**
     * Type: <b>double</b>
     * 
     * The vertical screen coordinate.
     */
    y : Float64

}
