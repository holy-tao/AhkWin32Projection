#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\StationsAndDesktops\HDESK.ahk

/**
 * This structure stores information about a Winlogon event.
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_notification_info
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
     * @type {PWSTR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := PWSTR(this.ptr + 8)
            return this.__UserName
        }
    }

    /**
     * String that specifies the name of the domain the user is currently logged on to. If the event occurs before a user logs on, this value is <b>NULL</b>.
     * @type {PWSTR}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := PWSTR(this.ptr + 16)
            return this.__Domain
        }
    }

    /**
     * Specifies the name of the window station the user is currently logged on to. If the event occurs before a user logs on, this value is <b>NULL</b>. Note that most configurations use a single, default window station. Some applications, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/about-terminal-services">About Terminal Services</a>, use multiple window stations.
     * @type {PWSTR}
     */
    WindowStation{
        get {
            if(!this.HasProp("__WindowStation"))
                this.__WindowStation := PWSTR(this.ptr + 24)
            return this.__WindowStation
        }
    }

    /**
     * A handle to the user's token. This value is <b>NULL</b> if the event occurs before a user logs on.
     * @type {HANDLE}
     */
    hToken{
        get {
            if(!this.HasProp("__hToken"))
                this.__hToken := HANDLE(this.ptr + 32)
            return this.__hToken
        }
    }

    /**
     * A handle to the desktop that is currently active.
     * @type {HDESK}
     */
    hDesktop{
        get {
            if(!this.HasProp("__hDesktop"))
                this.__hDesktop := HDESK(this.ptr + 40)
            return this.__hDesktop
        }
    }

    /**
     * Reserved for internal use.
     * @type {Pointer<PFNMSGECALLBACK>}
     */
    pStatusCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
