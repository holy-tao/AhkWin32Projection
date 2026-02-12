#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the spatial audio processing model used by an [AudioNodeEmitter](audionodeemitter.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiomodel
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class SpatialAudioModel extends Win32Enum{

    /**
     * Spatial audio is processed using the Microsoft head-relative transfer function (HRTF) algorithm. This provides a more realistic spatial sound that preserves X, Y, and Z coordinates of the emitter, but at a higher CPU and memory cost than fold-down processing.
     * @type {Integer (Int32)}
     */
    static ObjectBased => 0

    /**
     * Spatial audio is processed using non-spatial methods, such as panning between stereo channels. This provides less realistic spatial sound that preserves the X and Z coordinates of the emitter, but effectively ignores the Y coordinate. This model has a lower CPU and memory cost than object-based processing.
     * @type {Integer (Int32)}
     */
    static FoldDown => 1
}
