#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation.Provider
 * @version WindowsRuntime 1.4
 */
class IGeolocationProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeolocationProvider
     * @type {Guid}
     */
    static IID => Guid("{e4cf071d-3f64-509f-8dc2-0b74a059829d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsOverridden", "SetOverridePosition", "ClearOverridePosition", "add_IsOverriddenChanged", "remove_IsOverriddenChanged"]

    /**
     * @type {Boolean} 
     */
    IsOverridden {
        get => this.get_IsOverridden()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverridden() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BasicGeoposition} newPosition 
     * @param {Integer} positionSource_ 
     * @param {Float} accuracyInMeters 
     * @returns {Integer} 
     */
    SetOverridePosition(newPosition, positionSource_, accuracyInMeters) {
        result := ComCall(7, this, "ptr", newPosition, "int", positionSource_, "double", accuracyInMeters, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearOverridePosition() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsOverriddenChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsOverriddenChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
