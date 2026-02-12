#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IDeleteSharedPackageContainerOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeleteSharedPackageContainerOptions
     * @type {Guid}
     */
    static IID => Guid("{9d81865f-986e-5138-8b5d-384d8e66ed6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ForceAppShutdown", "put_ForceAppShutdown", "get_AllUsers", "put_AllUsers"]

    /**
     * @type {Boolean} 
     */
    ForceAppShutdown {
        get => this.get_ForceAppShutdown()
        set => this.put_ForceAppShutdown(value)
    }

    /**
     * @type {Boolean} 
     */
    AllUsers {
        get => this.get_AllUsers()
        set => this.put_AllUsers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceAppShutdown(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllUsers() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllUsers(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
