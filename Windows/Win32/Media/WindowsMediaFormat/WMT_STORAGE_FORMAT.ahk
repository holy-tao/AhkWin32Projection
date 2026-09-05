#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_STORAGE_FORMAT enumeration type defines the file types that can be manipulated with this SDK.
 * @remarks
 * Storage format MP3 is supported for reading, but not writing.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_storage_format
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_STORAGE_FORMAT extends Win32Enum {

    /**
     * The file is encoded in MP3 format.
     * Native name: WMT_Storage_Format_MP3
     * @type {Integer (Int32)}
     */
    static MP3 => 0

    /**
     * The file is encoded in Windows Media Format.
     * Native name: WMT_Storage_Format_V1
     * @type {Integer (Int32)}
     */
    static V1 => 1
}
