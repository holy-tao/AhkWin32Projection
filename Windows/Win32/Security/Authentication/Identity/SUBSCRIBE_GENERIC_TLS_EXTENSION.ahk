#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\TLS_EXTENSION_SUBSCRIPTION.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SUBSCRIBE_GENERIC_TLS_EXTENSION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SubscriptionsCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<TLS_EXTENSION_SUBSCRIPTION>}
     */
    Subscriptions{
        get {
            if(!this.HasProp("__SubscriptionsProxyArray"))
                this.__SubscriptionsProxyArray := Win32FixedArray(this.ptr + 8, 1, TLS_EXTENSION_SUBSCRIPTION, "")
            return this.__SubscriptionsProxyArray
        }
    }
}
