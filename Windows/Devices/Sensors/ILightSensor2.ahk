#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ILightSensor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILightSensor2
     * @type {Guid}
     */
    static IID => Guid("{486b24e8-a94c-4090-8f48-09f782a9f7d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ReportLatency", "get_ReportLatency", "get_MaxBatchSize"]

    /**
     * @type {Integer} 
     */
    ReportLatency {
        get => this.get_ReportLatency()
        set => this.put_ReportLatency(value)
    }

    /**
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportLatency(value) {
        result := ComCall(6, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportLatency() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
