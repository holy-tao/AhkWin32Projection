#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how far an element's background extends in relation to the element's border.
 * @remarks
 * This enumeration is used by elements that have a **BackgroundSizing** property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.backgroundsizing
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class BackgroundSizing extends Win32Enum{

    /**
     * The element's background extends to the inner edge of the border, but does not extend under the border.
     * @type {Integer (Int32)}
     */
    static InnerBorderEdge => 0

    /**
     * The element's background extends under the border to its outer edge, and is visible if the border is transparent.
     * @type {Integer (Int32)}
     */
    static OuterBorderEdge => 1
}
