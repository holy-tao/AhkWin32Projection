#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFindRelatedPackagesOptions.ahk
#Include .\IFindRelatedPackagesOptionsFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Provides filtering when searching for packages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class FindRelatedPackagesOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFindRelatedPackagesOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFindRelatedPackagesOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of [FindRelatedPackagesOptions](findrelatedpackagesoptions.md).
     * @param {Integer} Relationship A [PackageRelationship](packagerelationship.md) which specifies the relationship of the packages to be retrieved.
     * @returns {FindRelatedPackagesOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.#ctor
     */
    static CreateInstance(Relationship) {
        if (!FindRelatedPackagesOptions.HasProp("__IFindRelatedPackagesOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FindRelatedPackagesOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFindRelatedPackagesOptionsFactory.IID)
            FindRelatedPackagesOptions.__IFindRelatedPackagesOptionsFactory := IFindRelatedPackagesOptionsFactory(factoryPtr)
        }

        return FindRelatedPackagesOptions.__IFindRelatedPackagesOptionsFactory.CreateInstance(Relationship)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The [PackageRelationship](./packagerelationship.md) specifies the relationship of the packages to be retrieved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.relationship
     * @type {Integer} 
     */
    Relationship {
        get => this.get_Relationship()
        set => this.put_Relationship(value)
    }

    /**
     * Indicates if framework packages should be included.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.includeframeworks
     * @type {Boolean} 
     */
    IncludeFrameworks {
        get => this.get_IncludeFrameworks()
        set => this.put_IncludeFrameworks(value)
    }

    /**
     * Indicates if **hostRuntime** packages should be included.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.includehostruntimes
     * @type {Boolean} 
     */
    IncludeHostRuntimes {
        get => this.get_IncludeHostRuntimes()
        set => this.put_IncludeHostRuntimes(value)
    }

    /**
     * Indicates if optional dependency packages should be included.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.includeoptionals
     * @type {Boolean} 
     */
    IncludeOptionals {
        get => this.get_IncludeOptionals()
        set => this.put_IncludeOptionals(value)
    }

    /**
     * Indicates if resource packages should be included.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.includeresources
     * @type {Boolean} 
     */
    IncludeResources {
        get => this.get_IncludeResources()
        set => this.put_IncludeResources(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Relationship() {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.get_Relationship()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Relationship(value) {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.put_Relationship(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeFrameworks() {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.get_IncludeFrameworks()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeFrameworks(value) {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.put_IncludeFrameworks(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeHostRuntimes() {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.get_IncludeHostRuntimes()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeHostRuntimes(value) {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.put_IncludeHostRuntimes(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeOptionals() {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.get_IncludeOptionals()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeOptionals(value) {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.put_IncludeOptionals(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeResources() {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.get_IncludeResources()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeResources(value) {
        if (!this.HasProp("__IFindRelatedPackagesOptions")) {
            if ((queryResult := this.QueryInterface(IFindRelatedPackagesOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindRelatedPackagesOptions := IFindRelatedPackagesOptions(outPtr)
        }

        return this.__IFindRelatedPackagesOptions.put_IncludeResources(value)
    }

;@endregion Instance Methods
}
