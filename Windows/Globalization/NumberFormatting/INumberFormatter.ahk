#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that returns a string representation of a provided value, using an overloaded [Format](/uwp/api/windows.globalization.numberformatting.inumberformatter.format) method to format several data types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumberFormatter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumberFormatter
     * @type {Guid}
     */
    static IID => Guid("{a5007c49-7676-4db7-8631-1b6ff265caa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FormatInt", "FormatUInt", "FormatDouble"]

    /**
     * Returns a string representation of an **Int64** value.
     * @param {Integer} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter.format
     */
    FormatInt(value) {
        result_ := HSTRING()
        result := ComCall(6, this, "int64", value, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Returns a string representation of an **Int64** value.
     * @param {Integer} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter.format
     */
    FormatUInt(value) {
        result_ := HSTRING()
        result := ComCall(7, this, "uint", value, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Returns a string representation of an **Int64** value.
     * @param {Float} value The **Int64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter.format
     */
    FormatDouble(value) {
        result_ := HSTRING()
        result := ComCall(8, this, "double", value, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
