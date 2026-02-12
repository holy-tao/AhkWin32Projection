#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteLeg2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteLeg2
     * @type {Guid}
     */
    static IID => Guid("{02e2062d-c9c6-45b8-8e54-1a10b57a17e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DurationWithoutTraffic", "get_TrafficCongestion"]

    /**
     * @type {TimeSpan} 
     */
    DurationWithoutTraffic {
        get => this.get_DurationWithoutTraffic()
    }

    /**
     * @type {Integer} 
     */
    TrafficCongestion {
        get => this.get_TrafficCongestion()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DurationWithoutTraffic() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrafficCongestion() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
