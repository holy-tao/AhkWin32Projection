#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\APO_CONNECTION_PROPERTY.ahk

/**
 * Contains the dynamically changing connection properties. Version two of this structure introduces a time stamp that can be used to synchronize an auxiliary reference stream initialized with IApoAuxiliaryInputConfiguration.
 * @remarks
 * If the **u32Signature** field of the [APO_CONNECTION_PROPERTY](ns-audioapotypes-apo_connection_property.md) structure passed into [IAudioProcessingObjectRT::APOProcess](../audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectrt-apoprocess.md) is equal to **APO_CONNECTION_PROPERTY_V2_SIGNATURE**, the structure can be safely typecast to a **APO_CONNECTION_PROPERTY_V2**.
 * 
 * This structure was introduced to support acoustic echo cancellation scenarios. For more information, see [IApoAcousticEchoCancellation](../audioenginebaseapo/nn-audioenginebaseapo-iapoacousticechocancellation.md).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioapotypes/ns-audioapotypes-apo_connection_property_v2
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_CONNECTION_PROPERTY_V2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A [APO_CONNECTION_PROPERTY](ns-audioapotypes-apo_connection_property.md) structure containing the version 1 properties.
     * @type {APO_CONNECTION_PROPERTY}
     */
    property{
        get {
            if(!this.HasProp("__property"))
                this.__property := APO_CONNECTION_PROPERTY(0, this)
            return this.__property
        }
    }

    /**
     * An unsigned 64-bit value representing a [QueryPerformanceCounter](/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) (QPC) time stamp for an audio buffer.
     * @type {Integer}
     */
    u64QPCTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
