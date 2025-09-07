#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk

/**
 * Describes a numeric value identifying the physical drive of a disk.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_dword
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_DWORD extends Win32Struct
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
     * Numeric value identifying the physical drive of the disk. Valid values begin at zero.
     * @type {Integer}
     */
    dw {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
