#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_SubscriptionDeliveryOptionsFT.ahk" { MI_SubscriptionDeliveryOptionsFT }

/**
 * The subscription options object stores configuration options used for passing into subscription operations.
 * @remarks
 * This structure is created by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newsubscriptiondeliveryoptions">MI_Application_NewSubscriptionDeliveryOptions</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_subscriptiondeliveryoptions
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_SubscriptionDeliveryOptions {
    #StructPack 8

    /**
     * Reserved for internal use only.
     */
    reserved1 : Int64

    /**
     * Reserved for internal use only.
     */
    reserved2 : IntPtr

    /**
     * Pointer to the <b>MI_SubscriptionDeliveryOptions</b> function table.
     */
    ft : MI_SubscriptionDeliveryOptionsFT.Ptr

}
