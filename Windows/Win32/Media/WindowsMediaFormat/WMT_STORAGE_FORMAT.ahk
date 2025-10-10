#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_STORAGE_FORMAT enumeration type defines the file types that can be manipulated with this SDK.
 * @remarks
 * 
  * Storage format MP3 is supported for reading, but not writing.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_storage_format
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_STORAGE_FORMAT{

    /**
     * The file is encoded in MP3 format.
     * @type {Integer (Int32)}
     */
    static WMT_Storage_Format_MP3 => 0

    /**
     * The file is encoded in Windows Media Format.
     * @type {Integer (Int32)}
     */
    static WMT_Storage_Format_V1 => 1
}
