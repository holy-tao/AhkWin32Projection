#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the USSD response codes for messages sent to the network.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdresultcode
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UssdResultCode extends Win32Enum{

    /**
     * The USSD message that was received is either a USSD notification from the network or a response to an earlier request. No further information is necessary. The USSD session is closed.
     * @type {Integer (Int32)}
     */
    static NoActionRequired => 0

    /**
     * The USSD message that was received is either a USSD request from the network or a response to a message sent to the network. Additional information is needed. The USSD session is open.
     * @type {Integer (Int32)}
     */
    static ActionRequired => 1

    /**
     * The USSD session has been terminated by the network or a local client.
     * @type {Integer (Int32)}
     */
    static Terminated => 2

    /**
     * The previous USSD request failed because another local client has an active USSD session.
     * @type {Integer (Int32)}
     */
    static OtherLocalClient => 3

    /**
     * The previous USSD request failed because the request was invalid or cannot be handled by the driver, device, or network.
     * @type {Integer (Int32)}
     */
    static OperationNotSupported => 4

    /**
     * The USSD session has been closed because there was no response from the network.
     * @type {Integer (Int32)}
     */
    static NetworkTimeout => 5
}
