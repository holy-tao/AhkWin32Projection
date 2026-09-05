#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior when opening a file.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_FILE_FLAGS extends Win32Enum {

    /**
     * Use the default behavior.
     * Native name: MF_FILEFLAGS_NONE
     * @type {Integer (Int32)}
     */
    static FILEFLAGS_NONE => 0

    /**
     * Open the file with no system caching.
     * Native name: MF_FILEFLAGS_NOBUFFERING
     * @type {Integer (Int32)}
     */
    static FILEFLAGS_NOBUFFERING => 1

    /**
     * Subsequent open operations can have write access to the file.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * Native name: MF_FILEFLAGS_ALLOW_WRITE_SHARING
     * @type {Integer (Int32)}
     */
    static FILEFLAGS_ALLOW_WRITE_SHARING => 2
}
