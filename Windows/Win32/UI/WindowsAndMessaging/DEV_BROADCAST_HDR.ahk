#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEV_BROADCAST_HDR_DEVICE_TYPE.ahk" { DEV_BROADCAST_HDR_DEVICE_TYPE }

/**
 * Serves as a standard header for information related to a device event reported through the WM_DEVICECHANGE message.
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_hdr
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_HDR {
    #StructPack 4

    /**
     * The size of this structure, in bytes. 
     * 
     * 
     * 
     * 
     * If this is a user-defined event, this member must be the size of this header, plus the size of the variable-length data in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/dbt/ns-dbt-_dev_broadcast_userdefined">_DEV_BROADCAST_USERDEFINED</a> structure.
     */
    dbch_size : UInt32

    dbch_devicetype : DEV_BROADCAST_HDR_DEVICE_TYPE

    /**
     * Reserved; do not use.
     */
    dbch_reserved : UInt32

}
