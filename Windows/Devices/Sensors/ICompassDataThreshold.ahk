#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ICompassDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompassDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{d15b52b3-d39d-5ec8-b2e4-f193e6ab34ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Degrees", "put_Degrees"]

    /**
     * @type {Float} 
     */
    Degrees {
        get => this.get_Degrees()
        set => this.put_Degrees(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Degrees() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Degrees(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
