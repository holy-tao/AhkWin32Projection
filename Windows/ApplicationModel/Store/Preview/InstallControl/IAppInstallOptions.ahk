#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Management\Deployment\PackageVolume.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallOptions
     * @type {Guid}
     */
    static IID => Guid("{c9808300-1cb8-4eb6-8c9f-6a30c64a5b51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CatalogId", "put_CatalogId", "get_ForceUseOfNonRemovableStorage", "put_ForceUseOfNonRemovableStorage", "get_AllowForcedAppRestart", "put_AllowForcedAppRestart", "get_Repair", "put_Repair", "get_TargetVolume", "put_TargetVolume", "get_LaunchAfterInstall", "put_LaunchAfterInstall"]

    /**
     * @type {HSTRING} 
     */
    CatalogId {
        get => this.get_CatalogId()
        set => this.put_CatalogId(value)
    }

    /**
     * @type {Boolean} 
     */
    ForceUseOfNonRemovableStorage {
        get => this.get_ForceUseOfNonRemovableStorage()
        set => this.put_ForceUseOfNonRemovableStorage(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowForcedAppRestart {
        get => this.get_AllowForcedAppRestart()
        set => this.put_AllowForcedAppRestart(value)
    }

    /**
     * @type {Boolean} 
     */
    Repair {
        get => this.get_Repair()
        set => this.put_Repair(value)
    }

    /**
     * @type {PackageVolume} 
     */
    TargetVolume {
        get => this.get_TargetVolume()
        set => this.put_TargetVolume(value)
    }

    /**
     * @type {Boolean} 
     */
    LaunchAfterInstall {
        get => this.get_LaunchAfterInstall()
        set => this.put_LaunchAfterInstall(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CatalogId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CatalogId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUseOfNonRemovableStorage() {
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
    put_ForceUseOfNonRemovableStorage(value) {
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
    get_AllowForcedAppRestart() {
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
    put_AllowForcedAppRestart(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Repair() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_Repair(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    get_TargetVolume() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageVolume(value)
    }

    /**
     * 
     * @param {PackageVolume} value 
     * @returns {HRESULT} 
     */
    put_TargetVolume(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LaunchAfterInstall() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_LaunchAfterInstall(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
