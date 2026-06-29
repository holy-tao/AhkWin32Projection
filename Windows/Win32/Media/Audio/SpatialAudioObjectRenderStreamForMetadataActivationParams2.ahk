#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\ISpatialAudioObjectRenderStreamNotify.ahk" { ISpatialAudioObjectRenderStreamNotify }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_STREAM_CATEGORY.ahk" { AUDIO_STREAM_CATEGORY }
#Import ".\SPATIAL_AUDIO_STREAM_OPTIONS.ahk" { SPATIAL_AUDIO_STREAM_OPTIONS }
#Import ".\AudioObjectType.ahk" { AudioObjectType }

/**
 * Represents activation parameters for a spatial audio render stream for metadata, extending SpatialAudioObjectRenderStreamForMetadataActivationParams with the ability to specify stream options.
 * @remarks
 * The following example shows how  to activate a metadata stream with stream options.
 * 
 * ```cpp
 * void CreateSpatialAudioObjectRenderStreamForMetadata(
 *     _In_ ISpatialAudioClient2* spatialAudioClient,
 *     _In_ WAVEFORMATEX const* objectFormat,
 *     AudioObjectType staticObjectTypeMask,
 *     UINT32 minDynamicObjectCount,
 *     UINT32 maxDynamicObjectCount,
 *     AUDIO_STREAM_CATEGORY streamCategory,
 *     _In_ HANDLE eventHandle,
 *     REFGUID metadataFormatId,
 *     UINT32 maxMetadataItemCount,
 *     _In_opt_ PROPVARIANT const* metadataActivationParams,
 *     _In_opt_ ISpatialAudioObjectRenderStreamNotify* notifyObject,
 *     bool enableOffload,
 *     _COM_Outptr_ ISpatialAudioObjectRenderStreamForMetadata** stream)
 * {
 *     SpatialAudioObjectRenderStreamForMetadataActivationParams2 streamActivationParams =
 *     {
 *         objectFormat,
 *         staticObjectTypeMask,
 *         minDynamicObjectCount,
 *         maxDynamicObjectCount,
 *         streamCategory,
 *         eventHandle,
 *         metadataFormatId,
 *         maxMetadataItemCount,
 *         metadataActivationParams,
 *         notifyObject,
 *         enableOffload ? SPATIAL_AUDIO_STREAM_OPTIONS_OFFLOAD : SPATIAL_AUDIO_STREAM_OPTIONS_NONE
 *     };
 * 
 *     PROPVARIANT activateParamsPropVariant = {};
 *     activateParamsPropVariant.vt = VT_BLOB;
 *     activateParamsPropVariant.blob.cbSize = sizeof(streamActivationParams);
 *     activateParamsPropVariant.blob.pBlobData = reinterpret_cast<BYTE*>(&streamActivationParams);
 * 
 *     *stream = nullptr;
 *     THROW_IF_FAILED(spatialAudioClient->ActivateSpatialAudioStream(&activateParamsPropVariant, IID_PPV_ARGS(stream)));
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/ns-spatialaudiometadata-spatialaudioobjectrenderstreamformetadataactivationparams2
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioObjectRenderStreamForMetadataActivationParams2 {
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
    MaxMetadataItemCount : UInt32

    /**
     * Additional activation parameters.
     */
    MetadataActivationParams : PROPVARIANT.Ptr

    /**
     * The object that provides notifications for spatial audio clients to respond to changes in the state of an  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstream">ISpatialAudioObjectRenderStream</a>. This object is used to notify clients that the number of dynamic spatial audio objects that can be activated concurrently is about to change.
     */
    NotifyObject : ISpatialAudioObjectRenderStreamNotify

    /**
     * A member of the <xref:NE:spatialaudioclient.SPATIAL_AUDIO_STREAM_OPTIONS> emumeration, specifying options for the activated audio stream.
     */
    Options : SPATIAL_AUDIO_STREAM_OPTIONS

}
