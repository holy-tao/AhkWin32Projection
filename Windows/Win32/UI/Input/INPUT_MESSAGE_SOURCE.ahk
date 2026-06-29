#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INPUT_MESSAGE_ORIGIN_ID.ahk" { INPUT_MESSAGE_ORIGIN_ID }
#Import ".\INPUT_MESSAGE_DEVICE_TYPE.ahk" { INPUT_MESSAGE_DEVICE_TYPE }

/**
 * Contains information about the source of the input message.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-input_message_source
 * @namespace Windows.Win32.UI.Input
 */
export default struct INPUT_MESSAGE_SOURCE {
    #StructPack 4

    /**
     * The device type (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_device_type">INPUT_MESSAGE_DEVICE_TYPE</a>) of the source of the input message.
     */
    deviceType : INPUT_MESSAGE_DEVICE_TYPE

    /**
     * The ID (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_origin_id">INPUT_MESSAGE_ORIGIN_ID</a>) of the source of the input message.
     */
    originId : INPUT_MESSAGE_ORIGIN_ID

}
