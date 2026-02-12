#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes radio states for a Mobile Broadband device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandradiostate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandRadioState extends Win32Enum{

    /**
     * The radio is off. This can be because it has been turned off using a physical switch on the device, or using a software mechanism such as **Airplane Mode** on the control panel.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The radio is on.
     * @type {Integer (Int32)}
     */
    static On => 1
}
