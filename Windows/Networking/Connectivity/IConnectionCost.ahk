#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectionCost extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionCost
     * @type {Guid}
     */
    static IID => Guid("{bad7d829-3416-4b10-a202-bac0b075bdae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkCostType", "get_Roaming", "get_OverDataLimit", "get_ApproachingDataLimit"]

    /**
     * @type {Integer} 
     */
    NetworkCostType {
        get => this.get_NetworkCostType()
    }

    /**
     * @type {Boolean} 
     */
    Roaming {
        get => this.get_Roaming()
    }

    /**
     * @type {Boolean} 
     */
    OverDataLimit {
        get => this.get_OverDataLimit()
    }

    /**
     * @type {Boolean} 
     */
    ApproachingDataLimit {
        get => this.get_ApproachingDataLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkCostType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Roaming() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OverDataLimit() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ApproachingDataLimit() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
