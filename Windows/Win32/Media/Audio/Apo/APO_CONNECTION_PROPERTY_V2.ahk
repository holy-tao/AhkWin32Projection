#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APO_CONNECTION_PROPERTY.ahk" { APO_CONNECTION_PROPERTY }
#Import ".\APO_BUFFER_FLAGS.ahk" { APO_BUFFER_FLAGS }

/**
 * Contains the dynamically changing connection properties. Version two of this structure introduces a time stamp that can be used to synchronize an auxiliary reference stream initialized with IApoAuxiliaryInputConfiguration.
 * @remarks
 * If the **u32Signature** field of the [APO_CONNECTION_PROPERTY](ns-audioapotypes-apo_connection_property.md) structure passed into [IAudioProcessingObjectRT::APOProcess](../audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-apoprocess.md) is equal to **APO_CONNECTION_PROPERTY_V2_SIGNATURE**, the structure can be safely typecast to a **APO_CONNECTION_PROPERTY_V2**.
 * 
 * This structure was introduced to support acoustic echo cancellation scenarios. For more information, see [IApoAcousticEchoCancellation](../audioenginebaseapo/nn-audioenginebaseapo-iapoacousticechocancellation.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioapotypes/ns-audioapotypes-apo_connection_property_v2
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_CONNECTION_PROPERTY_V2 {
    #StructPack 8

    /**
     * A [APO_CONNECTION_PROPERTY](ns-audioapotypes-apo_connection_property.md) structure containing the version 1 properties.
     */
    property : APO_CONNECTION_PROPERTY

    /**
     * An unsigned 64-bit value representing a [QueryPerformanceCounter](/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) (QPC) time stamp for an audio buffer.
     */
    u64QPCTime : Int64

}
