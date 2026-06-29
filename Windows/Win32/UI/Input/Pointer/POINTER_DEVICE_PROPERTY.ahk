#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains pointer-based device properties (Human Interface Device (HID) global items that correspond to HID usages).
 * @remarks
 * Developers can use this function to determine the properties that a device supports beyond the standard ones that are delivered through <a href="https://docs.microsoft.com/windows/win32/inputmsg/messages-and-notifications-portal">Pointer Input Messages and Notifications</a>. The properties map directly to HID usages.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_device_property
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_DEVICE_PROPERTY {
    #StructPack 4

    /**
     * The minimum value that the device can report for this property.
     */
    logicalMin : Int32

    /**
     * The maximum value that the device can report for this property.
     */
    logicalMax : Int32

    /**
     * The physical minimum  in Himetric.
     */
    physicalMin : Int32

    /**
     * The physical maximum in Himetric.
     */
    physicalMax : Int32

    /**
     * The unit.
     */
    unit : UInt32

    /**
     * The exponent.
     */
    unitExponent : UInt32

    /**
     * The usage page for the property, as documented in the HID specification.
     */
    usagePageId : UInt16

    /**
     * The usage  of  the property, as documented in the HID specification.
     */
    usageId : UInt16

}
