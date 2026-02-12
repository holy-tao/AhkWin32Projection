#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of negotiation on encryption algorithms permitted by the server.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxallowedsmimeencryptionalgorithmnegotiation
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation extends Win32Enum{

    /**
     * No negotiation is allowed.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Strong encryption is required.
     * @type {Integer (Int32)}
     */
    static StrongAlgorithm => 1

    /**
     * Minimal encryption is required.
     * @type {Integer (Int32)}
     */
    static AnyAlgorithm => 2
}
