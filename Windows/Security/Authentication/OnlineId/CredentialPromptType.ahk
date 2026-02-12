#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the ability to control when to show or hide the credential prompt user interface. This includes the user interface for the app to collect user consent to access data stored in Live. The user must see the user interface in order for the app to obtain any user data, if not app will see an error when they try to obtain user data.
  * 
  * > [!NOTE]
  * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.credentialprompttype
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class CredentialPromptType extends Win32Enum{

    /**
     * Show the UI only if an error occurred.
     * @type {Integer (Int32)}
     */
    static PromptIfNeeded => 0

    /**
     * Always show the UI. If a default username exists, the username is automatically inserted into the appropriate field.
     * @type {Integer (Int32)}
     */
    static RetypeCredentials => 1

    /**
     * Never show the UI, even if an error occurs.
     * @type {Integer (Int32)}
     */
    static DoNotPrompt => 2
}
