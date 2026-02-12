#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PercentFormatter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPercentFormatterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPercentFormatterFactory
     * @type {Guid}
     */
    static IID => Guid("{b7828aef-fed4-4018-a6e2-e09961e03765}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePercentFormatter"]

    /**
     * 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} geographicRegion_ 
     * @returns {PercentFormatter} 
     */
    CreatePercentFormatter(languages, geographicRegion_) {
        if(geographicRegion_ is String) {
            pin := HSTRING.Create(geographicRegion_)
            geographicRegion_ := pin.Value
        }
        geographicRegion_ := geographicRegion_ is Win32Handle ? NumGet(geographicRegion_, "ptr") : geographicRegion_

        result := ComCall(6, this, "ptr", languages, "ptr", geographicRegion_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PercentFormatter(result_)
    }
}
