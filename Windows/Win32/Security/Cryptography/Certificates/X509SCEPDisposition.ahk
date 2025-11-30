#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the resulting disposition of a request to process a response message.
 * @see https://docs.microsoft.com/windows/win32/api//certpol/ne-certpol-x509scepdisposition
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509SCEPDisposition extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCEPDispositionUnknown => -1

    /**
     * The request was successful.
     * @type {Integer (Int32)}
     */
    static SCEPDispositionSuccess => 0

    /**
     * The request failed.
     * @type {Integer (Int32)}
     */
    static SCEPDispositionFailure => 2

    /**
     * The request has not completed yet.
     * @type {Integer (Int32)}
     */
    static SCEPDispositionPending => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCEPDispositionPendingChallenge => 11
}
