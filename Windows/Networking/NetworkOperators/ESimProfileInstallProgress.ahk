#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the result of an asynchronous (with progress) operation to download and install an eSIM profile.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofileinstallprogress
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfileInstallProgress extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total size of the eSIM profile in whole bytes.
     * @type {Integer}
     */
    TotalSizeInBytes {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The installed size of the eSIM profile in whole bytes.
     * @type {Integer}
     */
    InstalledSizeInBytes {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
