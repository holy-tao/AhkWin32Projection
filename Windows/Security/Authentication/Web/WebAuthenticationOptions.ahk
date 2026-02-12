#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the options available to the asynchronous operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationoptions
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationOptions extends Win32BitflagEnum{

    /**
     * No options are requested.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Tells the web authentication broker to not render any UI. This option will throw an exception if used with [AuthenticateAndContinue](webauthenticationbroker_authenticateandcontinue_1571442307.md); [AuthenticateSilentlyAsync](webauthenticationbroker_authenticatesilentlyasync_444210422.md), which includes this option implicitly, should be used instead.
     * @type {Integer (UInt32)}
     */
    static SilentMode => 1

    /**
     * Tells the web authentication broker to return the window title string of the webpage in the [ResponseData](webauthenticationresult_responsedata.md) property.
     * @type {Integer (UInt32)}
     */
    static UseTitle => 2

    /**
     * Tells the web authentication broker to return the body of the HTTP POST in the [ResponseData](webauthenticationresult_responsedata.md) property. For use with single sign-on (SSO) only.
     * @type {Integer (UInt32)}
     */
    static UseHttpPost => 4

    /**
     * Tells the web authentication broker to render the webpage in an app container that supports privateNetworkClientServer, enterpriseAuthentication, and sharedUserCertificate capabilities. Note the application that uses this flag must have these capabilities as well.
     * @type {Integer (UInt32)}
     */
    static UseCorporateNetwork => 8
}
