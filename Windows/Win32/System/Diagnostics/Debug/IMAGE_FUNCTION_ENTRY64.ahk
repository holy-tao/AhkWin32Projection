#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an entry in the function table.I
 * @remarks
 * The following definition exists for 64-bit support.
  * 
  * 
  * ```cpp
  * typedef struct _IMAGE_FUNCTION_ENTRY64 {
  *     ULONGLONG   StartingAddress;
  *     ULONGLONG   EndingAddress;
  *     union {
  *         ULONGLONG   EndOfPrologue;
  *         ULONGLONG   UnwindInfoAddress;
  *     };
  * } IMAGE_FUNCTION_ENTRY64, *PIMAGE_FUNCTION_ENTRY64;
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_function_entry64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_FUNCTION_ENTRY64 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The image address of the start of the function.
     * @type {Integer}
     */
    StartingAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The image address of the end of the function.
     * @type {Integer}
     */
    EndingAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EndOfPrologue {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    UnwindInfoAddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
