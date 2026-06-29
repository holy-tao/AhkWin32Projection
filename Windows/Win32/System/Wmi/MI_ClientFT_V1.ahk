#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_DeserializerFT.ahk" { MI_DeserializerFT }
#Import ".\MI_OperationFT.ahk" { MI_OperationFT }
#Import ".\MI_HostedProviderFT.ahk" { MI_HostedProviderFT }
#Import ".\MI_ApplicationFT.ahk" { MI_ApplicationFT }
#Import ".\MI_DestinationOptionsFT.ahk" { MI_DestinationOptionsFT }
#Import ".\MI_UtilitiesFT.ahk" { MI_UtilitiesFT }
#Import ".\MI_SerializerFT.ahk" { MI_SerializerFT }
#Import ".\MI_OperationOptionsFT.ahk" { MI_OperationOptionsFT }
#Import ".\MI_SubscriptionDeliveryOptionsFT.ahk" { MI_SubscriptionDeliveryOptionsFT }
#Import ".\MI_SessionFT.ahk" { MI_SessionFT }

/**
 * Client function tables.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_clientft_v1
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ClientFT_V1 {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_applicationft">MI_ApplicationFT</a> function table 
     *       used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_application">MI_Application</a>.
     */
    applicationFT : MI_ApplicationFT.Ptr

    /**
     * Pointer to the <b>MI_SessionFT</b> function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_session">MI_Session</a>.
     */
    sessionFT : MI_SessionFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationft">MI_OperationFT</a> function table 
     *       used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operation">MI_Operation</a>.
     */
    operationFT : MI_OperationFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_hostedproviderft">MI_HostedProviderFT</a> function 
     *       table used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_hostedprovider">MI_HostedProvider</a>.
     */
    hostedProviderFT : MI_HostedProviderFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_serializerft">MI_SerializerFT</a> function table 
     *       used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_serializer">MI_Serializer</a>.
     */
    serializerFT : MI_SerializerFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_deserializerft">MI_DeserializerFT</a> function 
     *       table used by <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_deserializer">MI_Deserializer</a>.
     */
    deserializerFT : MI_DeserializerFT.Ptr

    /**
     * Pointer to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_subscriptiondeliveryoptionsft">MI_SubscriptionDeliveryOptionsFT</a> 
     *       function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_subscriptiondeliveryoptions">MI_SubscriptionDeliveryOptions</a>.
     */
    subscribeDeliveryOptionsFT : MI_SubscriptionDeliveryOptionsFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptionsft">MI_DestinationOptionsFT</a> 
     *       function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptions">MI_DestinationOptions</a>.
     */
    destinationOptionsFT : MI_DestinationOptionsFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptionsft">MI_OperationOptionsFT</a> 
     *       function table used by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptions">MI_OperationOptions</a>.
     */
    operationOptionsFT : MI_OperationOptionsFT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_utilitiesft">MI_UtilitiesFT</a> function 
     *       table.
     */
    utilitiesFT : MI_UtilitiesFT.Ptr

}
