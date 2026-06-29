#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\ISpatialAudioObjectRenderStreamNotify.ahk" { ISpatialAudioObjectRenderStreamNotify }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_STREAM_CATEGORY.ahk" { AUDIO_STREAM_CATEGORY }
#Import ".\AudioObjectType.ahk" { AudioObjectType }

/**
 * Represents activation parameters for a spatial audio render stream for metadata. Pass this structure to ISpatialAudioClient::ActivateSpatialAudioStream when activating a stream.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/ns-spatialaudiometadata-spatialaudioobjectrenderstreamformetadataactivationparams
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioObjectRenderStreamForMetadataActivationParams {
    #StructPack 8

    /**
     * Format descriptor for a single spatial audio object. All objects used by the stream must have the same format and the format must be of type <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> or <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a>.
     */
    ObjectFormat : WAVEFORMATEX.Ptr

    /**
     * A bitwise combination of <b>AudioObjectType</b> values indicating the set of static spatial audio channels that will be allowed by the activated stream.
     */
    StaticObjectTypeMask : AudioObjectType

    /**
     * The minimum number of concurrent dynamic objects. If this number of dynamic audio objects can't be activated simultaneously, <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a> will fail with this error <b>SPTLAUDCLNT_E_NO_MORE_OBJECTS</b>.
     */
    MinDynamicObjectCount : UInt32

    /**
     * The maximum number of concurrent dynamic objects that can be activated with <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstream">ISpatialAudioObjectRenderStream</a>.
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
     * The identifier of  the metadata format for the currently active spatial rendering engine.
     */
    MetadataFormatId : Guid

    /**
     * The maximum number of metadata items per frame.
     */
    MaxMetadataItemCount : UInt16

    /**
     * Additional activation parameters.
     */
    MetadataActivationParams : PROPVARIANT.Ptr

    /**
     * The object that provides notifications for spatial audio clients to respond to changes in the state of an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstream">ISpatialAudioObjectRenderStream</a>. This object is used to notify clients that the number of dynamic spatial audio objects that can be activated concurrently is about to change.
     */
    NotifyObject : ISpatialAudioObjectRenderStreamNotify

}
