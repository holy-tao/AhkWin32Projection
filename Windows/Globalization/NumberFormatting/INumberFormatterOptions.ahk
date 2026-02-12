#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that gets and sets options for formatting numbers.
 * @remarks
 * If your app passes language tags from this interface to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumberFormatterOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumberFormatterOptions
     * @type {Guid}
     */
    static IID => Guid("{80332d21-aee1-4a39-baa2-07ed8c96daf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Languages", "get_GeographicRegion", "get_IntegerDigits", "put_IntegerDigits", "get_FractionDigits", "put_FractionDigits", "get_IsGrouped", "put_IsGrouped", "get_IsDecimalPointAlwaysDisplayed", "put_IsDecimalPointAlwaysDisplayed", "get_NumeralSystem", "put_NumeralSystem", "get_ResolvedLanguage", "get_ResolvedGeographicRegion"]

    /**
     * Gets the priority list of language identifiers that is used when formatting and parsing numbers.
     * @remarks
     * If your app passes language tags from this interface to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.languages
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * Gets the region that is used when formatting and parsing numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.geographicregion
     * @type {HSTRING} 
     */
    GeographicRegion {
        get => this.get_GeographicRegion()
    }

    /**
     * Gets or sets the minimum number of digits to display for the integer part of the number.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.integerdigits
     * @type {Integer} 
     */
    IntegerDigits {
        get => this.get_IntegerDigits()
        set => this.put_IntegerDigits(value)
    }

    /**
     * Gets or sets the minimum number of digits to display for the fraction part of the number.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.fractiondigits
     * @type {Integer} 
     */
    FractionDigits {
        get => this.get_FractionDigits()
        set => this.put_FractionDigits(value)
    }

    /**
     * Gets or sets whether the integer part of the number should be grouped.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.isgrouped
     * @type {Boolean} 
     */
    IsGrouped {
        get => this.get_IsGrouped()
        set => this.put_IsGrouped(value)
    }

    /**
     * Gets or sets whether the decimal point of the number should always be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.isdecimalpointalwaysdisplayed
     * @type {Boolean} 
     */
    IsDecimalPointAlwaysDisplayed {
        get => this.get_IsDecimalPointAlwaysDisplayed()
        set => this.put_IsDecimalPointAlwaysDisplayed(value)
    }

    /**
     * Gets or sets the numbering system that is used to format and parse numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.numeralsystem
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * Gets the language that was most recently used to format or parse numbers.
     * @remarks
     * If your app passes language tags from this interface to any [National Language Support](/windows/desktop/Intl/national-language-support) functions, it must first convert the tags by calling [ResolveLocaleName](/windows/desktop/api/winnls/nf-winnls-resolvelocalename).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.resolvedlanguage
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * Gets the geographic region that was most recently used to format or parse numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatteroptions.resolvedgeographicregion
     * @type {HSTRING} 
     */
    ResolvedGeographicRegion {
        get => this.get_ResolvedGeographicRegion()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GeographicRegion() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IntegerDigits() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IntegerDigits(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FractionDigits() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_FractionDigits(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrouped() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsGrouped(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecimalPointAlwaysDisplayed() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IsDecimalPointAlwaysDisplayed(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NumeralSystem() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NumeralSystem(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedGeographicRegion() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
