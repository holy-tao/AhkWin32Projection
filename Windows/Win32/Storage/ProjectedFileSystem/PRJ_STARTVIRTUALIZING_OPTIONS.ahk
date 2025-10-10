#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Options to provide when starting a virtualization instance.
 * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/ns-projectedfslib-prj_startvirtualizing_options
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_STARTVIRTUALIZING_OPTIONS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A flag for starting virtualization.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of threads the provider wants to create to service callbacks.
     * @type {Integer}
     */
    PoolThreadCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The maximum number of threads the provider wants to run concurrently to process callbacks.
     * @type {Integer}
     */
    ConcurrentThreadCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of zero or more notification mappings. See the Remarks section of PRJ_NOTIFICATION MAPPING for more details.
     * @type {Pointer<PRJ_NOTIFICATION_MAPPING>}
     */
    NotificationMappings {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of notification mappings provided in NotificationMappings.
     * @type {Integer}
     */
    NotificationMappingsCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
