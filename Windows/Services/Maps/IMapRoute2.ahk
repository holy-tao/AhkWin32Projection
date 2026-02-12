#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRoute2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRoute2
     * @type {Guid}
     */
    static IID => Guid("{d1c5d40c-2213-4ab0-a260-46b38169beac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViolatedRestrictions", "get_HasBlockedRoads"]

    /**
     * @type {Integer} 
     */
    ViolatedRestrictions {
        get => this.get_ViolatedRestrictions()
    }

    /**
     * @type {Boolean} 
     */
    HasBlockedRoads {
        get => this.get_HasBlockedRoads()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViolatedRestrictions() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasBlockedRoads() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
