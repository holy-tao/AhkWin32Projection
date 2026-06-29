#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Vhd
 */

;@region Constants

/**
 * @type {Guid}
 */
export global VIRTUAL_STORAGE_TYPE_VENDOR_UNKNOWN := Guid("{00000000-0000-0000-0000-000000000000}")

/**
 * @type {Guid}
 */
export global VIRTUAL_STORAGE_TYPE_VENDOR_MICROSOFT := Guid("{ec984aec-a0f9-47e9-901f-71415a66345b}")

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_STORAGE_TYPE_DEVICE_ISO := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_STORAGE_TYPE_DEVICE_VHD := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_STORAGE_TYPE_DEVICE_VHDX := 3

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_STORAGE_TYPE_DEVICE_VHDSET := 4

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_VIRTUAL_DISK_RW_DEPTH_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_SECTOR_SIZE := 0

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_DISK_MAXIMUM_CHANGE_TRACKING_ID_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global MERGE_VIRTUAL_DISK_DEFAULT_MERGE_DEPTH := 1
;@endregion Constants
