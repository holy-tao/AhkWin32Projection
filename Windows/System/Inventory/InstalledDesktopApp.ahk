#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInstalledDesktopApp.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IInstalledDesktopAppStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a list of installed Win32 apps available to the current user. This includes apps installed for all users as well as only for the current user.
 * @remarks
 * InstalledDesktopApp checks for the **packageQuery** capability and returns an empty vector if the capability isn’t held by the caller.
 * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp
 * @namespace Windows.System.Inventory
 * @version WindowsRuntime 1.4
 */
class InstalledDesktopApp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInstalledDesktopApp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInstalledDesktopApp.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a list of installed Win32 apps available to the current user. This includes apps installed for all users as well as only for the current user.
     * @remarks
     * The list includes apps installed for all users as well as only for the current user.
     * @returns {IAsyncOperation<IVectorView<InstalledDesktopApp>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp.getinventoryasync
     */
    static GetInventoryAsync() {
        if (!InstalledDesktopApp.HasProp("__IInstalledDesktopAppStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Inventory.InstalledDesktopApp")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInstalledDesktopAppStatics.IID)
            InstalledDesktopApp.__IInstalledDesktopAppStatics := IInstalledDesktopAppStatics(factoryPtr)
        }

        return InstalledDesktopApp.__IInstalledDesktopAppStatics.GetInventoryAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the string-based ID of the installed desktop app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the display name of the installed desktop app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the publisher of the installed desktop app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp.publisher
     * @type {HSTRING} 
     */
    Publisher {
        get => this.get_Publisher()
    }

    /**
     * Gets the string-based version of the installed desktop app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp.displayversion
     * @type {HSTRING} 
     */
    DisplayVersion {
        get => this.get_DisplayVersion()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IInstalledDesktopApp")) {
            if ((queryResult := this.QueryInterface(IInstalledDesktopApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstalledDesktopApp := IInstalledDesktopApp(outPtr)
        }

        return this.__IInstalledDesktopApp.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IInstalledDesktopApp")) {
            if ((queryResult := this.QueryInterface(IInstalledDesktopApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstalledDesktopApp := IInstalledDesktopApp(outPtr)
        }

        return this.__IInstalledDesktopApp.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Publisher() {
        if (!this.HasProp("__IInstalledDesktopApp")) {
            if ((queryResult := this.QueryInterface(IInstalledDesktopApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstalledDesktopApp := IInstalledDesktopApp(outPtr)
        }

        return this.__IInstalledDesktopApp.get_Publisher()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayVersion() {
        if (!this.HasProp("__IInstalledDesktopApp")) {
            if ((queryResult := this.QueryInterface(IInstalledDesktopApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstalledDesktopApp := IInstalledDesktopApp(outPtr)
        }

        return this.__IInstalledDesktopApp.get_DisplayVersion()
    }

    /**
     * Returns a string that represents the current [InstalledDesktopApp](installeddesktopapp.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.inventory.installeddesktopapp.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
