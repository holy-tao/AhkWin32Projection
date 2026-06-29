#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_SNAPSHOT_STATE.ahk" { VSS_SNAPSHOT_STATE }
#Import ".\VSS_PROVIDER_TYPE.ahk" { VSS_PROVIDER_TYPE }
#Import ".\VSS_PROVIDER_PROP.ahk" { VSS_PROVIDER_PROP }
#Import ".\VSS_SNAPSHOT_PROP.ahk" { VSS_SNAPSHOT_PROP }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_OBJECT_UNION {
    #StructPack 8

    Snap : VSS_SNAPSHOT_PROP

    static __New() {
        DefineProp(this.Prototype, 'Prov', { type: VSS_PROVIDER_PROP, offset: 0 })
        this.DeleteProp("__New")
    }
}
