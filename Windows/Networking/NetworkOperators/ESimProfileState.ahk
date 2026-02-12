#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of an eSIM profile, including its presence and enabled status.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilestate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfileState extends Win32Enum{

    /**
     * Indicates that the state of the eSIM profile is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Indicates that the eSIM profile is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 1

    /**
     * Indicates that the eSIM profile is enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 2

    /**
     * Indicates that the eSIM profile has been deleted.
     * @type {Integer (Int32)}
     */
    static Deleted => 3
}
