#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the [WatermarkMode](mapcontrol_watermarkmode.md) of the [MapControl](mapcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapwatermarkmode
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapWatermarkMode extends Win32Enum{

    /**
     * The watermark of the [MapControl](mapcontrol.md) is turned on or off according to OEM settings.
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * The watermark of the [MapControl](mapcontrol.md) is displayed.
     * @type {Integer (Int32)}
     */
    static On => 1
}
