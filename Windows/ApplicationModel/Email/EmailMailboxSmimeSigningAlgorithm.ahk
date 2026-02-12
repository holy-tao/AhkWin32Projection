#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the algorithm used to sign an email.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsmimesigningalgorithm
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSmimeSigningAlgorithm extends Win32Enum{

    /**
     * No specific algorithm is required.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * Use Secure Hash Algorithm 1 (160-bit).
     * @type {Integer (Int32)}
     */
    static Sha1 => 1

    /**
     * Use Message Digest algorithm 5 (128-bit).
     * @type {Integer (Int32)}
     */
    static MD5 => 2
}
