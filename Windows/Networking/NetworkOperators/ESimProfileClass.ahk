#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify an eSIM profile class.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofileclass
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfileClass extends Win32Enum{

    /**
     * Indicates the class of an operational eSIM profile.
     * @type {Integer (Int32)}
     */
    static Operational => 0

    /**
     * Indicates the class of a test eSIM profile.
     * @type {Integer (Int32)}
     */
    static Test => 1

    /**
     * Indicates the class of a provisioning eSIM profile.
     * @type {Integer (Int32)}
     */
    static Provisioning => 2
}
