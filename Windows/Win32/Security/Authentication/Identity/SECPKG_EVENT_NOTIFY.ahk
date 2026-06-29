#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SECPKG_EVENT_NOTIFY structure contains information about security events. This structure is passed to a function registered to receive event notifications. Event notification functions are registered by calling the RegisterNotification function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_event_notify
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_EVENT_NOTIFY {
    #StructPack 8

    /**
     * The event class.
     */
    EventClass : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The size of the <b>EventData</b> member.
     */
    EventDataSize : UInt32

    /**
     * The event details.
     */
    EventData : IntPtr

    /**
     * Information specified as the <i>Parameter</i> value when <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_register_notification">RegisterNotification</a> is called to register for notification.
     */
    PackageParameter : IntPtr

}
