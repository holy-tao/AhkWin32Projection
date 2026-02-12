#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MagnetometerDataThreshold.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IMagnetometer4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagnetometer4
     * @type {Guid}
     */
    static IID => Guid("{dfb17901-3e0f-508f-b24b-f2bb75015f40}")

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
     * @type {MagnetometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * 
     * @returns {MagnetometerDataThreshold} 
     */
    get_ReportThreshold() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagnetometerDataThreshold(value)
    }
}
