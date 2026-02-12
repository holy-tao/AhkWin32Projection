#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * An enumeration that specifies the result of a web account provisioning operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountstatus
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationAddAccountStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation failed.
     * @type {Integer (Int32)}
     */
    static Error => 1

    /**
     * The operation is not supported by the provider.
     * @type {Integer (Int32)}
     */
    static NotSupportedByProvider => 2

    /**
     * The operation failed due to a service connection error.
     * @type {Integer (Int32)}
     */
    static ServiceConnectionError => 3

    /**
     * The operation failed due to a provider error.
     * @type {Integer (Int32)}
     */
    static ProviderError => 4
}
