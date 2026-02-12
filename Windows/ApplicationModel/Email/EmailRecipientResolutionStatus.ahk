#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the state of an attempt to resolve an email recipient.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipientresolutionstatus
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailRecipientResolutionStatus extends Win32Enum{

    /**
     * Success. Email recipient resolved.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Resolution failed. Recipient cannot be resolved because no match found in distribution list.
     * @type {Integer (Int32)}
     */
    static RecipientNotFound => 1

    /**
     * Resolution failed. Multiple results returned. Refinement needed.
     * @type {Integer (Int32)}
     */
    static AmbiguousRecipient => 2

    /**
     * Resolution failed. No valid certificate present.
     * @type {Integer (Int32)}
     */
    static NoCertificate => 3

    /**
     * Resolution failed. The limit of allowed requests for the current certificate has been reached.
     * @type {Integer (Int32)}
     */
    static CertificateRequestLimitReached => 4

    /**
     * Resolution failed. The distribution list cannot be accessed.
     * @type {Integer (Int32)}
     */
    static CannotResolveDistributionList => 5

    /**
     * Resolution failed. There has been an error on the server.
     * @type {Integer (Int32)}
     */
    static ServerError => 6

    /**
     * Resolution failed for unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 7
}
