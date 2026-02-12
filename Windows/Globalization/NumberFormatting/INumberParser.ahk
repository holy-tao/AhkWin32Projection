#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that parses a string representation of a numeric value.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberparser
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumberParser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumberParser
     * @type {Guid}
     */
    static IID => Guid("{e6659412-4a13-4a53-83a1-392fbe4cff9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseInt", "ParseUInt", "ParseDouble"]

    /**
     * Attempts to parse a string representation of an integer numeric value.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberparser.parseint
     */
    ParseInt(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(6, this, "ptr", text, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt64(), result_)
    }

    /**
     * Attempts to parse a string representation of an unsigned integer numeric value.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberparser.parseuint
     */
    ParseUInt(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", text, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt64(), result_)
    }

    /**
     * Attempts to parse a string representation of a **Double** numeric value.
     * @param {HSTRING} text The text to be parsed.
     * @returns {IReference<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.inumberparser.parsedouble
     */
    ParseDouble(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(8, this, "ptr", text, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), result_)
    }
}
