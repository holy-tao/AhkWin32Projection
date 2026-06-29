#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HDEVNOTIFY.ahk" { HDEVNOTIFY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a file system handle.
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_handle
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_HANDLE {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    dbch_size : UInt32

    /**
     * Set to DBT_DEVTYP_HANDLE.
     */
    dbch_devicetype : UInt32

    /**
     * Reserved; do not use.
     */
    dbch_reserved : UInt32

    /**
     * A handle to the device to be checked.
     */
    dbch_handle : HANDLE

    /**
     * A handle to the device notification. This handle is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerdevicenotificationa">RegisterDeviceNotification</a>.
     */
    dbch_hdevnotify : HDEVNOTIFY

    /**
     * The GUID for the custom event. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/device-events">Device Events</a>.  Valid only for <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>.
     */
    dbch_eventguid : Guid

    /**
     * The offset of an optional string buffer.  Valid only for <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>.
     */
    dbch_nameoffset : Int32

    /**
     * Optional binary data.  This member is valid only for <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>.
     */
    dbch_data : Int8[1]

}
