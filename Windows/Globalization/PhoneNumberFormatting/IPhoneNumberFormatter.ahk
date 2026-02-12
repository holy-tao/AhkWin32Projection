#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPhoneNumberFormatter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneNumberFormatter
     * @type {Guid}
     */
    static IID => Guid("{1556b49e-bad4-4b4a-900d-4407adb7c981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Format", "FormatWithOutputFormat", "FormatPartialString", "FormatString", "FormatStringWithLeftToRightMarkers"]

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
     * @param {PhoneNumberInfo} number_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/format-cell-text-fields-section
     */
    Format(number_) {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", number_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {PhoneNumberInfo} number_ 
     * @param {Integer} numberFormat 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/format-cell-text-fields-section
     */
    FormatWithOutputFormat(number_, numberFormat) {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", number_, "int", numberFormat, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {HSTRING} 
     */
    FormatPartialString(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result_ := HSTRING()
        result := ComCall(8, this, "ptr", number_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {HSTRING} 
     */
    FormatString(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result_ := HSTRING()
        result := ComCall(9, this, "ptr", number_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {HSTRING} 
     */
    FormatStringWithLeftToRightMarkers(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result_ := HSTRING()
        result := ComCall(10, this, "ptr", number_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
