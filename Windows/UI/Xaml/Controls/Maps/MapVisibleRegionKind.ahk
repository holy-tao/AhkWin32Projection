#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the kind of visible region.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapvisibleregionkind
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapVisibleRegionKind extends Win32Enum{

    /**
     * Visible region on the map control that doesn't include things that are further away towards the horizon and is orthogonal to whether landmarks are present or not.
     * @type {Integer (Int32)}
     */
    static Near => 0

    /**
     * The full visible region of the map control.
     * @type {Integer (Int32)}
     */
    static Full => 1
}
