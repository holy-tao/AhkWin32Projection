#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_SubscriptionDeliveryOptions structure. Use the functions with the name prefix &quot;MI_SubscriptionDeliveryOptions_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_subscriptiondeliveryoptionsft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_SubscriptionDeliveryOptionsFT {
    #StructPack 8

    /**
     * Sets the value of a named string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setstring">MI_SubscriptionDeliveryOptions_SetString</a>.
     */
    SetString : IntPtr

    /**
     * Sets the value of a named numeric option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setnumber">MI_SubscriptionDeliveryOptions_SetNumber</a>.
     */
    SetNumber : IntPtr

    /**
     * Sets the value of a named DateTime option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setdatetime">MI_SubscriptionDeliveryOptions_SetDateTime</a>.
     */
    SetDateTime : IntPtr

    /**
     * Sets the value of a named interval option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setinterval">MI_SubscriptionDeliveryOptions_SetInterval</a>.
     */
    SetInterval : IntPtr

    /**
     * Used Internally.
     */
    AddCredentials : IntPtr

    /**
     * Deletes the specified subscription delivery options structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_delete">MI_SubscriptionDeliveryOptions_Delete</a>.
     */
    Delete : IntPtr

    /**
     * Gets the value of the named string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getstring">MI_SubscriptionDeliveryOptions_GetString</a>.
     */
    GetString : IntPtr

    /**
     * Gets the value of the named numeric option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getnumber">MI_SubscriptionDeliveryOptions_GetNumber</a>.
     */
    GetNumber : IntPtr

    /**
     * Gets a previously set DateTime option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getdatetime">MI_SubscriptionDeliveryOptions_GetDateTime</a>.
     */
    GetDateTime : IntPtr

    /**
     * Gets the delivery interval for a specified option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getinterval">MI_SubscriptionDeliveryOptions_GetInterval</a>.
     */
    GetInterval : IntPtr

    /**
     * Gets the number of previously set options. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getoptioncount">MI_SubscriptionDeliveryOptions_GetOptionCount</a>.
     */
    GetOptionCount : IntPtr

    /**
     * Gets the option at the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getoptionat">MI_SubscriptionDeliveryOptions_GetOptionAt</a>.
     */
    GetOptionAt : IntPtr

    /**
     * Gets the value of the named option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getoption">MI_SubscriptionDeliveryOptions_GetOption</a>.
     */
    GetOption : IntPtr

    /**
     * Gets the number of previously added credentials. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getcredentialscount">MI_SubscriptionDeliveryOptions_GetCredentialsCount</a>.
     */
    GetCredentialsCount : IntPtr

    /**
     * Gets a previously added credential based on a specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getcredentialsat">MI_SubscriptionDeliveryOptions_GetCredentialsAt</a>.
     */
    GetCredentialsAt : IntPtr

    /**
     * Gets a previously added credential password based on a specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getcredentialspasswordat">MI_SubscriptionDeliveryOptions_GetCredentialsPasswordAt</a>.
     */
    GetCredentialsPasswordAt : IntPtr

    /**
     * Creates a copy of a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_subscriptiondeliveryoptions">MI_SubscriptionDeliveryOptions</a> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_clone">MI_SubscriptionDeliveryOptions_Clone</a>.
     */
    Clone : IntPtr

}
