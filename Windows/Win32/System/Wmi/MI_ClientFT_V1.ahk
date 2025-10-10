#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Client function tables.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_clientft_v1
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ClientFT_V1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_applicationft">MI_ApplicationFT</a> function table 
     *       used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_application">MI_Application</a>.
     * @type {Pointer<MI_ApplicationFT>}
     */
    applicationFT {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the <b>MI_SessionFT</b> function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_session">MI_Session</a>.
     * @type {Pointer<MI_SessionFT>}
     */
    sessionFT {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationft">MI_OperationFT</a> function table 
     *       used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operation">MI_Operation</a>.
     * @type {Pointer<MI_OperationFT>}
     */
    operationFT {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_hostedproviderft">MI_HostedProviderFT</a> function 
     *       table used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_hostedprovider">MI_HostedProvider</a>.
     * @type {Pointer<MI_HostedProviderFT>}
     */
    hostedProviderFT {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_serializerft">MI_SerializerFT</a> function table 
     *       used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_serializer">MI_Serializer</a>.
     * @type {Pointer<MI_SerializerFT>}
     */
    serializerFT {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_deserializerft">MI_DeserializerFT</a> function 
     *       table used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_deserializer">MI_Deserializer</a>.
     * @type {Pointer<MI_DeserializerFT>}
     */
    deserializerFT {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_subscriptiondeliveryoptionsft">MI_SubscriptionDeliveryOptionsFT</a> 
     *       function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_subscriptiondeliveryoptions">MI_SubscriptionDeliveryOptions</a>.
     * @type {Pointer<MI_SubscriptionDeliveryOptionsFT>}
     */
    subscribeDeliveryOptionsFT {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptionsft">MI_DestinationOptionsFT</a> 
     *       function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptions">MI_DestinationOptions</a>.
     * @type {Pointer<MI_DestinationOptionsFT>}
     */
    destinationOptionsFT {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptionsft">MI_OperationOptionsFT</a> 
     *       function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptions">MI_OperationOptions</a>.
     * @type {Pointer<MI_OperationOptionsFT>}
     */
    operationOptionsFT {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_utilitiesft">MI_UtilitiesFT</a> function 
     *       table.
     * @type {Pointer<MI_UtilitiesFT>}
     */
    utilitiesFT {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
