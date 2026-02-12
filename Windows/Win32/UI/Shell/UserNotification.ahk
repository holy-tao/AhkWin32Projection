#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Initializes a new instance of the **UserNotificationChangedTrigger** class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.usernotificationchangedtrigger.#ctor
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class UserNotification extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
