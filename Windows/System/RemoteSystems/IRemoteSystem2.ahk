#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystem2
     * @type {Guid}
     */
    static IID => Guid("{09dfe4ec-fb8b-4a08-a758-6876435d769e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAvailableBySpatialProximity", "GetCapabilitySupportedAsync"]

    /**
     * @type {Boolean} 
     */
    IsAvailableBySpatialProximity {
        get => this.get_IsAvailableBySpatialProximity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailableBySpatialProximity() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} capabilityName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetCapabilitySupportedAsync(capabilityName) {
        if(capabilityName is String) {
            pin := HSTRING.Create(capabilityName)
            capabilityName := pin.Value
        }
        capabilityName := capabilityName is Win32Handle ? NumGet(capabilityName, "ptr") : capabilityName

        result := ComCall(7, this, "ptr", capabilityName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
