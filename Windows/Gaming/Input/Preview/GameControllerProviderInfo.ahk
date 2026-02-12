#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameControllerProviderInfoStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides info on a physical game controller connected to the system using GIP.SYS.
  * 
  * > [!IMPORTANT]
  * > Access to this class requires declaring the xboxAccessoryManagement capability
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerproviderinfo
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GameControllerProviderInfo extends IInspectable {
;@region Static Methods
    /**
     * Retrieves the persistent ID of the parent device of a physical game controller connected to the system using GIP.SYS.
     * 
     * > [!IMPORTANT]
     * > Access to this API requires declaring the xboxAccessoryManagement capability
     * @param {IGameControllerProvider} provider A physical game controller device connected to the system.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerproviderinfo.getparentproviderid
     */
    static GetParentProviderId(provider) {
        if (!GameControllerProviderInfo.HasProp("__IGameControllerProviderInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.GameControllerProviderInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameControllerProviderInfoStatics.IID)
            GameControllerProviderInfo.__IGameControllerProviderInfoStatics := IGameControllerProviderInfoStatics(factoryPtr)
        }

        return GameControllerProviderInfo.__IGameControllerProviderInfoStatics.GetParentProviderId(provider)
    }

    /**
     * Retrieves the persistent ID of a physical game controller connected to the system using GIP.SYS.
     * 
     * > [!IMPORTANT]
     * > Access to this class requires declaring the xboxAccessoryManagement capability
     * @param {IGameControllerProvider} provider A physical game controller device connected to the system.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerproviderinfo.getproviderid
     */
    static GetProviderId(provider) {
        if (!GameControllerProviderInfo.HasProp("__IGameControllerProviderInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.GameControllerProviderInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameControllerProviderInfoStatics.IID)
            GameControllerProviderInfo.__IGameControllerProviderInfoStatics := IGameControllerProviderInfoStatics(factoryPtr)
        }

        return GameControllerProviderInfo.__IGameControllerProviderInfoStatics.GetProviderId(provider)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
