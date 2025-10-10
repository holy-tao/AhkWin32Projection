#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Serves as a standard header for information related to a device event reported through the WM_DEVICECHANGE message.
 * @see https://docs.microsoft.com/windows/win32/api//dbt/ns-dbt-dev_broadcast_hdr
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DEV_BROADCAST_HDR extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size of this structure, in bytes. 
     * 
     * 
     * 
     * 
     * If this is a user-defined event, this member must be the size of this header, plus the size of the variable-length data in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/dbt/ns-dbt-_dev_broadcast_userdefined">_DEV_BROADCAST_USERDEFINED</a> structure.
     * @type {Integer}
     */
    dbch_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dbch_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dbch_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
