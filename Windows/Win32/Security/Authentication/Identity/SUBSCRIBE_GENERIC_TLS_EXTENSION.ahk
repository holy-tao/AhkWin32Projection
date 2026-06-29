#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TLS_EXTENSION_SUBSCRIPTION.ahk" { TLS_EXTENSION_SUBSCRIPTION }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SUBSCRIBE_GENERIC_TLS_EXTENSION {
    #StructPack 4

    Flags : UInt32

    SubscriptionsCount : UInt32

    Subscriptions : TLS_EXTENSION_SUBSCRIPTION[1]

}
