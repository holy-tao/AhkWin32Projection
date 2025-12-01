#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains pointer-based device properties (Human Interface Device (HID) global items that correspond to HID usages).
 * @remarks
 * Developers can use this function to determine the properties that a device supports beyond the standard ones that are delivered through <a href="https://docs.microsoft.com/windows/win32/inputmsg/messages-and-notifications-portal">Pointer Input Messages and Notifications</a>. The properties map directly to HID usages.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_device_property
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_DEVICE_PROPERTY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The minimum value that the device can report for this property.
     * @type {Integer}
     */
    logicalMin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The maximum value that the device can report for this property.
     * @type {Integer}
     */
    logicalMax {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The physical minimum  in Himetric.
     * @type {Integer}
     */
    physicalMin {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The physical maximum in Himetric.
     * @type {Integer}
     */
    physicalMax {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The unit.
     * @type {Integer}
     */
    unit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The exponent.
     * @type {Integer}
     */
    unitExponent {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The usage page for the property, as documented in the HID specification.
     * @type {Integer}
     */
    usagePageId {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The usage  of  the property, as documented in the HID specification.
     * @type {Integer}
     */
    usageId {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
