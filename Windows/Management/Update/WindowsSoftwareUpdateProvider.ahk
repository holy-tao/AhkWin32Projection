#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateProvider.ahk
#Include .\IWindowsSoftwareUpdateProviderFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} folderPath 
     * @returns {WindowsSoftwareUpdateProvider} 
     */
    static CreateInstance(folderPath) {
        if (!WindowsSoftwareUpdateProvider.HasProp("__IWindowsSoftwareUpdateProviderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateProviderFactory.IID)
            WindowsSoftwareUpdateProvider.__IWindowsSoftwareUpdateProviderFactory := IWindowsSoftwareUpdateProviderFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateProvider.__IWindowsSoftwareUpdateProviderFactory.CreateInstance(folderPath)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {HSTRING} 
     */
    FolderPath {
        get => this.get_FolderPath()
    }

    /**
     * @type {HSTRING} 
     */
    CatalogFile {
        get => this.get_CatalogFile()
    }

    /**
     * @type {HSTRING} 
     */
    ScanFileName {
        get => this.get_ScanFileName()
    }

    /**
     * @type {HSTRING} 
     */
    ScanFileArguments {
        get => this.get_ScanFileArguments()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {IVectorView<WindowsSoftwareUpdateProviderPayloadFileInfo>} 
     */
    PayloadFiles {
        get => this.get_PayloadFiles()
    }

    /**
     * @type {Integer} 
     */
    TrustState {
        get => this.get_TrustState()
    }

    /**
     * @type {Integer} 
     */
    RegistrationType {
        get => this.get_RegistrationType()
    }

    /**
     * @type {PropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    Register() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.Register()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    Unregister() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.Unregister()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    Validate() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.Validate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Version() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_Version()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderPath() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_FolderPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CatalogFile() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_CatalogFile()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ScanFileName() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_ScanFileName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ScanFileArguments() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_ScanFileArguments()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_Type()
    }

    /**
     * 
     * @returns {IVectorView<WindowsSoftwareUpdateProviderPayloadFileInfo>} 
     */
    get_PayloadFiles() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_PayloadFiles()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrustState() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_TrustState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegistrationType() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_RegistrationType()
    }

    /**
     * 
     * @returns {PropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.get_Properties()
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IInspectable} 
     */
    GetPropertyValue(name) {
        if (!this.HasProp("__IWindowsSoftwareUpdateProvider")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProvider := IWindowsSoftwareUpdateProvider(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProvider.GetPropertyValue(name)
    }

;@endregion Instance Methods
}
