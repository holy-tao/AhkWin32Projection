#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VSS_SNAPSHOT_PROP.ahk
#Include .\VSS_PROVIDER_PROP.ahk

/**
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_OBJECT_UNION extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {VSS_SNAPSHOT_PROP}
     */
    Snap{
        get {
            if(!this.HasProp("__Snap"))
                this.__Snap := VSS_SNAPSHOT_PROP(0, this)
            return this.__Snap
        }
    }

    /**
     * @type {VSS_PROVIDER_PROP}
     */
    Prov{
        get {
            if(!this.HasProp("__Prov"))
                this.__Prov := VSS_PROVIDER_PROP(0, this)
            return this.__Prov
        }
    }
}
