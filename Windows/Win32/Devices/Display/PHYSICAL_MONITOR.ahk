#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a handle and text description corresponding to a physical monitor.
 * @remarks
 * A physical monitor description is always an array of 128 characters.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/ns-physicalmonitorenumerationapi-physical_monitor
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PHYSICAL_MONITOR extends Win32Struct
{
    static sizeof => 264

    static packingSize => 1

    /**
     * Handle to the physical monitor.
     * @type {Pointer<HANDLE>}
     */
    hPhysicalMonitor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Text description of the physical monitor.
     * @type {String}
     */
    szPhysicalMonitorDescription {
        get => StrGet(this.ptr + 8, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8, 127, "UTF-16")
    }
}
