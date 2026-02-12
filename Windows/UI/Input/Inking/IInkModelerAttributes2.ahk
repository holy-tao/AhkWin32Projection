#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkModelerAttributes2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkModelerAttributes2
     * @type {Guid}
     */
    static IID => Guid("{86d1d09a-4ef8-5e25-b7bc-b65424f16bb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseVelocityBasedPressure", "put_UseVelocityBasedPressure"]

    /**
     * @type {Boolean} 
     */
    UseVelocityBasedPressure {
        get => this.get_UseVelocityBasedPressure()
        set => this.put_UseVelocityBasedPressure(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseVelocityBasedPressure() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseVelocityBasedPressure(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
