#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BarometerDataThreshold.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IBarometer3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarometer3
     * @type {Guid}
     */
    static IID => Guid("{0e35f0ea-02b5-5a04-b03d-822084863a54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReportThreshold"]

    /**
     * @type {BarometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * 
     * @returns {BarometerDataThreshold} 
     */
    get_ReportThreshold() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarometerDataThreshold(value)
    }
}
