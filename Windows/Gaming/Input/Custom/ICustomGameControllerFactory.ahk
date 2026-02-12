#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a factory for creating a custom controller type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.icustomgamecontrollerfactory
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class ICustomGameControllerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomGameControllerFactory
     * @type {Guid}
     */
    static IID => Guid("{69a0ae5e-758e-4cbe-ace6-62155fe9126f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGameController", "OnGameControllerAdded", "OnGameControllerRemoved"]

    /**
     * Creates an instance of a game controller.
     * @param {IGameControllerProvider} provider The controller provider for the controller.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.icustomgamecontrollerfactory.creategamecontroller
     */
    CreateGameController(provider) {
        result := ComCall(6, this, "ptr", provider, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * Event raised when the controller is added.
     * @param {IGameController} value The added controller.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.icustomgamecontrollerfactory.ongamecontrolleradded
     */
    OnGameControllerAdded(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Event raised when the controller is removed.
     * @param {IGameController} value The removed controller.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.icustomgamecontrollerfactory.ongamecontrollerremoved
     */
    OnGameControllerRemoved(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
