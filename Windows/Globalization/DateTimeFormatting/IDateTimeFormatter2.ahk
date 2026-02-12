#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class IDateTimeFormatter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDateTimeFormatter2
     * @type {Guid}
     */
    static IID => Guid("{27c91a86-bdaa-4fd0-9e36-671d5aa5ee03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FormatUsingTimeZone"]

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
     * @param {DateTime} datetime_ 
     * @param {HSTRING} timeZoneId 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/format-cell-text-fields-section
     */
    FormatUsingTimeZone(datetime_, timeZoneId) {
        if(timeZoneId is String) {
            pin := HSTRING.Create(timeZoneId)
            timeZoneId := pin.Value
        }
        timeZoneId := timeZoneId is Win32Handle ? NumGet(timeZoneId, "ptr") : timeZoneId

        result_ := HSTRING()
        result := ComCall(6, this, "ptr", datetime_, "ptr", timeZoneId, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
