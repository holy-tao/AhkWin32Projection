#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\AUDIO_STREAM_CATEGORY.ahk" { AUDIO_STREAM_CATEGORY }
#Import ".\ISpatialAudioObjectRenderStreamNotify.ahk" { ISpatialAudioObjectRenderStreamNotify }
#Import ".\SpatialAudioHrtfDistanceDecay.ahk" { SpatialAudioHrtfDistanceDecay }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SpatialAudioHrtfDirectivityUnion.ahk" { SpatialAudioHrtfDirectivityUnion }
#Import ".\SpatialAudioHrtfEnvironmentType.ahk" { SpatialAudioHrtfEnvironmentType }
#Import ".\AudioObjectType.ahk" { AudioObjectType }

/**
 * Specifies the activation parameters for an ISpatialAudioRenderStreamForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfactivationparams
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfActivationParams {
    #StructPack 8

    /**
     * Format descriptor for spatial audio objects associated with the stream. All objects must have the same format and must be of type <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a>.
     */
    ObjectFormat : WAVEFORMATEX.Ptr

    /**
     * A bitwise combination of <b>AudioObjectType</b> values indicating the set of static spatial audio channels that will be allowed by the activated stream.
     */
    StaticObjectTypeMask : AudioObjectType

    /**
     * The minimum number of concurrent dynamic objects. If this number of dynamic audio objects can't be activated simultaneously, no dynamic audio objects will be activated.
     */
    MinDynamicObjectCount : UInt32

    /**
     * The maximum number of concurrent dynamic objects that can be activated with <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf">ISpatialAudioRenderStreamForHrtf</a>.
     */
    MaxDynamicObjectCount : UInt32

    /**
     * The category of the audio stream and its spatial audio objects.
     */
    Category : AUDIO_STREAM_CATEGORY

    /**
     * The event that will signal the client to provide more audio data. This handle will be duplicated internally before it is used.
     */
    EventHandle : HANDLE

    /**
     * The object that provides notifications for spatial audio clients to respond to changes in the state of an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf">ISpatialAudioRenderStreamForHrtf</a>. This object is used to notify clients that the number of dynamic spatial audio objects that can be activated concurrently is about to change.
     */
    NotifyObject : ISpatialAudioObjectRenderStreamNotify

    /**
     * Optional default value for the decay model used for <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     */
    DistanceDecay : SpatialAudioHrtfDistanceDecay.Ptr

    /**
     * Optional default value for the spatial audio directivity model used for <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     */
    Directivity : SpatialAudioHrtfDirectivityUnion.Ptr

    /**
     * Optional default value for the type of environment that is simulated when audio is processed for <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     */
    Environment : SpatialAudioHrtfEnvironmentType.Ptr

    /**
     * Optional default value for the orientation of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     */
    Orientation : IntPtr

}
