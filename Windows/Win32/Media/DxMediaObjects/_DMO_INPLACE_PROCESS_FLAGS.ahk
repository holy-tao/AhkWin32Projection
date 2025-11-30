#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_INPLACE_PROCESS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DMO_INPLACE_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DMO_INPLACE_ZERO => 1
}
