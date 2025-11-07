#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEMESSAGE structure contains parameter values specifying a change in status of the line the application currently has open. The lineGetMessage function returns the LINEMESSAGE structure.
 * @remarks
 * 
 * For information about parameter values passed in this structure, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-device-messages">Line Device Messages</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linemessage
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEMESSAGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Handle to either a line device or a call. The nature of this handle (line handle or call handle) can be determined by the context provided by <i>dwMessageID</i>.
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Line or call device message.
     * @type {Integer}
     */
    dwMessageID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Instance data passed back to the application, which was specified by the application in the <i>dwCallBackInstance</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. This <b>DWORD</b> is not interpreted by TAPI.
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
