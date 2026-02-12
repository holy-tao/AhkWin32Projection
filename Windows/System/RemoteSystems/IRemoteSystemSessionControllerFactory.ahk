#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RemoteSystemSessionController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionControllerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionControllerFactory
     * @type {Guid}
     */
    static IID => Guid("{bfcc2f6b-ac3d-4199-82cd-6670a773ef2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateController", "CreateControllerWithSessionOptions"]

    /**
     * 
     * @param {HSTRING} displayName 
     * @returns {RemoteSystemSessionController} 
     */
    CreateController(displayName) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(6, this, "ptr", displayName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionController(value)
    }

    /**
     * 
     * @param {HSTRING} displayName 
     * @param {RemoteSystemSessionOptions} options 
     * @returns {RemoteSystemSessionController} 
     */
    CreateControllerWithSessionOptions(displayName, options) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(7, this, "ptr", displayName, "ptr", options, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionController(value)
    }
}
