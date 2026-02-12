#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\PackageVolume.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IRegisterPackageOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisterPackageOptions
     * @type {Guid}
     */
    static IID => Guid("{677112a7-50d4-496c-8415-0602b4c6d3bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DependencyPackageUris", "get_AppDataVolume", "put_AppDataVolume", "get_OptionalPackageFamilyNames", "get_ExternalLocationUri", "put_ExternalLocationUri", "get_DeveloperMode", "put_DeveloperMode", "get_ForceAppShutdown", "put_ForceAppShutdown", "get_ForceTargetAppShutdown", "put_ForceTargetAppShutdown", "get_ForceUpdateFromAnyVersion", "put_ForceUpdateFromAnyVersion", "get_InstallAllResources", "put_InstallAllResources", "get_StageInPlace", "put_StageInPlace", "get_AllowUnsigned", "put_AllowUnsigned", "get_DeferRegistrationWhenPackagesAreInUse", "put_DeferRegistrationWhenPackagesAreInUse"]

    /**
     * @type {IVector<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * @type {PackageVolume} 
     */
    AppDataVolume {
        get => this.get_AppDataVolume()
        set => this.put_AppDataVolume(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    OptionalPackageFamilyNames {
        get => this.get_OptionalPackageFamilyNames()
    }

    /**
     * @type {Uri} 
     */
    ExternalLocationUri {
        get => this.get_ExternalLocationUri()
        set => this.put_ExternalLocationUri(value)
    }

    /**
     * @type {Boolean} 
     */
    DeveloperMode {
        get => this.get_DeveloperMode()
        set => this.put_DeveloperMode(value)
    }

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
    ForceTargetAppShutdown {
        get => this.get_ForceTargetAppShutdown()
        set => this.put_ForceTargetAppShutdown(value)
    }

    /**
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
        set => this.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * @type {Boolean} 
     */
    InstallAllResources {
        get => this.get_InstallAllResources()
        set => this.put_InstallAllResources(value)
    }

    /**
     * @type {Boolean} 
     */
    StageInPlace {
        get => this.get_StageInPlace()
        set => this.put_StageInPlace(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowUnsigned {
        get => this.get_AllowUnsigned()
        set => this.put_AllowUnsigned(value)
    }

    /**
     * @type {Boolean} 
     */
    DeferRegistrationWhenPackagesAreInUse {
        get => this.get_DeferRegistrationWhenPackagesAreInUse()
        set => this.put_DeferRegistrationWhenPackagesAreInUse(value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_DependencyPackageUris() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    get_AppDataVolume() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
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
    put_AppDataVolume(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OptionalPackageFamilyNames() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ExternalLocationUri() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ExternalLocationUri(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeveloperMode() {
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
    put_DeveloperMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceTargetAppShutdown() {
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
    put_ForceTargetAppShutdown(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_ForceUpdateFromAnyVersion(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InstallAllResources() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_InstallAllResources(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StageInPlace() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_StageInPlace(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowUnsigned() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_AllowUnsigned(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferRegistrationWhenPackagesAreInUse() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_DeferRegistrationWhenPackagesAreInUse(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
