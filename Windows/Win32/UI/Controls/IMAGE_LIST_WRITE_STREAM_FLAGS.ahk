#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IMAGE_LIST_WRITE_STREAM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static ILP_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ILP_DOWNLEVEL => 1
}
