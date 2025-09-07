#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME.ahk
#Include .\CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_RENAME_INPUT extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME}
     */
    Base2{
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUSTER_SHARED_VOLUME_RENAME_INPUT_NAME(this.ptr + 24)
            return this.__Base2
        }
    }
}
