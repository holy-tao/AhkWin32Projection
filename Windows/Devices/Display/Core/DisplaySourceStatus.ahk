#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a state that a display source (a [DisplaySource](displaysource.md) object) can be in.
  * 
  * The state affects the display source's usage, and how it affects other API calls. For example, if a display source is powered off, then you can expect that a call to (for example) [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md) won't be successful.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaysourcestatus
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplaySourceStatus extends Win32Enum{

    /**
     * Specifies that the display source is connected to a [DisplayTarget](displaytarget.md), and is valid and owned by the given [**DisplayDevice**](displaydevice.md). Also, it means that the underlying display's power status is powered on from the kernel's perspective. This is the most common status when a **DisplaySource** is set up correctly and is in use by a DirectDisplay client for presentation.
     * @type {Integer (Int32)}
     */
    static Active => 0

    /**
     * Specifies that the display source is connected to a **DisplayTarget**, and is valid and owned by the given **DisplayDevice**. But the underlying display's power status is powered off from the kernel's perspective.
     * @type {Integer (Int32)}
     */
    static PoweredOff => 1

    /**
     * Specifies that the display source is not valid, and the DirectDisplay client needs to recreate the [DisplaySource](displaysource.md) object. A **DisplaySource** can become invalid for various reasons; for example, display mode changes, or hot plug detect (HPD) of the connected monitor.
     * @type {Integer (Int32)}
     */
    static Invalid => 2

    /**
     * Specifies that the display source isn't currently owned by the current **DisplayDevice**, and is owned by either a different **DisplayDevice** (let's call that display device A), or by some other Direct3D device. If display device A has ownership, then the current **DisplayDevice** can try to recreate the display source (if the [**DisplayManager**](displaymanager.md) that created display device A used [**DisplayManagerOptions.None**](displaymanageroptions.md). If some other Direct3D device has ownership, then you can still try to recreate the **DisplaySource** if you believe that you're the right owner.
     * @type {Integer (Int32)}
     */
    static OwnedByAnotherDevice => 3

    /**
     * Specifies that the display source isn't currently owned by the current **DisplayDevice**, and is in an unowned state. In this case you can try to recreate the **DisplaySource**; doing so will give you ownership implicitly.
     * @type {Integer (Int32)}
     */
    static Unowned => 4
}
