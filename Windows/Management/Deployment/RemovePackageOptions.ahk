#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemovePackageOptions.ahk
#Include .\IRemovePackageOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class RemovePackageOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemovePackageOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemovePackageOptions.IID

;@endregion Static Properties

;@region Instance Properties
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
     * @type {Boolean} 
     */
    DeferRemovalWhenPackagesAreInUse {
        get => this.get_DeferRemovalWhenPackagesAreInUse()
        set => this.put_DeferRemovalWhenPackagesAreInUse(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.RemovePackageOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreserveApplicationData() {
        if (!this.HasProp("__IRemovePackageOptions")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions := IRemovePackageOptions(outPtr)
        }

        return this.__IRemovePackageOptions.get_PreserveApplicationData()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreserveApplicationData(value) {
        if (!this.HasProp("__IRemovePackageOptions")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions := IRemovePackageOptions(outPtr)
        }

        return this.__IRemovePackageOptions.put_PreserveApplicationData(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreserveRoamableApplicationData() {
        if (!this.HasProp("__IRemovePackageOptions")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions := IRemovePackageOptions(outPtr)
        }

        return this.__IRemovePackageOptions.get_PreserveRoamableApplicationData()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreserveRoamableApplicationData(value) {
        if (!this.HasProp("__IRemovePackageOptions")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions := IRemovePackageOptions(outPtr)
        }

        return this.__IRemovePackageOptions.put_PreserveRoamableApplicationData(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemoveForAllUsers() {
        if (!this.HasProp("__IRemovePackageOptions")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions := IRemovePackageOptions(outPtr)
        }

        return this.__IRemovePackageOptions.get_RemoveForAllUsers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RemoveForAllUsers(value) {
        if (!this.HasProp("__IRemovePackageOptions")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions := IRemovePackageOptions(outPtr)
        }

        return this.__IRemovePackageOptions.put_RemoveForAllUsers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferRemovalWhenPackagesAreInUse() {
        if (!this.HasProp("__IRemovePackageOptions2")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions2 := IRemovePackageOptions2(outPtr)
        }

        return this.__IRemovePackageOptions2.get_DeferRemovalWhenPackagesAreInUse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeferRemovalWhenPackagesAreInUse(value) {
        if (!this.HasProp("__IRemovePackageOptions2")) {
            if ((queryResult := this.QueryInterface(IRemovePackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemovePackageOptions2 := IRemovePackageOptions2(outPtr)
        }

        return this.__IRemovePackageOptions2.put_DeferRemovalWhenPackagesAreInUse(value)
    }

;@endregion Instance Methods
}
