#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Represents activation parameters for a spatial audio render stream. Pass this structure to ISpatialAudioClient::ActivateSpatialAudioStream when activating a stream.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/ns-spatialaudioclient-spatialaudioobjectrenderstreamactivationparams
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioObjectRenderStreamActivationParams extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Format descriptor for a single spatial audio object. All objects used by the stream must have the same format and the format must be of type <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a>.
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
     * The minimum number of concurrent dynamic objects. If this number of dynamic audio objects can't be activated simultaneously, <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a> will fail with this error <b>SPTLAUDCLNT_E_NO_MORE_OBJECTS</b>.
     * @type {Integer}
     */
    MinDynamicObjectCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum number of concurrent dynamic objects that can be activated with <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstream">ISpatialAudioObjectRenderStream</a>.
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
     * @type {HANDLE}
     */
    EventHandle{
        get {
            if(!this.HasProp("__EventHandle"))
                this.__EventHandle := HANDLE(this.ptr + 24)
            return this.__EventHandle
        }
    }

    /**
     * The object that provides notifications for spatial audio clients to respond to changes in the state of an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstream">ISpatialAudioObjectRenderStream</a>. This object is used to notify clients that the number of dynamic spatial audio objects that can be activated concurrently is about to change.
     * @type {Pointer<ISpatialAudioObjectRenderStreamNotify>}
     */
    NotifyObject {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
