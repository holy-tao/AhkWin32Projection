#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IGeographicRegionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeographicRegionStatics
     * @type {Guid}
     */
    static IID => Guid("{29e28974-7ad9-4ef4-8799-b3b44fadec08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported"]

    /**
     * 
     * @param {HSTRING} geographicRegionCode 
     * @returns {Boolean} 
     */
    IsSupported(geographicRegionCode) {
        if(geographicRegionCode is String) {
            pin := HSTRING.Create(geographicRegionCode)
            geographicRegionCode := pin.Value
        }
        geographicRegionCode := geographicRegionCode is Win32Handle ? NumGet(geographicRegionCode, "ptr") : geographicRegionCode

        result := ComCall(6, this, "ptr", geographicRegionCode, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
