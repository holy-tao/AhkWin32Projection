#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEV_BROADCAST_HDR.ahk

/**
 * Contains the user-defined event and optional data associated with the DBT_USERDEFINED device event.
 * @remarks
 * Because this structure contains variable length fields, use it as a template for creating a pointer to a user-defined structure. Note that the structure must not contain pointers. The following example shows such a user-defined structure.
  * 
  * 
  * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-_dev_broadcast_userdefined
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class _DEV_BROADCAST_USERDEFINED extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Information about the device affected by a 
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/wm-devicechange">WM_DEVICECHANGE</a> message as specified by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbt/ns-dbt-dev_broadcast_hdr">DEV_BROADCAST_HDR</a> structure. Because 
     * <b>_DEV_BROADCAST_USERDEFINED</b> is variable length, the <b>dbch_size</b> member of the <b>dbud_dbh</b> structure must be the size in bytes of the entire structure, including the variable length portion.
     * @type {DEV_BROADCAST_HDR}
     */
    dbud_dbh{
        get {
            if(!this.HasProp("__dbud_dbh"))
                this.__dbud_dbh := DEV_BROADCAST_HDR(this.ptr + 0)
            return this.__dbud_dbh
        }
    }

    /**
     * A pointer to a case-sensitive, null-terminated string that names the message. The string must consist of the vendor name, a backslash, followed by arbitrary user-defined null-terminated text.
     * @type {String}
     */
    dbud_szName {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
