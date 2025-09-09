#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QCMINFO_IDMAP_PLACEMENT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class QCMINFO_IDMAP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    nMaxIds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<QCMINFO_IDMAP_PLACEMENT>}
     */
    pIdList{
        get {
            if(!this.HasProp("__pIdListProxyArray"))
                this.__pIdListProxyArray := Win32FixedArray(this.ptr + 8, 1, QCMINFO_IDMAP_PLACEMENT, "")
            return this.__pIdListProxyArray
        }
    }
}
