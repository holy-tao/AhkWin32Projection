#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of activation.
 * @remarks
 * Values are mutually exclusive and cannot be combined. Each one relates to a different type of activation, and an app instance can be activated in only one way at a time.
 * 
 * For more information about app activation, see the remarks on the [Application.OnActivated(IActivatedEventArgs)](../windows.ui.xaml/application_onactivated_603737819.md) page.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.activationkind
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ActivationKind extends Win32Enum{

    /**
     * The user launched the app or tapped a content tile.
     * @type {Integer (Int32)}
     */
    static Launch => 0

    /**
     * The user wants to search with the app.
     * @type {Integer (Int32)}
     */
    static Search => 1

    /**
     * The app is activated as a target for share operations.
     * @type {Integer (Int32)}
     */
    static ShareTarget => 2

    /**
     * An app launched a file whose file type this app is registered to handle.
     * @type {Integer (Int32)}
     */
    static File => 3

    /**
     * An app launched a URI whose scheme name this app is registered to handle.
     * @type {Integer (Int32)}
     */
    static Protocol => 4

    /**
     * The user wants to pick files that are provided by the app.
     * @type {Integer (Int32)}
     */
    static FileOpenPicker => 5

    /**
     * The user wants to save a file and selected the app as the location.
     * @type {Integer (Int32)}
     */
    static FileSavePicker => 6

    /**
     * The user wants to save a file that the app provides content management for.
     * @type {Integer (Int32)}
     */
    static CachedFileUpdater => 7

    /**
     * The user wants to pick contacts.
     * @type {Integer (Int32)}
     */
    static ContactPicker => 8

    /**
     * The app handles AutoPlay.
     * @type {Integer (Int32)}
     */
    static Device => 9

    /**
     * The app handles print tasks.
     * @type {Integer (Int32)}
     */
    static PrintTaskSettings => 10

    /**
     * The app captures photos or video from an attached camera.
     * @type {Integer (Int32)}
     */
    static CameraSettings => 11

    /**
     * Windows Store only. The user launched the restricted app.
     * @type {Integer (Int32)}
     */
    static RestrictedLaunch => 12

    /**
     * The user wants to manage appointments that are provided by the app.
     * @type {Integer (Int32)}
     */
    static AppointmentsProvider => 13

    /**
     * Windows Store only. The user wants to handle calls or messages for the phone number of a contact that is provided by the app.
     * @type {Integer (Int32)}
     */
    static Contact => 14

    /**
     * Windows Store only. The app launches a call from the lock screen. If the user wants to accept the call, the app displays its call UI directly on the lock screen without requiring the user to unlock. A lock-screen call is a special type of launch activation.
     * @type {Integer (Int32)}
     */
    static LockScreenCall => 15

    /**
     * The app was activated as the result of a voice command.
     * 
     * > [!NOTE]
     * > Not supported in Windows 8 and Windows 8.1 apps.
     * @type {Integer (Int32)}
     */
    static VoiceCommand => 16

    /**
     * The app was activated as the lock screen. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static LockScreen => 17

    /**
     * Windows Phone only. The app was activated after the completion of a picker.
     * @type {Integer (Int32)}
     */
    static PickerReturned => 1000

    /**
     * Windows Phone only. The app was activated to perform a Wallet operation.
     * @type {Integer (Int32)}
     */
    static WalletAction => 1001

    /**
     * Windows Phone only. The app was activated after the app was suspended for a file picker operation.
     * 
     * > [!NOTE]
     * > This value was deprecated in Windows 10, version 2004 (build 19041). The file/folder continuation APIs are no longer relevant with the discontinuation of Windows Phone.
     * @type {Integer (Int32)}
     */
    static PickFileContinuation => 1002

    /**
     * Windows Phone only. The app was activated after the app was suspended for a file save picker operation.
     * 
     * > [!NOTE]
     * > This value was deprecated in Windows 10, version 2004 (build 19041). The file/folder continuation APIs are no longer relevant with the discontinuation of Windows Phone.
     * @type {Integer (Int32)}
     */
    static PickSaveFileContinuation => 1003

    /**
     * Windows Phone only. The app was activated after the app was suspended for a folder picker operation.
     * 
     * > [!NOTE]
     * > This value was deprecated in Windows 10, version 2004 (build 19041). The file/folder continuation APIs are no longer relevant with the discontinuation of Windows Phone.
     * @type {Integer (Int32)}
     */
    static PickFolderContinuation => 1004

    /**
     * Windows Phone only. The app was activated after the app was suspended for a web authentication broker operation.
     * @type {Integer (Int32)}
     */
    static WebAuthenticationBrokerContinuation => 1005

    /**
     * The app was activated by a web account provider. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static WebAccountProvider => 1006

    /**
     * Reserved for system use. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static ComponentUI => 1007

    /**
     * The app was launched by another app with the expectation that it will return a result back to the caller. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static ProtocolForResults => 1009

    /**
     * The app was activated when a user tapped on the body of a toast notification or performed an action inside a toast notification. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static ToastNotification => 1010

    /**
     * This app was launched by another app to provide a customized printing experience for a 3D printer. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static Print3DWorkflow => 1011

    /**
     * This app was launched by another app on a different device by using the DIAL protocol. Introduced in Windows 10, version 1507 (10.0.10240).
     * @type {Integer (Int32)}
     */
    static DialReceiver => 1012

    /**
     * This app was activated as a result of pairing a device.
     * @type {Integer (Int32)}
     */
    static DevicePairing => 1013

    /**
     * The app was launched to handle the user interface for account management. In circumstances where the system would have shown the default system user interface, it instead has invoked your app with the UserDataAccountProvider contract. The activation payload contains information about the type of operation being requested and all the information necessary to replicate the system-provided user interface. This activation kind is limited to 1st party apps. To use this field, you must add the `userDataAccountsProvider` capability in your app's package manifest. For more info see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). Introduced in Windows 10, version 1607 (10.0.14393).
     * @type {Integer (Int32)}
     */
    static UserDataAccountsProvider => 1014

    /**
     * Reserved for system use. Introduced in Windows 10, version 1607 (10.0.14393).
     * @type {Integer (Int32)}
     */
    static FilePickerExperience => 1015

    /**
     * Reserved for system use. Introduced in Windows 10, version 1703 (10.0.15063).
     * @type {Integer (Int32)}
     */
    static LockScreenComponent => 1016

    /**
     * The app was launched from the **My People** UI. Note: introduced in Windows 10, version 1703 (10.0.15063), but not used. Now used starting with Windows 10, version 1709 (10.0.16299).
     * @type {Integer (Int32)}
     */
    static ContactPanel => 1017

    /**
     * The app was activated because the user is printing to a printer that has a Print Workflow Application associated with it which has requested user input.
     * @type {Integer (Int32)}
     */
    static PrintWorkflowForegroundTask => 1018

    /**
     * The app was activated because it was launched by the OS due to a request for game-specific UI. Introduced in Windows 10, version 1703 (10.0.15063).
     * @type {Integer (Int32)}
     */
    static GameUIProvider => 1019

    /**
     * The app was activated because the app is specified to launch at system startup or user log-in. Introduced in Windows 10, version 1703 (10.0.15063).
     * @type {Integer (Int32)}
     */
    static StartupTask => 1020

    /**
     * The app was launched from the command line. Introduced in Windows 10, version 1709 (10.0.16299)
     * @type {Integer (Int32)}
     */
    static CommandLineLaunch => 1021

    /**
     * The app was activated as a barcode scanner provider.
     * @type {Integer (Int32)}
     */
    static BarcodeScannerProvider => 1022

    /**
     * The app was activated as a print support settings UI extension. For more information, see For more information, see [PrintWorkflowJobUISession](../windows.graphics.printing.workflow/printworkflowjobuisession.md).
     * @type {Integer (Int32)}
     */
    static PrintSupportJobUI => 1023

    /**
     * The app was activated as a print workflow job UI extension. For more information, see [PrintSupportSettingsUISession](../windows.graphics.printing.printsupport/printsupportsettingsuisession.md).
     * @type {Integer (Int32)}
     */
    static PrintSupportSettingsUI => 1024

    /**
     * The app was activated in response to a phone call.
     * @type {Integer (Int32)}
     */
    static PhoneCallActivation => 1025

    /**
     * The app is a VPN foreground app that was activated by the plugin. For more details, see [VpnChannel.ActivateForeground](../windows.networking.vpn/ivpnplugin_encapsulate_494498240.md).
     * @type {Integer (Int32)}
     */
    static VpnForeground => 1026

    /**
     * The app is a print support app that was activated by the Print Management Console.
     * @type {Integer (Int32)}
     */
    static PrintSupportEnterpriseManagementUI => 1027
}
