#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FS_BPIO_INFLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_INFL_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_INFL_SKIP_STORAGE_STACK_QUERY => 1
}
