#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the kind of the result object from an eSIM profile discovery operation.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverresultkind
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimDiscoverResultKind extends Win32Enum{

    /**
     * Indicates that the result object contains neither events nor a profile.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates that the result object contains events.
     * @type {Integer (Int32)}
     */
    static Events => 1

    /**
     * Indicates that the result object contains a profile.
     * @type {Integer (Int32)}
     */
    static ProfileMetadata => 2
}
