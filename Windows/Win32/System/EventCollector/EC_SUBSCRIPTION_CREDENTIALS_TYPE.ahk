#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of credentials to use when communicating with event sources.
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_credentials_type
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_CREDENTIALS_TYPE extends Win32Enum{

    /**
     * Negotiate with event sources to specify a proper authentication type without specifying a username and password for the subscription credentials.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCredDefault => 0

    /**
     * WinRM will negotiate with event sources to specify a proper authentication type for the subscription credentials.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCredNegotiate => 1

    /**
     * Use digest authentication for the subscription credentials.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCredDigest => 2

    /**
     * Send a username and password to use as credentials for the subscription.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCredBasic => 3

    /**
     * Use the local computer's domain account credentials to create a subscription instead of using  user credentials for the subscription. This has the advantage of not having to manage user accounts and password expiration to simplify long lasting subscription management.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCredLocalMachine => 4
}
