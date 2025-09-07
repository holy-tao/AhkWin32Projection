#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Storage\Vhd\VIRTUAL_STORAGE_TYPE.ahk
#Include .\STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY.ahk
#Include .\STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_QUERY_DEPENDENT_VOLUME_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ResponseLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY>}
     */
    Lev1Depends{
        get {
            if(!this.HasProp("__Lev1DependsProxyArray"))
                this.__Lev1DependsProxyArray := Win32FixedArray(this.ptr + 8, 8, STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY, "")
            return this.__Lev1DependsProxyArray
        }
    }

    /**
     * @type {Array<STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY>}
     */
    Lev2Depends{
        get {
            if(!this.HasProp("__Lev2DependsProxyArray"))
                this.__Lev2DependsProxyArray := Win32FixedArray(this.ptr + 8, 8, STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY, "")
            return this.__Lev2DependsProxyArray
        }
    }
}
