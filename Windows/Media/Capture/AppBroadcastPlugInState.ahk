#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the current state of the broadcast background task.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginstate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPlugInState extends Win32Enum{

    /**
     * The current state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The broadcast background task is initialized.
     * @type {Integer (Int32)}
     */
    static Initialized => 1

    /**
     * The current user needs to be authenticated with the Microsoft service.
     * @type {Integer (Int32)}
     */
    static MicrosoftSignInRequired => 2

    /**
     * The current user needs to be authenticated with the broadcast provider service.
     * @type {Integer (Int32)}
     */
    static OAuthSignInRequired => 3

    /**
     * The broadcast background task needs to authenticate the current user with the broadcast provider service.
     * @type {Integer (Int32)}
     */
    static ProviderSignInRequired => 4

    /**
     * The broadcast background task is in the process of testing the bandwidth of the device's connection to the broadcasting service provider. Once this test is complete, the system will set the [AppBroadcastBackgroundServiceStreamInfo.BandwidthTestBitrate](appbroadcastbackgroundservicestreaminfo_bandwidthtestbitrate.md) property to indicate the result of the bandwidth test.
     * @type {Integer (Int32)}
     */
    static InBandwidthTest => 5

    /**
     * The broadcast background task is ready to broadcast.
     * @type {Integer (Int32)}
     */
    static ReadyToBroadcast => 6
}
