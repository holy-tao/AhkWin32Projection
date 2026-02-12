#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the asynchronous start options. This enumeration is a bitwise OR and is used by the [StartAsync](ndclient_startasync_1466387351.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstartasyncoptions
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDStartAsyncOptions extends Win32Enum{

    /**
     * If set, the transmitter's certificate will be presented to the caller through a [RegistrationCompleted](ndclient_registrationcompleted.md) event for verification. The caller should set a flag to accept or reject it. If not set, **RegistrationCompleted** will not contain the certificate.
     * @type {Integer (Int32)}
     */
    static MutualAuthentication => 1

    /**
     * If set and the *LicenseFetchDescriptor* parameter is **null** for [StartAsync](ndclient_startasync_1466387351.md), then **StartAsync** will wait for **OnContentIDReceived** from either [NDDownloadEngineNotifier](nddownloadenginenotifier.md) or [NDStreamParserNotifier](ndstreamparsernotifier.md). After **OnContententIDReceived**, the received *LicenseFetchDescriptor* is used to perform the license fetch. If not set and the *LicenseFetchDescriptor* parameter is **null** for **StartAsync**, then **StartAsync** assumes you already acquired the license beforehand and will not do a license fetch. Note that if *LicenseFetchDescriptor* is not **null**, this flag is ignored and a license fetch will be performed.
     * @type {Integer (Int32)}
     */
    static WaitForLicenseDescriptor => 2
}
