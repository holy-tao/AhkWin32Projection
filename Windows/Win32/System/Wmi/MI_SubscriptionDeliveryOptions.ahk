#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The subscription options object stores configuration options used for passing into subscription operations.
 * @remarks
 * This structure is created by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newsubscriptiondeliveryoptions">MI_Application_NewSubscriptionDeliveryOptions</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_subscriptiondeliveryoptions
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SubscriptionDeliveryOptions extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reserved for internal use only.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for internal use only.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <b>MI_SubscriptionDeliveryOptions</b> function table.
     * @type {Pointer<MI_SubscriptionDeliveryOptionsFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
