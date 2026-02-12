#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IGeographicRegion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeographicRegion
     * @type {Guid}
     */
    static IID => Guid("{01e9a621-4a64-4ed9-954f-9edeb07bd903}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Code", "get_CodeTwoLetter", "get_CodeThreeLetter", "get_CodeThreeDigit", "get_DisplayName", "get_NativeName", "get_CurrenciesInUse"]

    /**
     * @type {HSTRING} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * @type {HSTRING} 
     */
    CodeTwoLetter {
        get => this.get_CodeTwoLetter()
    }

    /**
     * @type {HSTRING} 
     */
    CodeThreeLetter {
        get => this.get_CodeThreeLetter()
    }

    /**
     * @type {HSTRING} 
     */
    CodeThreeDigit {
        get => this.get_CodeThreeDigit()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    NativeName {
        get => this.get_NativeName()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    CurrenciesInUse {
        get => this.get_CurrenciesInUse()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Code() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CodeTwoLetter() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CodeThreeLetter() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CodeThreeDigit() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NativeName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_CurrenciesInUse() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
