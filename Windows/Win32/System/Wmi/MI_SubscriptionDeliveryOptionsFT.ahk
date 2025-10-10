#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_SubscriptionDeliveryOptions structure. Use the functions with the name prefix &quot;MI_SubscriptionDeliveryOptions_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_subscriptiondeliveryoptionsft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SubscriptionDeliveryOptionsFT extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Sets the value of a named string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setstring">MI_SubscriptionDeliveryOptions_SetString</a>.
     * @type {Pointer}
     */
    SetString {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Sets the value of a named numeric option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setnumber">MI_SubscriptionDeliveryOptions_SetNumber</a>.
     * @type {Pointer}
     */
    SetNumber {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Sets the value of a named DateTime option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setdatetime">MI_SubscriptionDeliveryOptions_SetDateTime</a>.
     * @type {Pointer}
     */
    SetDateTime {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Sets the value of a named interval option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_setinterval">MI_SubscriptionDeliveryOptions_SetInterval</a>.
     * @type {Pointer}
     */
    SetInterval {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Used Internally.
     * @type {Pointer}
     */
    AddCredentials {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Deletes the specified subscription delivery options structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_delete">MI_SubscriptionDeliveryOptions_Delete</a>.
     * @type {Pointer}
     */
    Delete {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Gets the value of the named string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getstring">MI_SubscriptionDeliveryOptions_GetString</a>.
     * @type {Pointer}
     */
    GetString {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Gets the value of the named numeric option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getnumber">MI_SubscriptionDeliveryOptions_GetNumber</a>.
     * @type {Pointer}
     */
    GetNumber {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Gets a previously set DateTime option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getdatetime">MI_SubscriptionDeliveryOptions_GetDateTime</a>.
     * @type {Pointer}
     */
    GetDateTime {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Gets the delivery interval for a specified option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getinterval">MI_SubscriptionDeliveryOptions_GetInterval</a>.
     * @type {Pointer}
     */
    GetInterval {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Gets the number of previously set options. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getoptioncount">MI_SubscriptionDeliveryOptions_GetOptionCount</a>.
     * @type {Pointer}
     */
    GetOptionCount {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Gets the option at the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getoptionat">MI_SubscriptionDeliveryOptions_GetOptionAt</a>.
     * @type {Pointer}
     */
    GetOptionAt {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Gets the value of the named option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getoption">MI_SubscriptionDeliveryOptions_GetOption</a>.
     * @type {Pointer}
     */
    GetOption {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Gets the number of previously added credentials. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getcredentialscount">MI_SubscriptionDeliveryOptions_GetCredentialsCount</a>.
     * @type {Pointer}
     */
    GetCredentialsCount {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Gets a previously added credential based on a specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getcredentialsat">MI_SubscriptionDeliveryOptions_GetCredentialsAt</a>.
     * @type {Pointer}
     */
    GetCredentialsAt {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Gets a previously added credential password based on a specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_getcredentialspasswordat">MI_SubscriptionDeliveryOptions_GetCredentialsPasswordAt</a>.
     * @type {Pointer}
     */
    GetCredentialsPasswordAt {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Creates a copy of a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_subscriptiondeliveryoptions">MI_SubscriptionDeliveryOptions</a> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_subscriptiondeliveryoptions_clone">MI_SubscriptionDeliveryOptions_Clone</a>.
     * @type {Pointer}
     */
    Clone {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
