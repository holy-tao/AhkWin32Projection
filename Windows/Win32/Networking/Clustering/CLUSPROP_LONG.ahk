#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk

/**
 * Describes signed LONG data.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_long
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_LONG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Signed <b>LONG</b> value.
     * @type {Integer}
     */
    l {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
