#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_ALLOCATION_INFORMATION structure contains information about the source media pool from which a medium was taken.
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ns-ntmsapi-ntms_allocation_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_ALLOCATION_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    lpReserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unique identifier of the original source of the media.
     * @type {Pointer<Guid>}
     */
    AllocatedFrom {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
