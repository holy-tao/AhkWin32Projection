#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the source of the input message.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-input_message_source
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class INPUT_MESSAGE_SOURCE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The device type (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_device_type">INPUT_MESSAGE_DEVICE_TYPE</a>) of the source of the input message.
     * @type {Integer}
     */
    deviceType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The ID (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_origin_id">INPUT_MESSAGE_ORIGIN_ID</a>) of the source of the input message.
     * @type {Integer}
     */
    originId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
