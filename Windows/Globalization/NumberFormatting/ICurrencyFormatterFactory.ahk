#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CurrencyFormatter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class ICurrencyFormatterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrencyFormatterFactory
     * @type {Guid}
     */
    static IID => Guid("{86c7537e-b938-4aa2-84b0-2c33dc5b1450}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCurrencyFormatterCode", "CreateCurrencyFormatterCodeContext"]

    /**
     * 
     * @param {HSTRING} currencyCode 
     * @returns {CurrencyFormatter} 
     */
    CreateCurrencyFormatterCode(currencyCode) {
        if(currencyCode is String) {
            pin := HSTRING.Create(currencyCode)
            currencyCode := pin.Value
        }
        currencyCode := currencyCode is Win32Handle ? NumGet(currencyCode, "ptr") : currencyCode

        result := ComCall(6, this, "ptr", currencyCode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CurrencyFormatter(result_)
    }

    /**
     * 
     * @param {HSTRING} currencyCode 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} geographicRegion_ 
     * @returns {CurrencyFormatter} 
     */
    CreateCurrencyFormatterCodeContext(currencyCode, languages, geographicRegion_) {
        if(currencyCode is String) {
            pin := HSTRING.Create(currencyCode)
            currencyCode := pin.Value
        }
        currencyCode := currencyCode is Win32Handle ? NumGet(currencyCode, "ptr") : currencyCode
        if(geographicRegion_ is String) {
            pin := HSTRING.Create(geographicRegion_)
            geographicRegion_ := pin.Value
        }
        geographicRegion_ := geographicRegion_ is Win32Handle ? NumGet(geographicRegion_, "ptr") : geographicRegion_

        result := ComCall(7, this, "ptr", currencyCode, "ptr", languages, "ptr", geographicRegion_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CurrencyFormatter(result_)
    }
}
