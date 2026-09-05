#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIAKEYS_REQUIREMENT extends Win32Enum {

    /**
     * Native name: MF_MEDIAKEYS_REQUIREMENT_REQUIRED
     * @type {Integer (Int32)}
     */
    static REQUIRED => 1

    /**
     * Native name: MF_MEDIAKEYS_REQUIREMENT_OPTIONAL
     * @type {Integer (Int32)}
     */
    static OPTIONAL => 2

    /**
     * Native name: MF_MEDIAKEYS_REQUIREMENT_NOT_ALLOWED
     * @type {Integer (Int32)}
     */
    static NOT_ALLOWED => 3
}
