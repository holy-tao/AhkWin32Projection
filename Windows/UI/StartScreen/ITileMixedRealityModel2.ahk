#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ITileMixedRealityModel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileMixedRealityModel2
     * @type {Guid}
     */
    static IID => Guid("{439470b2-d7c5-410b-8319-9486a27b6c67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ActivationBehavior", "get_ActivationBehavior"]

    /**
     * @type {Integer} 
     */
    ActivationBehavior {
        get => this.get_ActivationBehavior()
        set => this.put_ActivationBehavior(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ActivationBehavior(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationBehavior() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
