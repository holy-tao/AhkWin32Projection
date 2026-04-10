#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIAKEYS_REQUIREMENT extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYS_REQUIREMENT_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYS_REQUIREMENT_OPTIONAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYS_REQUIREMENT_NOT_ALLOWED => 3
}
