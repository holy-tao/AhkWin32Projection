#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes network types for provisioned network connectivity profiles.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.profilemediatype
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ProfileMediaType extends Win32Enum{

    /**
     * The profile is for a wireless local area network (WLAN).
     * @type {Integer (Int32)}
     */
    static Wlan => 0

    /**
     * The profile is for a wireless wide area network (WWAN).
     * @type {Integer (Int32)}
     */
    static Wwan => 1
}
