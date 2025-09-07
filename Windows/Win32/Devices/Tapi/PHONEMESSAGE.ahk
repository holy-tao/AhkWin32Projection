#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PHONEMESSAGE structure contains the next message queued for delivery to the application. The phoneGetMessage function returns this structure.
 * @remarks
 * For information about parameter values passed in this structure, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phone-device-messages">Phone Device Messages</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-phonemessage
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONEMESSAGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 1

    /**
     * Handle to a phone device.
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Phone message.
     * @type {Integer}
     */
    dwMessageID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Instance data passed back to the application, which was specified by the application in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a>. This value is not interpreted by TAPI.
     * @type {Pointer}
     */
    dwCallbackInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Parameter for the message.
     * @type {Pointer}
     */
    dwParam1 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Parameter for the message.
     * @type {Pointer}
     */
    dwParam2 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Parameter for the message.
     * @type {Pointer}
     */
    dwParam3 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
