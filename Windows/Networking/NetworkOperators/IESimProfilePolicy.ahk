#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimProfilePolicy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimProfilePolicy
     * @type {Guid}
     */
    static IID => Guid("{e6dd0f1d-9c5c-46c5-a289-a948999bf062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanDelete", "get_CanDisable", "get_IsManagedByEnterprise"]

    /**
     * @type {Boolean} 
     */
    CanDelete {
        get => this.get_CanDelete()
    }

    /**
     * @type {Boolean} 
     */
    CanDisable {
        get => this.get_CanDisable()
    }

    /**
     * @type {Boolean} 
     */
    IsManagedByEnterprise {
        get => this.get_IsManagedByEnterprise()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDelete() {
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
    get_CanDisable() {
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
    get_IsManagedByEnterprise() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
