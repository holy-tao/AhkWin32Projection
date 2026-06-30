#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME.ahk
#Include .\CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME.ahk
#Include .\CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_SHARED_VOLUME_RENAME_GUID_INPUT extends Win32Struct {
    static sizeof => 1152

    static packingSize => 8

    /**
     * @type {CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME}
     */
    Base {
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME(0, this)
            return this.__Base
        }
    }

    /**
     * @type {CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME}
     */
    Base2 {
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUSTER_SHARED_VOLUME_RENAME_INPUT_GUID_NAME(528, this)
            return this.__Base2
        }
    }
}
