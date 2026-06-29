#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_DIFF_VOLUME_PROP.ahk" { VSS_DIFF_VOLUME_PROP }
#Import ".\VSS_DIFF_AREA_PROP.ahk" { VSS_DIFF_AREA_PROP }
#Import ".\VSS_VOLUME_PROP.ahk" { VSS_VOLUME_PROP }

/**
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_MGMT_OBJECT_UNION {
    #StructPack 8

    Vol : VSS_VOLUME_PROP

    static __New() {
        DefineProp(this.Prototype, 'DiffVol', { type: VSS_DIFF_VOLUME_PROP, offset: 0 })
        DefineProp(this.Prototype, 'DiffArea', { type: VSS_DIFF_AREA_PROP, offset: 0 })
        this.DeleteProp("__New")
    }
}
