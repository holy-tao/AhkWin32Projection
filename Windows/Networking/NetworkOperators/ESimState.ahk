#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of an eSIM, including its presence and working status.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimstate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimState extends Win32Enum{

    /**
     * Indicates that the state of the eSIM is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Indicates that the eSIM is idle.
     * @type {Integer (Int32)}
     */
    static Idle => 1

    /**
     * Indicates that the eSIM has been removed.
     * @type {Integer (Int32)}
     */
    static Removed => 2

    /**
     * Indicates that the eSIM is busy.
     * @type {Integer (Int32)}
     */
    static Busy => 3
}
