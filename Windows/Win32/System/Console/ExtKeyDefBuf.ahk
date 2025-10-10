#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ExtKeySubst.ahk
#Include .\ExtKeyDef.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class ExtKeyDefBuf extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCheckSum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<ExtKeyDef>}
     */
    table{
        get {
            if(!this.HasProp("__tableProxyArray"))
                this.__tableProxyArray := Win32FixedArray(this.ptr + 8, 26, ExtKeyDef, "")
            return this.__tableProxyArray
        }
    }
}
