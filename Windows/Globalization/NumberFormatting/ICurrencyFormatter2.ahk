#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class ICurrencyFormatter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrencyFormatter2
     * @type {Guid}
     */
    static IID => Guid("{072c2f1d-e7ba-4197-920e-247c92f7dea6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mode", "put_Mode", "ApplyRoundingForCurrency"]

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} roundingAlgorithm_ 
     * @returns {HRESULT} 
     */
    ApplyRoundingForCurrency(roundingAlgorithm_) {
        result := ComCall(8, this, "int", roundingAlgorithm_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
