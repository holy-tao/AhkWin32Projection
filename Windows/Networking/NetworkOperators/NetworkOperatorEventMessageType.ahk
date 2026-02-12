#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the type of a network operator notification message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatoreventmessagetype
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorEventMessageType extends Win32Enum{

    /**
     * The message type is GSM.
     * @type {Integer (Int32)}
     */
    static Gsm => 0

    /**
     * The message type is CDMA.
     * @type {Integer (Int32)}
     */
    static Cdma => 1

    /**
     * The message type is USSD.
     * @type {Integer (Int32)}
     */
    static Ussd => 2

    /**
     * Data plan data threshold has been reached.
     * @type {Integer (Int32)}
     */
    static DataPlanThresholdReached => 3

    /**
     * Data plan has been reset.
     * @type {Integer (Int32)}
     */
    static DataPlanReset => 4

    /**
     * Data plan has been deleted.
     * @type {Integer (Int32)}
     */
    static DataPlanDeleted => 5

    /**
     * Profile connected to mobile operator.
     * @type {Integer (Int32)}
     */
    static ProfileConnected => 6

    /**
     * Profile disconnected from mobile operator.
     * @type {Integer (Int32)}
     */
    static ProfileDisconnected => 7

    /**
     * Mobile broadband device registered as roaming.
     * @type {Integer (Int32)}
     */
    static RegisteredRoaming => 8

    /**
     * Mobile broadband device registered as home.
     * @type {Integer (Int32)}
     */
    static RegisteredHome => 9

    /**
     * Mobile broadband device can be used for tethering.
     * @type {Integer (Int32)}
     */
    static TetheringEntitlementCheck => 10

    /**
     * Operational state of the device's tethering capability has changed.
     * @type {Integer (Int32)}
     */
    static TetheringOperationalStateChanged => 11

    /**
     * Number of clients currently using the tethering network has changed.
     * @type {Integer (Int32)}
     */
    static TetheringNumberOfClientsChanged => 12
}
