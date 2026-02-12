#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the result of a web account enumeration operation (see the **[FindAllAccountsAsync](webauthenticationcoremanager_findallaccountsasync_1139996617.md)** method).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.findallwebaccountsstatus
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class FindAllWebAccountsStatus extends Win32Enum{

    /**
     * The enumeration was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * This application is not authenticated to enumerating the list of accounts. Developers must whitelist their apps with the identity provider before they can try to enumerate accounts
     * @type {Integer (Int32)}
     */
    static NotAllowedByProvider => 1

    /**
     * The identity provider does not support the account enumeration. For now only inbox providers like MSA and AAD support this operation
     * @type {Integer (Int32)}
     */
    static NotSupportedByProvider => 2

    /**
     * There was an error with the identity provider. Get the **[ProviderError](findallaccountsresult_providererror.md)** property of the **[FindAllAccountsResult](findallaccountsresult.md)** object for more information.
     * @type {Integer (Int32)}
     */
    static ProviderError => 3
}
