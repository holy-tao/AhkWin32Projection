#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ILightSensor4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILightSensor4
     * @type {Guid}
     */
    static IID => Guid("{6167be97-6390-404c-9c19-445311c6a1d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsChromaticitySupported"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsChromaticitySupported() {
        result := ComCall(6, this, "int*", &supported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return supported
    }
}
