#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SpatialAudioHrtfDirectivityType.ahk" { SpatialAudioHrtfDirectivityType }
#Import ".\SpatialAudioHrtfDirectivityCone.ahk" { SpatialAudioHrtfDirectivityCone }
#Import ".\SpatialAudioHrtfDirectivity.ahk" { SpatialAudioHrtfDirectivity }
#Import ".\SpatialAudioHrtfDirectivityCardioid.ahk" { SpatialAudioHrtfDirectivityCardioid }

/**
 * Defines a spatial audio directivity model for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivityunion
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfDirectivityUnion {
    #StructPack 4

    /**
     * A cone-shaped directivity model
     */
    Cone : SpatialAudioHrtfDirectivityCone

    static __New() {
        DefineProp(this.Prototype, 'Cardiod', { type: SpatialAudioHrtfDirectivityCardioid, offset: 0 })
        DefineProp(this.Prototype, 'Omni', { type: SpatialAudioHrtfDirectivity, offset: 0 })
        this.DeleteProp("__New")
    }
}
