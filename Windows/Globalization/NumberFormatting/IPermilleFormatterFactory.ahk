#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PermilleFormatter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPermilleFormatterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPermilleFormatterFactory
     * @type {Guid}
     */
    static IID => Guid("{2b37b4ac-e638-4ed5-a998-62f6b06a49ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePermilleFormatter"]

    /**
     * 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} geographicRegion_ 
     * @returns {PermilleFormatter} 
     */
    CreatePermilleFormatter(languages, geographicRegion_) {
        if(geographicRegion_ is String) {
            pin := HSTRING.Create(geographicRegion_)
            geographicRegion_ := pin.Value
        }
        geographicRegion_ := geographicRegion_ is Win32Handle ? NumGet(geographicRegion_, "ptr") : geographicRegion_

        result := ComCall(6, this, "ptr", languages, "ptr", geographicRegion_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PermilleFormatter(result_)
    }
}
