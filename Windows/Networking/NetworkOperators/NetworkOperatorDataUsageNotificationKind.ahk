#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the kind of data usage change that activated a [NetworkOperatorDataUsageTrigger](../windows.applicationmodel.background/networkoperatordatausagetrigger.md).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic, and [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatordatausagenotificationkind
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorDataUsageNotificationKind extends Win32Enum{

    /**
     * Indicates that actionable progress in data usage has occurred.
     * @type {Integer (Int32)}
     */
    static DataUsageProgress => 0
}
