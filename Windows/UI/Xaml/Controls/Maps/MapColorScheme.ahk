#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the [ColorScheme](mapcontrol_colorscheme.md) of the [MapControl](mapcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcolorscheme
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapColorScheme extends Win32Enum{

    /**
     * The light color scheme.
     * @type {Integer (Int32)}
     */
    static Light => 0

    /**
     * The dark color scheme.
     * @type {Integer (Int32)}
     */
    static Dark => 1
}
