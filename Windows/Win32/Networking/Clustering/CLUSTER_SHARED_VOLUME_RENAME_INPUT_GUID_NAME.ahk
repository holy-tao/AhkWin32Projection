#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME extends Win32Struct
{
    static sizeof => 620

    static packingSize => 2

    /**
     * @type {String}
     */
    NewVolumeName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    NewVolumeGuid {
        get => StrGet(this.ptr + 520, 49, "UTF-16")
        set => StrPut(value, this.ptr + 520, 49, "UTF-16")
    }
}
