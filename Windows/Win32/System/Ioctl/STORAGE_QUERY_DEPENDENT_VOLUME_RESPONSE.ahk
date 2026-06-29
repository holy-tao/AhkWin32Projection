#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY.ahk
#Include ..\..\Storage\Vhd\VIRTUAL_STORAGE_TYPE.ahk
#Include .\STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_QUERY_DEPENDENT_VOLUME_RESPONSE extends Win32Struct {
    static sizeof => 76

    static packingSize => 4

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
     * @type {STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY}
     */
    Lev1Depends {
        get {
            if(!this.HasProp("__Lev1DependsProxyArray"))
                this.__Lev1DependsProxyArray := Win32FixedArray(this.ptr + 8, 1, STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY, "")
            return this.__Lev1DependsProxyArray
        }
    }

    /**
     * @type {STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY}
     */
    Lev2Depends {
        get {
            if(!this.HasProp("__Lev2DependsProxyArray"))
                this.__Lev2DependsProxyArray := Win32FixedArray(this.ptr + 8, 1, STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY, "")
            return this.__Lev2DependsProxyArray
        }
    }
}
