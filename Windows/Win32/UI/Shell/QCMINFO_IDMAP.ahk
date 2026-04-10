#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QCMINFO_IDMAP_PLACEMENT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class QCMINFO_IDMAP extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    nMaxIds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {QCMINFO_IDMAP_PLACEMENT}
     */
    pIdList {
        get {
            if(!this.HasProp("__pIdListProxyArray"))
                this.__pIdListProxyArray := Win32FixedArray(this.ptr + 4, 1, QCMINFO_IDMAP_PLACEMENT, "")
            return this.__pIdListProxyArray
        }
    }
}
