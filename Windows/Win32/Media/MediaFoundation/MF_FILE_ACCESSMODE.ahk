#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the requested access mode for opening a file.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_FILE_ACCESSMODE extends Win32Enum {

    /**
     * Read mode.
     * Native name: MF_ACCESSMODE_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Write mode.
     * Native name: MF_ACCESSMODE_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 2

    /**
     * Read and write mode.
     * Native name: MF_ACCESSMODE_READWRITE
     * @type {Integer (Int32)}
     */
    static READWRITE => 3
}
