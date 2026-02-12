#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify under what conditions the user should be challenged for eSIM authentication credentials.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimauthenticationpreference
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimAuthenticationPreference extends Win32Enum{

    /**
     * Indicates that credentials should be requested when the eSIM is entered.
     * @type {Integer (Int32)}
     */
    static OnEntry => 0

    /**
     * Indicates that credentials should be requested when the eSIM is involved in an action.
     * @type {Integer (Int32)}
     */
    static OnAction => 1

    /**
     * Indicates that credentials should never be requested.
     * @type {Integer (Int32)}
     */
    static Never => 2
}
