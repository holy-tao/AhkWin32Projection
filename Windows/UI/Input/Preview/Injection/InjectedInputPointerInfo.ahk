#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains basic pointer information common to all pointer types.
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpointerinfo
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputPointerInfo extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A unique identifier for the lifetime of the pointer. A pointer is created when it enters detection range and destroyed when it leaves detection range. If a pointer goes out of detection range and then returns, it is treated as a new pointer and might be assigned a new identifier.
     * @type {Integer}
     */
    PointerId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The various options, or modifiers, used to simulate pointer input through [InjectedInputMouseInfo](injectedinputmouseinfo.md), [InjectedInputPenInfo](injectedinputpeninfo.md), and [InjectedInputTouchInfo](injectedinputtouchinfo.md).
     * @type {Integer}
     */
    PointerOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The screen coordinates of the pointer in device-independent pixel (DIP).
     * @type {Pointer<InjectedInputPoint>}
     */
    PixelLocation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The baseline, or reference value, in milliseconds, for timed input events such as a double click/tap.
     * @type {Integer}
     */
    TimeOffsetInMilliseconds {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A high resolution (less than one microsecond) time stamp used for time-interval measurements.
     * @type {Integer}
     */
    PerformanceCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
