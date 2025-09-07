#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the requested access mode for opening a file.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_FILE_ACCESSMODE{

    /**
     * Read mode.
     * @type {Integer (Int32)}
     */
    static MF_ACCESSMODE_READ => 1

    /**
     * Write mode.
     * @type {Integer (Int32)}
     */
    static MF_ACCESSMODE_WRITE => 2

    /**
     * Read and write mode.
     * @type {Integer (Int32)}
     */
    static MF_ACCESSMODE_READWRITE => 3
}
