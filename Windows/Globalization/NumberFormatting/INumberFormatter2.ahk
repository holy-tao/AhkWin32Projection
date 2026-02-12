#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that returns a string representation of a provided value, using distinct format methods to format several data types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter2
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumberFormatter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumberFormatter2
     * @type {Guid}
     */
    static IID => Guid("{d4a8c1f0-80d0-4b0d-a89e-882c1e8f8310}")

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
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter2.formatint
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
     * Returns a string representation of a **UInt64** value.
     * @param {Integer} value The **UInt64** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter2.formatuint
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
     * Returns a string representation of a **Double** value.
     * @param {Float} value The **Double** value to be formatted.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberformatter2.formatdouble
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
