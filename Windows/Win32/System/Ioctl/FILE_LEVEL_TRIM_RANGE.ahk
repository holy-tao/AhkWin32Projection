#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of a file that is to be trimmed.
 * @remarks
 * 
  * Before the trim operation is passed to the underlying storage system the input ranges are reduced to be 
  *     aligned to page boundaries (4,096 bytes on 32-bit and x64-based editions of Windows, 8,192 bytes on Itanium-Based 
  *     editions of Windows).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-file_level_trim_range
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_LEVEL_TRIM_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Offset, in bytes, from the start of the file for the range to be trimmed.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Length, in bytes, for the range to be trimmed.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
