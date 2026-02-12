#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameControllerFactoryManagerStatics2.ahk
#Include .\IGameControllerFactoryManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages factories for custom controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gamecontrollerfactorymanager
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GameControllerFactoryManager extends IInspectable {
;@region Static Methods
    /**
     * Tries to get a game controller that belongs to the specified factory and references the same underlying game controller as the one that was specified.
     * @remarks
     * This method provides the implementation for each game controller class's **FromGameController** method. A class's **FromGameController** method allows you to pass in an instance of one game controller class, and get an object from another game controller class that references the same underlying device. For example, if you have an [ArcadeStick](../windows.gaming.input/arcadestick.md) and you want to get a [RawGameController](../windows.gaming.input/rawgamecontroller.md) representation of that same underlying controller, you would call [RawGameController.FromGameController](../windows.gaming.input/rawgamecontroller_fromgamecontroller_421915006.md), passing in the **ArcadeStick** (which you can do, since the method takes an [IGameController](../windows.gaming.input/igamecontroller.md) object, and **ArcadeStick** inherits from **IGameController**). Your custom game controller classes must also inherit from **IGameController**.
     * 
     * Since each game controller class implements [ICustomGameControllerFactory](icustomgamecontrollerfactory.md) (including your own custom classes), you can pass the factory for the game controller class that you want into **GameControllerFactoryManager.TryGetFactoryControllerFromGameController**, and then the **GameControllerFactoryManager** can try to return an object of that class that references the same underlying device as the game controller that you specified.
     * @param {ICustomGameControllerFactory} factory The factory for the type of game controller that you want to get.
     * @param {IGameController} gameController The game controller that references the underlying device for which you want to get another game controller representation.
     * @returns {IGameController} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gamecontrollerfactorymanager.trygetfactorycontrollerfromgamecontroller
     */
    static TryGetFactoryControllerFromGameController(factory, gameController) {
        if (!GameControllerFactoryManager.HasProp("__IGameControllerFactoryManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Custom.GameControllerFactoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameControllerFactoryManagerStatics2.IID)
            GameControllerFactoryManager.__IGameControllerFactoryManagerStatics2 := IGameControllerFactoryManagerStatics2(factoryPtr)
        }

        return GameControllerFactoryManager.__IGameControllerFactoryManagerStatics2.TryGetFactoryControllerFromGameController(factory, gameController)
    }

    /**
     * Registers a factory for a custom Gip controller.
     * @param {ICustomGameControllerFactory} factory The factory to register.
     * @param {Guid} interfaceId The interface ID of the factory.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gamecontrollerfactorymanager.registercustomfactoryforgipinterface
     */
    static RegisterCustomFactoryForGipInterface(factory, interfaceId) {
        if (!GameControllerFactoryManager.HasProp("__IGameControllerFactoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Custom.GameControllerFactoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameControllerFactoryManagerStatics.IID)
            GameControllerFactoryManager.__IGameControllerFactoryManagerStatics := IGameControllerFactoryManagerStatics(factoryPtr)
        }

        return GameControllerFactoryManager.__IGameControllerFactoryManagerStatics.RegisterCustomFactoryForGipInterface(factory, interfaceId)
    }

    /**
     * Registers a factory for a custom hardware ID controller.
     * @param {ICustomGameControllerFactory} factory The factory to register.
     * @param {Integer} hardwareVendorId The hardware vendor ID.
     * @param {Integer} hardwareProductId The hardware product ID.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gamecontrollerfactorymanager.registercustomfactoryforhardwareid
     */
    static RegisterCustomFactoryForHardwareId(factory, hardwareVendorId, hardwareProductId) {
        if (!GameControllerFactoryManager.HasProp("__IGameControllerFactoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Custom.GameControllerFactoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameControllerFactoryManagerStatics.IID)
            GameControllerFactoryManager.__IGameControllerFactoryManagerStatics := IGameControllerFactoryManagerStatics(factoryPtr)
        }

        return GameControllerFactoryManager.__IGameControllerFactoryManagerStatics.RegisterCustomFactoryForHardwareId(factory, hardwareVendorId, hardwareProductId)
    }

    /**
     * Registers a factory for a Xusb type controller.
     * @param {ICustomGameControllerFactory} factory The factory to register.
     * @param {Integer} xusbType The Xusb device type.
     * @param {Integer} xusbSubtype The Xusb device subtype.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gamecontrollerfactorymanager.registercustomfactoryforxusbtype
     */
    static RegisterCustomFactoryForXusbType(factory, xusbType, xusbSubtype) {
        if (!GameControllerFactoryManager.HasProp("__IGameControllerFactoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Custom.GameControllerFactoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameControllerFactoryManagerStatics.IID)
            GameControllerFactoryManager.__IGameControllerFactoryManagerStatics := IGameControllerFactoryManagerStatics(factoryPtr)
        }

        return GameControllerFactoryManager.__IGameControllerFactoryManagerStatics.RegisterCustomFactoryForXusbType(factory, xusbType, xusbSubtype)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
