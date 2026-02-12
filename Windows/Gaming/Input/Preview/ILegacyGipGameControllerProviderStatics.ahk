#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\LegacyGipGameControllerProvider.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class ILegacyGipGameControllerProviderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILegacyGipGameControllerProviderStatics
     * @type {Guid}
     */
    static IID => Guid("{d40dda17-b1f4-499a-874c-7095aac15291}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromGameController", "FromGameControllerProvider", "PairPilotToCopilot", "ClearPairing", "IsPilot", "IsCopilot"]

    /**
     * 
     * @param {IGameController} controller 
     * @returns {LegacyGipGameControllerProvider} 
     */
    FromGameController(controller) {
        result := ComCall(6, this, "ptr", controller, "ptr*", &legacyGipGameControllerProvider_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LegacyGipGameControllerProvider(legacyGipGameControllerProvider_)
    }

    /**
     * 
     * @param {IGameControllerProvider} provider 
     * @returns {LegacyGipGameControllerProvider} 
     */
    FromGameControllerProvider(provider) {
        result := ComCall(7, this, "ptr", provider, "ptr*", &legacyGipGameControllerProvider_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LegacyGipGameControllerProvider(legacyGipGameControllerProvider_)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} pilotControllerProviderId 
     * @param {HSTRING} copilotControllerProviderId 
     * @returns {HRESULT} 
     */
    PairPilotToCopilot(user_, pilotControllerProviderId, copilotControllerProviderId) {
        if(pilotControllerProviderId is String) {
            pin := HSTRING.Create(pilotControllerProviderId)
            pilotControllerProviderId := pin.Value
        }
        pilotControllerProviderId := pilotControllerProviderId is Win32Handle ? NumGet(pilotControllerProviderId, "ptr") : pilotControllerProviderId
        if(copilotControllerProviderId is String) {
            pin := HSTRING.Create(copilotControllerProviderId)
            copilotControllerProviderId := pin.Value
        }
        copilotControllerProviderId := copilotControllerProviderId is Win32Handle ? NumGet(copilotControllerProviderId, "ptr") : copilotControllerProviderId

        result := ComCall(8, this, "ptr", user_, "ptr", pilotControllerProviderId, "ptr", copilotControllerProviderId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} controllerProviderId 
     * @returns {HRESULT} 
     */
    ClearPairing(user_, controllerProviderId) {
        if(controllerProviderId is String) {
            pin := HSTRING.Create(controllerProviderId)
            controllerProviderId := pin.Value
        }
        controllerProviderId := controllerProviderId is Win32Handle ? NumGet(controllerProviderId, "ptr") : controllerProviderId

        result := ComCall(9, this, "ptr", user_, "ptr", controllerProviderId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} controllerProviderId 
     * @returns {HSTRING} 
     */
    IsPilot(user_, controllerProviderId) {
        if(controllerProviderId is String) {
            pin := HSTRING.Create(controllerProviderId)
            controllerProviderId := pin.Value
        }
        controllerProviderId := controllerProviderId is Win32Handle ? NumGet(controllerProviderId, "ptr") : controllerProviderId

        copilotControllerProviderId := HSTRING()
        result := ComCall(10, this, "ptr", user_, "ptr", controllerProviderId, "ptr", copilotControllerProviderId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return copilotControllerProviderId
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} controllerProviderId 
     * @returns {HSTRING} 
     */
    IsCopilot(user_, controllerProviderId) {
        if(controllerProviderId is String) {
            pin := HSTRING.Create(controllerProviderId)
            controllerProviderId := pin.Value
        }
        controllerProviderId := controllerProviderId is Win32Handle ? NumGet(controllerProviderId, "ptr") : controllerProviderId

        pilotControllerProviderId := HSTRING()
        result := ComCall(11, this, "ptr", user_, "ptr", controllerProviderId, "ptr", pilotControllerProviderId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pilotControllerProviderId
    }
}
