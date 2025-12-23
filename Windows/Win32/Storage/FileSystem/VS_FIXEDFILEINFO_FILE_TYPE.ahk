#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VS_FIXEDFILEINFO_FILE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VFT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static VFT_APP => 1

    /**
     * @type {Integer (Int32)}
     */
    static VFT_DLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static VFT_DRV => 3

    /**
     * @type {Integer (Int32)}
     */
    static VFT_FONT => 4

    /**
     * @type {Integer (Int32)}
     */
    static VFT_VXD => 5

    /**
     * @type {Integer (Int32)}
     */
    static VFT_STATIC_LIB => 7
}
