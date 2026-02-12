#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how a monitor connected to a target should be virtually persisted when the hardware no longer reports any connected monitor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytargetpersistence
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayTargetPersistence extends Win32Enum{

    /**
     * Specifies no persistence.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies persistence until reboot.
     * @type {Integer (Int32)}
     */
    static BootPersisted => 1

    /**
     * Specifies temporary persistence.
     * @type {Integer (Int32)}
     */
    static TemporaryPersisted => 2

    /**
     * Specifies persistence via a path.
     * @type {Integer (Int32)}
     */
    static PathPersisted => 3
}
