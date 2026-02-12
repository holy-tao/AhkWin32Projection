#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IGeovisitTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeovisitTrigger
     * @type {Guid}
     */
    static IID => Guid("{4818edaa-04e1-4127-9a4c-19351b8a80a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MonitoringScope", "put_MonitoringScope"]

    /**
     * @type {Integer} 
     */
    MonitoringScope {
        get => this.get_MonitoringScope()
        set => this.put_MonitoringScope(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitoringScope() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MonitoringScope(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
