#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIOBJECTATTRIBUTES structure describes the information contained in the &quot;Attributes&quot; value of the registry key for each &quot;object&quot; on a device. If the &quot;Attributes&quot; value is absent, then default attributes are used.
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/ns-dinputd-diobjectattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIOBJECTATTRIBUTES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * There may be zero, one, or more of the following flags:
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the HID usage page to associate with the object.
     * @type {Integer}
     */
    wUsagePage {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the HID usage to associate with the object.
     * @type {Integer}
     */
    wUsage {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
