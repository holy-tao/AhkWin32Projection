#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IExponentialEasingFunction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExponentialEasingFunction
     * @type {Guid}
     */
    static IID => Guid("{6f7d1a51-98d2-5638-a34a-00486554c750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mode", "get_Exponent"]

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * @type {Float} 
     */
    Exponent {
        get => this.get_Exponent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Exponent() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
