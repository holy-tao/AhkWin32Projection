#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of credentials to use when communicating with event sources.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_credentials_type
 * @namespace Windows.Win32.System.EventCollector
 */
class EC_SUBSCRIPTION_CREDENTIALS_TYPE extends Win32Enum {

    /**
     * Negotiate with event sources to specify a proper authentication type without specifying a username and password for the subscription credentials.
     * Native name: EcSubscriptionCredDefault
     * @type {Integer (Int32)}
     */
    static CredDefault => 0

    /**
     * WinRM will negotiate with event sources to specify a proper authentication type for the subscription credentials.
     * Native name: EcSubscriptionCredNegotiate
     * @type {Integer (Int32)}
     */
    static CredNegotiate => 1

    /**
     * Use digest authentication for the subscription credentials.
     * Native name: EcSubscriptionCredDigest
     * @type {Integer (Int32)}
     */
    static CredDigest => 2

    /**
     * Send a username and password to use as credentials for the subscription.
     * Native name: EcSubscriptionCredBasic
     * @type {Integer (Int32)}
     */
    static CredBasic => 3

    /**
     * Use the local computer's domain account credentials to create a subscription instead of using  user credentials for the subscription. This has the advantage of not having to manage user accounts and password expiration to simplify long lasting subscription management.
     * Native name: EcSubscriptionCredLocalMachine
     * @type {Integer (Int32)}
     */
    static CredLocalMachine => 4
}
