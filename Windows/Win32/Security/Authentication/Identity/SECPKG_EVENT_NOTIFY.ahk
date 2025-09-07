#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SECPKG_EVENT_NOTIFY structure contains information about security events. This structure is passed to a function registered to receive event notifications. Event notification functions are registered by calling the RegisterNotification function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_event_notify
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_EVENT_NOTIFY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The event class.
     * @type {Integer}
     */
    EventClass {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the <b>EventData</b> member.
     * @type {Integer}
     */
    EventDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The event details.
     * @type {Pointer<Void>}
     */
    EventData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Information specified as the <i>Parameter</i> value when <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_register_notification">RegisterNotification</a> is called to register for notification.
     * @type {Pointer<Void>}
     */
    PackageParameter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
