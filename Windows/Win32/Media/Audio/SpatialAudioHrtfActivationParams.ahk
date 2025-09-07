#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the activation parameters for an ISpatialAudioRenderStreamForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfactivationparams
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfActivationParams extends Win32Struct
{
    static sizeof => 72

    static packingSize => 1

    /**
     * Format descriptor for spatial audio objects associated with the stream. All objects must have the same format and must be of type <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd390971(v=vs.85)">WAVEFORMATEXTENSIBLE</a>.
     * @type {Pointer<WAVEFORMATEX>}
     */
    ObjectFormat {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A bitwise combination of <b>AudioObjectType</b> values indicating the set of static spatial audio channels that will be allowed by the activated stream.
     * @type {Integer}
     */
    StaticObjectTypeMask {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The minimum number of concurrent dynamic objects. If this number of dynamic audio objects can't be activated simultaneously, no dynamic audio objects will be activated.
     * @type {Integer}
     */
    MinDynamicObjectCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum number of concurrent dynamic objects that can be activated with <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf">ISpatialAudioRenderStreamForHrtf</a>.
     * @type {Integer}
     */
    MaxDynamicObjectCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The category of the audio stream and its spatial audio objects.
     * @type {Integer}
     */
    Category {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The event that will signal the client to provide more audio data. This handle will be duplicated internally before it is used.
     * @type {Pointer<Ptr>}
     */
    EventHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The object that provides notifications for spatial audio clients to respond to changes in the state of an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf">ISpatialAudioRenderStreamForHrtf</a>. This object is used to notify clients that the number of dynamic spatial audio objects that can be activated concurrently is about to change.
     * @type {Pointer<ISpatialAudioObjectRenderStreamNotify>}
     */
    NotifyObject {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Optional default value for the decay model used for <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     * @type {Pointer<SpatialAudioHrtfDistanceDecay>}
     */
    DistanceDecay {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Optional default value for the spatial audio directivity model used for <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     * @type {Pointer<SpatialAudioHrtfDirectivityUnion>}
     */
    Directivity {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Optional default value for the type of environment that is simulated when audio is processed for <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     * @type {Pointer<Int32>}
     */
    Environment {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Optional default value for the orientation of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> objects associated with the stream. <b>nullptr</b> if unused.
     * @type {Pointer<Single>}
     */
    Orientation {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
