#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure stores information about a Winlogon event.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_notification_info
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_NOTIFICATION_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Indicates the size of the structure, in bytes. Your application can check this value against the structure size to validate the structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * String that specifies the name of the user currently logged on to the system. If the event occurs before a user logs on, this value is <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    UserName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * String that specifies the name of the domain the user is currently logged on to. If the event occurs before a user logs on, this value is <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    Domain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the name of the window station the user is currently logged on to. If the event occurs before a user logs on, this value is <b>NULL</b>. Note that most configurations use a single, default window station. Some applications, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/about-terminal-services">About Terminal Services</a>, use multiple window stations.
     * @type {Pointer<Ptr>}
     */
    WindowStation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A handle to the user's token. This value is <b>NULL</b> if the event occurs before a user logs on.
     * @type {Pointer<Ptr>}
     */
    hToken {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A handle to the desktop that is currently active.
     * @type {Pointer<Ptr>}
     */
    hDesktop {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved for internal use.
     * @type {Pointer<Ptr>}
     */
    pStatusCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
