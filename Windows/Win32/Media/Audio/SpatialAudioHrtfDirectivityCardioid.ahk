#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SpatialAudioHrtfDirectivityType.ahk" { SpatialAudioHrtfDirectivityType }
#Import ".\SpatialAudioHrtfDirectivity.ahk" { SpatialAudioHrtfDirectivity }

/**
 * Represents a cardioid-shaped directivity model for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivitycardioid
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfDirectivityCardioid {
    #StructPack 4

    /**
     * A structure that expresses the direction in which sound is emitted by an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a>.
     */
    directivity : SpatialAudioHrtfDirectivity

    /**
     * The order of the cardioid.
     */
    Order : Float32

}
