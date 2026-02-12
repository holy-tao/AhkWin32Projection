#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\DisplayTarget.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayMuxDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayMuxDevice
     * @type {Guid}
     */
    static IID => Guid("{d81c4925-83dd-52c9-ab4e-e0833fc75068}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_IsActive", "GetAvailableMuxTargets", "get_CurrentTarget", "get_PreferredTarget", "get_IsAutomaticTargetSwitchingEnabled", "SetPreferredTarget", "SetAutomaticTargetSwitching", "add_Changed", "remove_Changed"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {DisplayTarget} 
     */
    CurrentTarget {
        get => this.get_CurrentTarget()
    }

    /**
     * @type {DisplayTarget} 
     */
    PreferredTarget {
        get => this.get_PreferredTarget()
    }

    /**
     * @type {Boolean} 
     */
    IsAutomaticTargetSwitchingEnabled {
        get => this.get_IsAutomaticTargetSwitchingEnabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<DisplayTarget>} 
     */
    GetAvailableMuxTargets() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayTarget, result_)
    }

    /**
     * 
     * @returns {DisplayTarget} 
     */
    get_CurrentTarget() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayTarget(value)
    }

    /**
     * 
     * @returns {DisplayTarget} 
     */
    get_PreferredTarget() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayTarget(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutomaticTargetSwitchingEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {IAsyncAction} 
     */
    SetPreferredTarget(target) {
        result := ComCall(12, this, "ptr", target, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SetAutomaticTargetSwitching() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayMuxDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_Changed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
