#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of switch on the game controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamecontrollerswitchkind
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class GameControllerSwitchKind extends Win32Enum{

    /**
     * A two-way switch, which has **Up**, **Down**, and **Center** positions.
     * @type {Integer (Int32)}
     */
    static TwoWay => 0

    /**
     * A four-way switch, which has **Up**, **Down**, **Left**, **Right**, and **Center** positions.
     * @type {Integer (Int32)}
     */
    static FourWay => 1

    /**
     * An eight-way switch, which has all positions in the **GameControllerSwitchPosition** enumeration.
     * @type {Integer (Int32)}
     */
    static EightWay => 2
}
