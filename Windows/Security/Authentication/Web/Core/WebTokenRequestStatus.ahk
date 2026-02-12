#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the status of a web token request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequeststatus
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebTokenRequestStatus extends Win32Enum{

    /**
     * The request was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The request was cancelled by the user.
     * @type {Integer (Int32)}
     */
    static UserCancel => 1

    /**
     * The account associated with the request has switched. This status occurs when you attempt to use one web account, but the user indicates they wish to use a different web account instead.
     * @type {Integer (Int32)}
     */
    static AccountSwitch => 2

    /**
     * User interaction is required to complete the request. This option is only applicable to requests made with [GetTokenSilentlyAsync](webauthenticationcoremanager_gettokensilentlyasync_1117329698.md). If this status is returned, repeat the request with [RequestTokenAsync](webauthenticationcoremanager_requesttokenasync_1777535178.md).
     * @type {Integer (Int32)}
     */
    static UserInteractionRequired => 3

    /**
     * The account provider was not available.
     * @type {Integer (Int32)}
     */
    static AccountProviderNotAvailable => 4

    /**
     * There was a provider error. For information on how to handle this error, consult the provider's documentation.
     * @type {Integer (Int32)}
     */
    static ProviderError => 5
}
