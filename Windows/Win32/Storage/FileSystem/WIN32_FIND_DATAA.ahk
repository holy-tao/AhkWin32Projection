#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information about the file that is found by the FindFirstFile, FindFirstFileEx, or FindNextFile function. (ANSI)
 * @remarks
 * If a file has a long file name, the complete name appears in the <b>cFileName</b> member, 
  *     and the 8.3 format truncated version of the name appears in the <b>cAlternateFileName</b> 
  *     member. Otherwise, <b>cAlternateFileName</b> is empty. If the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa">FindFirstFileEx</a> function was called with a value of 
  *     <b>FindExInfoBasic</b> in the <i>fInfoLevelId</i> parameter, the 
  *     <b>cAlternateFileName</b> member will always contain a <b>NULL</b> string 
  *     value. This remains true for all subsequent calls to the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextfilea">FindNextFile</a> function. As an alternative method of 
  *     retrieving the 8.3 format version of a file name, you can use the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getshortpathnamew">GetShortPathName</a> function. For more information about 
  *     file names, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Names, Paths, and Namespaces</a>.
  * 
  * Not all file systems can record creation and last access times, and not all file systems record them in the 
  *     same manner. For example, on the FAT file system, create time has a resolution of 10 milliseconds, write time has 
  *     a resolution of 2 seconds, and access time has a resolution of 1 day. The 
  *     NTFS file system delays updates to the last access time for a file by up to 1 hour after the last access. For 
  *     more information, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The minwinbase.h header defines WIN32_FIND_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-win32_find_dataa
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class WIN32_FIND_DATAA extends Win32Struct
{
    static sizeof => 328

    static packingSize => 8

    /**
     * The file attributes of a file.
     * 
     * For possible values and their descriptions, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>.
     * 
     * The <b>FILE_ATTRIBUTE_SPARSE_FILE</b> attribute on the file is set if any of the streams 
     *        of the file have ever been sparse.
     * @type {Integer}
     */
    dwFileAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies when a file or 
     *        directory was created.
     * 
     * If the underlying file system does not support creation time, this member is zero.
     * @type {FILETIME}
     */
    ftCreationTime{
        get {
            if(!this.HasProp("__ftCreationTime"))
                this.__ftCreationTime := FILETIME(this.ptr + 8)
            return this.__ftCreationTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * 
     * For a file, the structure specifies when the file was last read from, written to, or for executable files, 
     *        run.
     * 
     * For a directory, the structure specifies when the directory is created. If the underlying file system does 
     *        not support last access time, this member is zero.
     * 
     * On the FAT file system, the specified date for both files and directories is correct, but the time of day is 
     *        always set to midnight.
     * @type {FILETIME}
     */
    ftLastAccessTime{
        get {
            if(!this.HasProp("__ftLastAccessTime"))
                this.__ftLastAccessTime := FILETIME(this.ptr + 16)
            return this.__ftLastAccessTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * 
     * For a file, the structure specifies when the file was last written to, truncated, or overwritten, for 
     *        example, when <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setendoffile">SetEndOfFile</a> are used. The date and time are not 
     *        updated when file attributes or security descriptors are changed.
     * 
     * For a directory, the structure specifies when the directory is created. If the underlying file system does 
     *        not support last write time, this member is zero.
     * @type {FILETIME}
     */
    ftLastWriteTime{
        get {
            if(!this.HasProp("__ftLastWriteTime"))
                this.__ftLastWriteTime := FILETIME(this.ptr + 24)
            return this.__ftLastWriteTime
        }
    }

    /**
     * The high-order <b>DWORD</b> value of the file size, in bytes.
     * 
     * This value is zero unless the file size is greater than <b>MAXDWORD</b>.
     * 
     * The size of the file is equal to (<b>nFileSizeHigh</b> * 
     *        (<b>MAXDWORD</b>+1)) + <b>nFileSizeLow</b>.
     * @type {Integer}
     */
    nFileSizeHigh {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The low-order <b>DWORD</b> value of the file size, in bytes.
     * @type {Integer}
     */
    nFileSizeLow {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * If the <b>dwFileAttributes</b> member includes the 
     *        <b>FILE_ATTRIBUTE_REPARSE_POINT</b> attribute, this member specifies the reparse point 
     *        tag.
     * 
     * Otherwise, this value is undefined and should not be used.
     * 
     * For more information see <a href="https://docs.microsoft.com/windows/desktop/FileIO/reparse-point-tags">Reparse Point Tags</a>.
     * @type {Integer}
     */
    dwReserved0 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The name of the file.
     * @type {String}
     */
    cFileName {
        get => StrGet(this.ptr + 48, 259, "UTF-8")
        set => StrPut(value, this.ptr + 48, 259, "UTF-8")
    }

    /**
     * An alternative name for the file.
     * 
     * This name is in the classic 8.3 file name format.
     * @type {String}
     */
    cAlternateFileName {
        get => StrGet(this.ptr + 308, 13, "UTF-8")
        set => StrPut(value, this.ptr + 308, 13, "UTF-8")
    }
}
