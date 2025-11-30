#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BP_PAINTPARAMS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static BPPF_ERASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BPPF_NOCLIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BPPF_NONCLIENT => 4
}
