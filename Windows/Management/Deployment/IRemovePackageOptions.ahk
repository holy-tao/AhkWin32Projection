#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IRemovePackageOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemovePackageOptions
     * @type {Guid}
     */
    static IID => Guid("{13cf01f3-c450-4f7c-a5a3-5e3c631b7462}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreserveApplicationData", "put_PreserveApplicationData", "get_PreserveRoamableApplicationData", "put_PreserveRoamableApplicationData", "get_RemoveForAllUsers", "put_RemoveForAllUsers"]

    /**
     * @type {Boolean} 
     */
    PreserveApplicationData {
        get => this.get_PreserveApplicationData()
        set => this.put_PreserveApplicationData(value)
    }

    /**
     * @type {Boolean} 
     */
    PreserveRoamableApplicationData {
        get => this.get_PreserveRoamableApplicationData()
        set => this.put_PreserveRoamableApplicationData(value)
    }

    /**
     * @type {Boolean} 
     */
    RemoveForAllUsers {
        get => this.get_RemoveForAllUsers()
        set => this.put_RemoveForAllUsers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreserveApplicationData() {
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
    put_PreserveApplicationData(value) {
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
    get_PreserveRoamableApplicationData() {
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
    put_PreserveRoamableApplicationData(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemoveForAllUsers() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_RemoveForAllUsers(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
