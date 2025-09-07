#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_STATE_INFO_EX extends Win32Struct
{
    static sizeof => 1584

    static packingSize => 8

    /**
     * @type {String}
     */
    szVolumeName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szNodeName {
        get => StrGet(this.ptr + 520, 259, "UTF-16")
        set => StrPut(value, this.ptr + 520, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    VolumeState {
        get => NumGet(this, 1040, "int")
        set => NumPut("int", value, this, 1040)
    }

    /**
     * @type {String}
     */
    szVolumeFriendlyName {
        get => StrGet(this.ptr + 1044, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1044, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    RedirectedIOReason {
        get => NumGet(this, 1568, "uint")
        set => NumPut("uint", value, this, 1568)
    }

    /**
     * @type {Integer}
     */
    VolumeRedirectedIOReason {
        get => NumGet(this, 1576, "uint")
        set => NumPut("uint", value, this, 1576)
    }
}
