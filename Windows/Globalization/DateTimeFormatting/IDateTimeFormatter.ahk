#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class IDateTimeFormatter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDateTimeFormatter
     * @type {Guid}
     */
    static IID => Guid("{95eeca10-73e0-4e4b-a183-3d6ad0ba35ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Languages", "get_GeographicRegion", "get_Calendar", "get_Clock", "get_NumeralSystem", "put_NumeralSystem", "get_Patterns", "get_Template", "Format", "get_IncludeYear", "get_IncludeMonth", "get_IncludeDayOfWeek", "get_IncludeDay", "get_IncludeHour", "get_IncludeMinute", "get_IncludeSecond", "get_ResolvedLanguage", "get_ResolvedGeographicRegion"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * @type {HSTRING} 
     */
    GeographicRegion {
        get => this.get_GeographicRegion()
    }

    /**
     * @type {HSTRING} 
     */
    Calendar {
        get => this.get_Calendar()
    }

    /**
     * @type {HSTRING} 
     */
    Clock {
        get => this.get_Clock()
    }

    /**
     * @type {HSTRING} 
     */
    NumeralSystem {
        get => this.get_NumeralSystem()
        set => this.put_NumeralSystem(value)
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Patterns {
        get => this.get_Patterns()
    }

    /**
     * @type {HSTRING} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * @type {Integer} 
     */
    IncludeYear {
        get => this.get_IncludeYear()
    }

    /**
     * @type {Integer} 
     */
    IncludeMonth {
        get => this.get_IncludeMonth()
    }

    /**
     * @type {Integer} 
     */
    IncludeDayOfWeek {
        get => this.get_IncludeDayOfWeek()
    }

    /**
     * @type {Integer} 
     */
    IncludeDay {
        get => this.get_IncludeDay()
    }

    /**
     * @type {Integer} 
     */
    IncludeHour {
        get => this.get_IncludeHour()
    }

    /**
     * @type {Integer} 
     */
    IncludeMinute {
        get => this.get_IncludeMinute()
    }

    /**
     * @type {Integer} 
     */
    IncludeSecond {
        get => this.get_IncludeSecond()
    }

    /**
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
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
     * @returns {HSTRING} 
     */
    get_Calendar() {
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
    get_Clock() {
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
    get_NumeralSystem() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Patterns() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Template() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the formatting of a text field that is a string, a number, a date or time, a duration, or a currency.
     * @remarks
     * If the value of the Type cell is 0, 2, 5, 6, or 7 (string, number, date or time, duration, or currency, respectively), specify a format picture appropriate for the data type. For example, the format picture "# #/4 UU" formats the number 12.43 in. as 12 2/4 INCHES. For more information about specifying a format picture, see [About format pictures](about-format-pictures.md).
     *   
     * A number (Type = 2) can represent a dimension, scalar, angle, date, time, or currency. To ensure that an input number is always evaluated as a date, time, or currency, use the DATETIME or CY function in the Format cell instead of a format picture.
     *   
     * To get a reference to the Format cell by name from another formula, or from a program using the **CellsU** property, use: 
     *   
     * ||Value |
     * |:-----|:-----|
     * | **Cell name:**  <br/> | Fields.Format[  *i*  ]            where  *i*  = <1>, 2, 3... |
     *    
     * To get a reference to the Format cell by index from a program, use the **CellsSRC** property with the following arguments: 
     *   
     * ||Value |
     * |:-----|:-----|
     * | **Section index:**  <br/> |**visSectionTextField** <br/> |
     * | **Row index:**  <br/> |**visRowField** +  *i*            where  *i*  = 0, 1, 2... |
     * | **Cell index:**  <br/> |**visFieldFormat** <br/> |
     * @param {DateTime} value 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/format-cell-text-fields-section
     */
    Format(value) {
        result_ := HSTRING()
        result := ComCall(14, this, "ptr", value, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeYear() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeMonth() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeDayOfWeek() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeDay() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeHour() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeMinute() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncludeSecond() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
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
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
