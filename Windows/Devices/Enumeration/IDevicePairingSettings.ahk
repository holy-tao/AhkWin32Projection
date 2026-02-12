#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Identifies a collection of settings for device pairing. [WiFiDirectConnectionParameters](/uwp/api/windows.devices.wifidirect.wifidirectconnectionparameters) implements **IDevicePairingSettings**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.idevicepairingsettings
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePairingSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePairingSettings
     * @type {Guid}
     */
    static IID => Guid("{482cb27c-83bb-420e-be51-6602b222de54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
