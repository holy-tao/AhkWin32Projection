#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about how a user interacted with a notification toast in the action center. This structure is used by Activate.
 * @remarks
 * Each key-value pair contains a piece of information based on an item in the notification toast when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/notificationactivationcallback/nf-notificationactivationcallback-inotificationactivationcallback-activate">Activate</a> callback is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/notificationactivationcallback/ns-notificationactivationcallback-notification_user_input_data
 * @namespace Windows.Win32.UI.Notifications
 */
export default struct NOTIFICATION_USER_INPUT_DATA {
    #StructPack 8

    /**
     * The ID of the user input field in the XML payload.
     */
    Key : PWSTR

    /**
     * The input value selected by the user for a given input field.
     */
    Value : PWSTR

}
