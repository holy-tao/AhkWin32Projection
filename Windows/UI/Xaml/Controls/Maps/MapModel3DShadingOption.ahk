#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of shading that you want to appear for 3D objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapmodel3dshadingoption
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapModel3DShadingOption extends Win32Enum{

    /**
     * The vertex normals of the imported 3D model or flat shading if that data is not available.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Flat shading.
     * @type {Integer (Int32)}
     */
    static Flat => 1

    /**
     * Smooth shading.
     * @type {Integer (Int32)}
     */
    static Smooth => 2
}
