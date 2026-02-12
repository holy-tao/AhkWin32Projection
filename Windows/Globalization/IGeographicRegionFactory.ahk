#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\GeographicRegion.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IGeographicRegionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeographicRegionFactory
     * @type {Guid}
     */
    static IID => Guid("{53425270-77b4-426b-859f-81e19d512546}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGeographicRegion"]

    /**
     * 
     * @param {HSTRING} geographicRegionCode 
     * @returns {GeographicRegion} 
     */
    CreateGeographicRegion(geographicRegionCode) {
        if(geographicRegionCode is String) {
            pin := HSTRING.Create(geographicRegionCode)
            geographicRegionCode := pin.Value
        }
        geographicRegionCode := geographicRegionCode is Win32Handle ? NumGet(geographicRegionCode, "ptr") : geographicRegionCode

        result := ComCall(6, this, "ptr", geographicRegionCode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeographicRegion(result_)
    }
}
