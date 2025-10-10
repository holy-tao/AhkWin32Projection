#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains a 64-bit value representing the number of 100-nanosecond intervals since January 1, 1601 (UTC).
 * @remarks
 * 
  * To convert a 
  * <b>FILETIME</b> structure into a time that is easy to display to a user, use the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-filetimetosystemtime">FileTimeToSystemTime</a> function.
  * 
  * It is not recommended that you add and subtract values from the 
  * <b>FILETIME</b> structure to obtain relative times. Instead, you should copy the low- and high-order parts of the file time to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer-r1">ULARGE_INTEGER</a> structure, perform 64-bit arithmetic on the <b>QuadPart</b> member, and copy the <b>LowPart</b> and <b>HighPart</b> members into the <b>FILETIME</b> structure.
  * 
  * Do not cast a pointer to a <b>FILETIME</b> structure to either a <b>ULARGE_INTEGER*</b> or <b>__int64*</b> value because it can cause alignment faults on 64-bit Windows.
  * 
  * Not all file systems can record creation and last access time and not all file systems record them in the same manner. For example, on NT FAT, create time has a resolution of 10 milliseconds, write time has a resolution of 2 seconds, and access time has a resolution of 1 day (really, the access date). On NTFS, access time has a resolution of 1 hour. Therefore, the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfiletime">GetFileTime</a> function may not return the same file time information set using the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> function. Furthermore, FAT records times on disk in local time. However, NTFS records times on disk in UTC. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
  * 
  *   A function using the <b>FILETIME</b> structure can allow for values outside of  zero or positive values typically specified by the <b>dwLowDateTime</b> and <b>dwHighDateTime</b> members.  For example, the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfiletime">SetFileTime</a> function uses 0xFFFFFFFF to specify that a file's previous access time should be preserved. For more information, see the topic for the function you are calling.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-filetime
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class FILETIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The low-order part of the file time.
     * @type {Integer}
     */
    dwLowDateTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The high-order part of the file time.
     * @type {Integer}
     */
    dwHighDateTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
