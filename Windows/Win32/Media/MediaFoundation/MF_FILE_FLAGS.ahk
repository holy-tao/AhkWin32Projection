#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior when opening a file.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mf_file_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_FILE_FLAGS extends Win32Enum{

    /**
     * Use the default behavior.
     * @type {Integer (Int32)}
     */
    static MF_FILEFLAGS_NONE => 0

    /**
     * Open the file with no system caching.
     * @type {Integer (Int32)}
     */
    static MF_FILEFLAGS_NOBUFFERING => 1

    /**
     * Subsequent open operations can have write access to the file.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MF_FILEFLAGS_ALLOW_WRITE_SHARING => 2
}
