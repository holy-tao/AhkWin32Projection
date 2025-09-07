#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about how a user interacted with a notification toast in the action center. This structure is used by Activate.
 * @remarks
 * Each key-value pair contains a piece of information based on an item in the notification toast when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/notificationactivationcallback/nf-notificationactivationcallback-inotificationactivationcallback-activate">Activate</a> callback is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/notificationactivationcallback/ns-notificationactivationcallback-notification_user_input_data
 * @namespace Windows.Win32.UI.Notifications
 * @version v4.0.30319
 */
class NOTIFICATION_USER_INPUT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The ID of the user input field in the XML payload.
     * @type {Pointer<Ptr>}
     */
    Key {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The input value selected by the user for a given input field.
     * @type {Pointer<Ptr>}
     */
    Value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
