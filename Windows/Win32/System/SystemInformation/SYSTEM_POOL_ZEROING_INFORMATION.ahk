#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_POOL_ZEROING_INFORMATION extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    PoolZeroingSupportPresent {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
