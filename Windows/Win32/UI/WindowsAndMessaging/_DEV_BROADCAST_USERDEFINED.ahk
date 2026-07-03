#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEV_BROADCAST_HDR.ahk" { DEV_BROADCAST_HDR }
#Import ".\DEV_BROADCAST_HDR_DEVICE_TYPE.ahk" { DEV_BROADCAST_HDR_DEVICE_TYPE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains the user-defined event and optional data associated with the DBT_USERDEFINED device event.
 * @remarks
 * Because this structure contains variable length fields, use it as a template for creating a pointer to a user-defined structure. Note that the structure must not contain pointers. The following example shows such a user-defined structure.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-_dev_broadcast_userdefined
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct _DEV_BROADCAST_USERDEFINED {
    #StructPack 4

    /**
     * Information about the device affected by a 
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/wm-devicechange">WM_DEVICECHANGE</a> message as specified by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbt/ns-dbt-dev_broadcast_hdr">DEV_BROADCAST_HDR</a> structure. Because 
     * <b>_DEV_BROADCAST_USERDEFINED</b> is variable length, the <b>dbch_size</b> member of the <b>dbud_dbh</b> structure must be the size in bytes of the entire structure, including the variable length portion.
     */
    dbud_dbh : DEV_BROADCAST_HDR

    /**
     * A pointer to a case-sensitive, null-terminated string that names the message. The string must consist of the vendor name, a backslash, followed by arbitrary user-defined null-terminated text.
     */
    dbud_szName : CHAR[1]

}
