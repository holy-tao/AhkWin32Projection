#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IMaintenanceTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMaintenanceTrigger
     * @type {Guid}
     */
    static IID => Guid("{68184c83-fc22-4ce5-841a-7239a9810047}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FreshnessTime", "get_OneShot"]

    /**
     * @type {Integer} 
     */
    FreshnessTime {
        get => this.get_FreshnessTime()
    }

    /**
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FreshnessTime() {
        result := ComCall(6, this, "uint*", &freshnessTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return freshnessTime
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        result := ComCall(7, this, "int*", &oneShot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return oneShot
    }
}
