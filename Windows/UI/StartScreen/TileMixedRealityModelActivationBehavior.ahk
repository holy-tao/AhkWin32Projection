#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how the system reacts when the user interacts with a [TileMixedRealityModel](tilemixedrealitymodel.md) in the Windows Mixed Reality home environment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tilemixedrealitymodelactivationbehavior
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class TileMixedRealityModelActivationBehavior extends Win32Enum{

    /**
     * When the user selects the tile model, the system launches the app.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * When the user selects the tile model, the system does not launch the app.
     * @type {Integer (Int32)}
     */
    static None => 1
}
