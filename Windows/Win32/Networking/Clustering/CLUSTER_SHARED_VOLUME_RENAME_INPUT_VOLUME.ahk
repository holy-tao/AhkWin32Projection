#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    InputType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VolumeOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    VolumeId {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    VolumeName {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    VolumeGuid {
        get => StrGet(this.ptr + 8, 49, "UTF-16")
        set => StrPut(value, this.ptr + 8, 49, "UTF-16")
    }
}
