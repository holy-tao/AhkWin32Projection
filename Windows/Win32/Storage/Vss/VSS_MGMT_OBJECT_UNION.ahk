#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VSS_VOLUME_PROP.ahk
#Include .\VSS_DIFF_VOLUME_PROP.ahk
#Include .\VSS_DIFF_AREA_PROP.ahk

/**
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_MGMT_OBJECT_UNION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {VSS_VOLUME_PROP}
     */
    Vol{
        get {
            if(!this.HasProp("__Vol"))
                this.__Vol := VSS_VOLUME_PROP(0, this)
            return this.__Vol
        }
    }

    /**
     * @type {VSS_DIFF_VOLUME_PROP}
     */
    DiffVol{
        get {
            if(!this.HasProp("__DiffVol"))
                this.__DiffVol := VSS_DIFF_VOLUME_PROP(0, this)
            return this.__DiffVol
        }
    }

    /**
     * @type {VSS_DIFF_AREA_PROP}
     */
    DiffArea{
        get {
            if(!this.HasProp("__DiffArea"))
                this.__DiffArea := VSS_DIFF_AREA_PROP(0, this)
            return this.__DiffArea
        }
    }
}
