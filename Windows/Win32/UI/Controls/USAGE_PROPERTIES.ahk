#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains device properties (Human Interface Device (HID) global items that correspond to HID usages) for any type of HID input device.
 * @remarks
 * The HID working group publishes a set of documents that make up the HID Usage Tables (the dictionary that describes what HID devices are allowed to do). These HID Usage Tables contain a list with Usage descriptions. A Usage provides information to an application developer about the intended meaning and use of a particular item described in the Report Descriptor. For example, there is a Usage defined for the left button of a mouse. The Report Descriptor can define where in a report an application can find the current state of the mouse’s left button. The Usage Tables are broken up into several name spaces, called Usage Pages. Each Usage Page describes a set of related Usages to help organize the document. The combination of a Usage Page and Usage defines the Usage ID that uniquely identifies a specific Usage in the Usage Tables.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-usage_properties
 * @namespace Windows.Win32.UI.Controls
 */
export default struct USAGE_PROPERTIES {
    #StructPack 4

    /**
     * A usage-specific value for a range-based linear control (knob or dial), an on/off  control (toggle switch), a momentary control (mouse button), a one-shot control (button that triggers a single event), or re-trigger control (button that triggers a repeating event).
     */
    level : UInt16

    /**
     * The Usage Page ID, such as VR Controls Page (0x03) or Game Controls Page (0x05).
     */
    page : UInt16

    /**
     * The Usage ID associated with a Usage Page, such as Turn Right/Left (21) or Move Right/Left (24) for a Game Controls Page.
     */
    usage : UInt16

    /**
     * The smallest value that the control can report.
     */
    logicalMinimum : Int32

    /**
     * The largest value that the control can report.
     */
    logicalMaximum : Int32

    /**
     * The standard of measure used to describe a control's physical value (after converting the logical value using the <i>exponent</i> value). The HID specification defines codes for the basic units of length, mass, time, temperature, current, and luminous intensity.
     */
    unit : UInt16

    /**
     * The value used to scale a logical value to a physical value.
     */
    exponent : UInt16

    /**
     * The number of data
     * items contained in the report.
     */
    count : Int8

    /**
     * The <i>logicalMinimum</i> expressed in physical units (converted by multiplying <i>logicalMinimum</i> by <i>exponent</i>).
     */
    physicalMinimum : Int32

    /**
     * The <i>logicalMaximum</i> expressed in physical units (converted by multiplying <i>logicalMaximum</i> by <i>exponent</i>).
     */
    physicalMaximum : Int32

}
