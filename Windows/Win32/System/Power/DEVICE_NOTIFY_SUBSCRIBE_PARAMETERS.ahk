#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters used when registering for a power notification.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-device_notify_subscribe_parameters
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the callback function that will be called when the application receives the notification.
     * @type {Pointer<PDEVICE_NOTIFY_CALLBACK_ROUTINE>}
     */
    Callback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The context of the application registering for the notification.
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
