#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * KEYBOARD_EXTENDED_ATTRIBUTES specifies the extended attributes of a keyboard.
 * @remarks
 * 
  * This structure is used with a [IOCTL_KEYBOARD_QUERY_EXTENDED_ATTRIBUTES](ni-ntddkbd-ioctl_keyboard_query_extended_attributes.md) request to return information about the extended attributes that a keyboard supports.
  * 
  * This information comes from HID Keyboard Report Descriptor described in [HID Usage Table Review Request 42: Consumer Page Keyboard Assist Controls](https://www.usb.org/sites/default/files/hutrr42c_0.pdf).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntddkbd/ns-ntddkbd-keyboard_extended_attributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class KEYBOARD_EXTENDED_ATTRIBUTES extends Win32Struct
{
    static sizeof => 7

    static packingSize => 1

    /**
     * Type: **UCHAR**
     * 
     * The version of this structure.
     * 
     * Only **KEYBOARD_EXTENDED_ATTRIBUTES_STRUCT_VERSION_1** supported.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: **UCHAR**
     * 
     * Keyboard Form Factor (Usage ID: *0x2C1*).
     * 
     * | Value | Description                                              |
     * |-------|----------------------------------------------------------|
     * | 0x00  | Unknown Form Factor.                                     |
     * | 0x01  | Full‐Size keyboard.                                      |
     * | 0x02  | Compact keyboard. Such keyboards are less than 13” wide. |
     * @type {Integer}
     */
    FormFactor {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Type: **UCHAR**
     * 
     * Keyboard Key Type (Usage ID: *0x2C2*).
     * 
     * | Value | Description                                        |
     * |-------|----------------------------------------------------|
     * | 0x00  | Unknown Key Type.                                  |
     * | 0x01  | Full‐travel keys.                                  |
     * | 0x02  | Low‐travel keys such as those on laptop keyboards. |
     * | 0x03  | Zero‐travel or virtual keys.                       |
     * @type {Integer}
     */
    KeyType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Type: **UCHAR**
     * 
     * Keyboard Physical Layout (Usage ID: *0x2C3*).
     * 
     * | Value | Description                                                                              |
     * |-------|------------------------------------------------------------------------------------------|
     * | 0x00  | Unknown Layout                                                                           |
     * | 0x01  | 101 (e.g., US)                                                                           |
     * | 0x02  | 103 (Korea)                                                                              |
     * | 0x03  | 102 (e.g., German)                                                                       |
     * | 0x04  | 104 (e.g., ABNT Brazil)                                                                  |
     * | 0x05  | 106 (DOS/V Japan)                                                                        |
     * | 0x06  | Vendor‐specific – If specified, **VendorSpecificPhysicalLayout** must also be specified. |
     * 
     * This value does not refer to the legend set printed on the keys, but only to the physical keyset layout, defined by the relative location and shape of the textual keys in relation to each other. This value indicates which of the de facto standard physical layouts to which the keyboard conforms. These layouts are commonly understood.
     * @type {Integer}
     */
    PhysicalLayout {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Type: **UCHAR**
     * 
     * A numeric identifier of the particular Vendor‐specific Keyboard Physical Layout (Usage ID: *0x2C4*).
     * 
     * Values for this field are defined by the hardware vendor but 0x00 is defined to not specify a Vendor‐specific Keyboard Physical Layout. If non‐zero, **PhysicalLayout** must have value *0x06*. If this identifier is *0x00*, **PhysicalLayout** must not have the value 0x06.
     * @type {Integer}
     */
    VendorSpecificPhysicalLayout {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Type: **UCHAR**
     * 
     * String index of a String Descriptor having an IETF Language Tag (Usage ID: 0x2C5).
     * 
     * Actual string can be obtained via [IOCTL_HID_GET_INDEXED_STRING](/windows-hardware/drivers/ddi/hidclass/ni-hidclass-ioctl_hid_get_indexed_string) IOCTL in kernel-mode drivers or [HidD_GetIndexedString](/windows-hardware/drivers/ddi/hidsdi/nf-hidsdi-hidd_getindexedstring) call in user-mode applications.
     * 
     * This Language Tag specifies the intended primary locale of the keyboard legend set, conformant to [IETF BCP 47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) or its successor.
     * 
     * If an appropriate IETF Language Tag is not available, such as for custom, adaptive or new layouts, the value is set to 0x00.
     * @type {Integer}
     */
    IETFLanguageTagIndex {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Type: **UCHAR**
     * 
     * Bitmap for physically implemented input assist controls. (Usage ID: *0x2C6*).
     * 
     * | Bit   | Description                                        |
     * |-------|----------------------------------------------------|
     * | All 0 | No Keyboard Input Assist controls are implemented. |
     * | Bit 0 | Previous Suggestion                                |
     * | Bit 1 | Next Suggestion                                    |
     * | Bit 2 | Previous Suggestion Group                          |
     * | Bit 3 | Next Suggestion Group                              |
     * | Bit 4 | Accept Suggestion                                  |
     * | Bit 5 | Cancel Suggestion                                  |
     * |       | All other bits reserved.                           |
     * @type {Integer}
     */
    ImplementedInputAssistControls {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }
}
