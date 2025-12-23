#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FILE_SEGMENT_ELEMENT structure represents a segment buffer structure for scatter/gather read/write actions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_segment_element
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_SEGMENT_ELEMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the data for the scatter/gather read/write action
     * 
     * Assigning a pointer to the **Buffer** member will sign-extend the value if the code is compiled as 32-bits; this can break large-address aware applications running on systems configured with <a href="https://docs.microsoft.com/windows/desktop/Memory/4-gigabyte-tuning">4-Gigabyte Tuning</a> or running under WOW64 on 64-bit Windows. Therefore, use the **PtrToPtr64** macro when assigning pointers to **Buffer**.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The page alignment of the data.
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
