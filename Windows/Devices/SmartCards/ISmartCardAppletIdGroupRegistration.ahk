#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCardAppletIdGroup.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardAppletIdGroupRegistration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardAppletIdGroupRegistration
     * @type {Guid}
     */
    static IID => Guid("{df1208d1-31bb-5596-43b1-6d69a0257b3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActivationPolicy", "get_AppletIdGroup", "RequestActivationPolicyChangeAsync", "get_Id", "SetAutomaticResponseApdusAsync"]

    /**
     * @type {Integer} 
     */
    ActivationPolicy {
        get => this.get_ActivationPolicy()
    }

    /**
     * @type {SmartCardAppletIdGroup} 
     */
    AppletIdGroup {
        get => this.get_AppletIdGroup()
    }

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationPolicy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SmartCardAppletIdGroup} 
     */
    get_AppletIdGroup() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardAppletIdGroup(value)
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestActivationPolicyChangeAsync(policy) {
        result := ComCall(8, this, "int", policy, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<SmartCardAutomaticResponseApdu>} apdus 
     * @returns {IAsyncAction} 
     */
    SetAutomaticResponseApdusAsync(apdus) {
        result := ComCall(10, this, "ptr", apdus, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
