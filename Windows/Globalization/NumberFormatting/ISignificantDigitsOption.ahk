#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that gets and sets the option for specifying significant digits.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.isignificantdigitsoption
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class ISignificantDigitsOption extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISignificantDigitsOption
     * @type {Guid}
     */
    static IID => Guid("{1d4dfcdd-2d43-4ee8-bbf1-c1b26a711a58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SignificantDigits", "put_SignificantDigits"]

    /**
     * Gets or sets the number of significant digits used in formatting or rounding numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.isignificantdigitsoption.significantdigits
     * @type {Integer} 
     */
    SignificantDigits {
        get => this.get_SignificantDigits()
        set => this.put_SignificantDigits(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignificantDigits() {
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
    put_SignificantDigits(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
