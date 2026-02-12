#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Inclinometer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IInclinometerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInclinometerStatics2
     * @type {Guid}
     */
    static IID => Guid("{043f9775-6a1e-499c-86e0-638c1a864b00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultForRelativeReadings"]

    /**
     * 
     * @returns {Inclinometer} 
     */
    GetDefaultForRelativeReadings() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Inclinometer(result_)
    }
}
