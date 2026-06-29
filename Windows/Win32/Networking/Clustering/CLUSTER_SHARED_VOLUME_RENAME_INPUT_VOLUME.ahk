#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE.ahk" { CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SHARED_VOLUME_RENAME_INPUT_VOLUME {
    #StructPack 8

    InputType : CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE

    VolumeOffset : Int64

    static __New() {
        DefineProp(this.Prototype, 'VolumeId', { type: WCHAR[260], offset: 8 })
        DefineProp(this.Prototype, 'VolumeName', { type: WCHAR[260], offset: 8 })
        DefineProp(this.Prototype, 'VolumeGuid', { type: WCHAR[50], offset: 8 })
        this.DeleteProp("__New")
    }
}
