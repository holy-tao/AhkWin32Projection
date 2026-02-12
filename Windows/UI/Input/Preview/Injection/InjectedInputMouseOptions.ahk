#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various options, or modifiers, used to simulate mouse input through [InjectedInputMouseInfo](injectedinputmouseinfo.md).
 * @remarks
 * > [!Important]
 * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
 * 
 * Using input injection requires the following be added to the Package.appxmanifest:
 * 
 * - To `<Package>`
 *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *     - `IgnorableNamespaces="rescap"`
 * - To `<Capabilities>`
 *     - `<rescap:Capability Name="inputInjectionBrokered" />`
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputmouseoptions
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputMouseOptions extends Win32BitflagEnum{

    /**
     * No mouse modifier. Default.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Move (coalesce move messages). If a mouse event occurs and the application has not yet processed the previous mouse event, the previous one is thrown away. See **MoveNoCoalesce**.
     * @type {Integer (UInt32)}
     */
    static Move => 1

    /**
     * Left mouse button pressed.
     * @type {Integer (UInt32)}
     */
    static LeftDown => 2

    /**
     * Left mouse button released.
     * @type {Integer (UInt32)}
     */
    static LeftUp => 4

    /**
     * Right mouse button pressed.
     * @type {Integer (UInt32)}
     */
    static RightDown => 8

    /**
     * Right mouse button released.
     * @type {Integer (UInt32)}
     */
    static RightUp => 16

    /**
     * Middle mouse button pressed.
     * @type {Integer (UInt32)}
     */
    static MiddleDown => 32

    /**
     * Middle mouse button released.
     * @type {Integer (UInt32)}
     */
    static MiddleUp => 64

    /**
     * XBUTTON pressed.
     * @type {Integer (UInt32)}
     */
    static XDown => 128

    /**
     * XBUTTON released.
     * @type {Integer (UInt32)}
     */
    static XUp => 256

    /**
     * Mouse wheel.
     * @type {Integer (UInt32)}
     */
    static Wheel => 2048

    /**
     * Mouse tilt wheel.
     * @type {Integer (UInt32)}
     */
    static HWheel => 4096

    /**
     * Move (do not coalesce move messages). The application processes all mouse events since the previously processed mouse event. See **Move**.
     * @type {Integer (UInt32)}
     */
    static MoveNoCoalesce => 8192

    /**
     * Map coordinates to the entire virtual desktop.
     * @type {Integer (UInt32)}
     */
    static VirtualDesk => 16384

    /**
     * Normalized absolute coordinates between 0 and 65,535. If the flag is not set, relative data (the change in position since the last reported position) is used.
     * 
     * Coordinate (0,0) maps onto the upper-left corner of the display surface; coordinate (65535,65535) maps onto the lower-right corner. In a multi-monitor system, the coordinates map to the primary monitor.
     * @type {Integer (UInt32)}
     */
    static Absolute => 32768
}
