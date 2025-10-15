#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
    PoolZeroingSupportPresent{
        get {
            if(!this.HasProp("__PoolZeroingSupportPresent"))
                this.__PoolZeroingSupportPresent := BOOLEAN(this.ptr + 0)
            return this.__PoolZeroingSupportPresent
        }
    }
}
