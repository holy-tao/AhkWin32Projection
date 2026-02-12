#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > TileOptions may be altered or unavailable for releases after Windows 8.1. Instead, use the properties specified in each value.
  * 
  * Specifies options available to a secondary tile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tileoptions
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class TileOptions extends Win32BitflagEnum{

    /**
     * Default. Do not show the name on a secondary tile of any size.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Display the name on the medium version of the tile.
     * @type {Integer (UInt32)}
     */
    static ShowNameOnLogo => 1

    /**
     * Display the name on the wide version of the tile.
     * @type {Integer (UInt32)}
     */
    static ShowNameOnWideLogo => 2

    /**
     * The tile will be reacquired from the cloud when the parent app is installed by the user, using their Microsoft account, on another computer.
     * 
     * > [!NOTE]
     * > As of Windows 8.1, secondary tile roaming is the default behavior. In Windows 8, you opted into roaming; as of Windows 8.1, you opt out. If Windows detects that the running version of the tile's app dates from before Windows 8.1, the absence of **CopyOnDeployment** is seen as equivalent to [RoamingEnabled](secondarytile_roamingenabled.md) ="false".
     * @type {Integer (UInt32)}
     */
    static CopyOnDeployment => 4
}
