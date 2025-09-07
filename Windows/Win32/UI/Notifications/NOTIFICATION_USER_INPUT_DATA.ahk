#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    Key{
        get {
            if(!this.HasProp("__Key"))
                this.__Key := PWSTR(this.ptr + 0)
            return this.__Key
        }
    }

    /**
     * The input value selected by the user for a given input field.
     * @type {PWSTR}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := PWSTR(this.ptr + 8)
            return this.__Value
        }
    }
}
