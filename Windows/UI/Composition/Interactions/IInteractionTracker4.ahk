#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTracker4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTracker4
     * @type {Guid}
     */
    static IID => Guid("{ebd222bc-04af-4ac7-847d-06ea36e80a16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryUpdatePositionWithOption", "TryUpdatePositionByWithOption", "get_IsInertiaFromImpulse"]

    /**
     * @type {Boolean} 
     */
    IsInertiaFromImpulse {
        get => this.get_IsInertiaFromImpulse()
    }

    /**
     * 
     * @param {Vector3} value 
     * @param {Integer} option 
     * @returns {Integer} 
     */
    TryUpdatePositionWithOption(value, option) {
        result := ComCall(6, this, "ptr", value, "int", option, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Vector3} amount 
     * @param {Integer} option 
     * @returns {Integer} 
     */
    TryUpdatePositionByWithOption(amount, option) {
        result := ComCall(7, this, "ptr", amount, "int", option, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertiaFromImpulse() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
