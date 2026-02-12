#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationDataContainer.ahk
#Include ..\Foundation\IClosable.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a container for app settings. The methods and properties of this class support creating, deleting, enumerating, and traversing the container hierarchy.
 * @remarks
 * > [!NOTE]
 * > There is no settings container for the temporary app data store.
 * 
 * The [Values](applicationdatacontainer_values.md) property gets an [ApplicationDataContainerSettings](applicationdatacontainersettings.md) object that provides access to the settings stored in the container.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ApplicationDataContainer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationDataContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationDataContainer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the current settings container.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the type (local or roaming) of the app data store that is associated with the current settings container.
     * @remarks
     * There is no temporary settings container, so the [ApplicationDataLocality.Temporary](applicationdatalocality.md) value can't be returned by this property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.locality
     * @type {Integer} 
     */
    Locality {
        get => this.get_Locality()
    }

    /**
     * Gets an object that represents the settings in this settings container.
     * @remarks
     * Note that the value is limited to 8192 bytes. If you attempt to write a larger value into the property, it leads to an exception indicating that the size of the state manager setting value has exceeded the limit.
     * 
     * For an example of using an [ApplicationData](applicationdata.md) property to get its associated ApplicationDataContainer.Values, see [LocalSettings](applicationdata_localsettings.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.values
     * @type {IPropertySet} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * Gets the child application settings containers of this application settings container.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.containers
     * @type {IMapView<HSTRING, ApplicationDataContainer>} 
     */
    Containers {
        get => this.get_Containers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IApplicationDataContainer")) {
            if ((queryResult := this.QueryInterface(IApplicationDataContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationDataContainer := IApplicationDataContainer(outPtr)
        }

        return this.__IApplicationDataContainer.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Locality() {
        if (!this.HasProp("__IApplicationDataContainer")) {
            if ((queryResult := this.QueryInterface(IApplicationDataContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationDataContainer := IApplicationDataContainer(outPtr)
        }

        return this.__IApplicationDataContainer.get_Locality()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Values() {
        if (!this.HasProp("__IApplicationDataContainer")) {
            if ((queryResult := this.QueryInterface(IApplicationDataContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationDataContainer := IApplicationDataContainer(outPtr)
        }

        return this.__IApplicationDataContainer.get_Values()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, ApplicationDataContainer>} 
     */
    get_Containers() {
        if (!this.HasProp("__IApplicationDataContainer")) {
            if ((queryResult := this.QueryInterface(IApplicationDataContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationDataContainer := IApplicationDataContainer(outPtr)
        }

        return this.__IApplicationDataContainer.get_Containers()
    }

    /**
     * Creates or opens the specified settings container in the current settings container.
     * @param {HSTRING} name The name of the container.
     * @param {Integer} disposition One of the enumeration values.
     * @returns {ApplicationDataContainer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.createcontainer
     */
    CreateContainer(name, disposition) {
        if (!this.HasProp("__IApplicationDataContainer")) {
            if ((queryResult := this.QueryInterface(IApplicationDataContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationDataContainer := IApplicationDataContainer(outPtr)
        }

        return this.__IApplicationDataContainer.CreateContainer(name, disposition)
    }

    /**
     * Deletes the specified settings container, its subcontainers, and all application settings in the hierarchy.
     * @param {HSTRING} name The name of the settings container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.deletecontainer
     */
    DeleteContainer(name) {
        if (!this.HasProp("__IApplicationDataContainer")) {
            if ((queryResult := this.QueryInterface(IApplicationDataContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationDataContainer := IApplicationDataContainer(outPtr)
        }

        return this.__IApplicationDataContainer.DeleteContainer(name)
    }

    /**
     * > [!NOTE]
     * > This member is not implemented in C#.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacontainer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
