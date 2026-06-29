#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SpatialAudioHrtfDirectivityType.ahk" { SpatialAudioHrtfDirectivityType }

/**
 * Represents an omnidirectional model for an ISpatialAudioObjectForHrtf. The omnidirectional emission is interpolated linearly with the directivity model specified in the Type field based on the value of the Scaling field.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivity
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfDirectivity {
    #StructPack 4

    /**
     * The type of shape in which sound is emitted by an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a>.
     */
    Type : SpatialAudioHrtfDirectivityType

    /**
     * The amount of linear interpolation applied between omnidirectional sound and the directivity specified in the <b>Type</b> field. This is a normalized value between 0 and 1.0 where 0 is omnidirectional and 1.0 is full directivity using the specified type.
     */
    Scaling : Float32

}
