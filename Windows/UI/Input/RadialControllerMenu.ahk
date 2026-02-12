#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerMenu.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the integrated menu of contextual tools associated with the [RadialController](radialcontroller.md) object.
  * 
  * > [!NOTE]
  * > Tools added to a [RadialController](radialcontroller.md) menu in support of a specific app context are only displayed in that context. They are not displayed for other [RadialController](radialcontroller.md) instances.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenu
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerMenu extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerMenu

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerMenu.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of custom tools on the [RadialController](radialcontroller.md) menu. Built-in tools are not included.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenu.items
     * @type {IVector<RadialControllerMenuItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * Gets or sets whether custom tools are displayed on the [RadialController](radialcontroller.md) menu.
     * @remarks
     * In Windows 10 Anniversary Update, this property does not return a value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenu.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<RadialControllerMenuItem>} 
     */
    get_Items() {
        if (!this.HasProp("__IRadialControllerMenu")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenu := IRadialControllerMenu(outPtr)
        }

        return this.__IRadialControllerMenu.get_Items()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IRadialControllerMenu")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenu := IRadialControllerMenu(outPtr)
        }

        return this.__IRadialControllerMenu.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IRadialControllerMenu")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenu := IRadialControllerMenu(outPtr)
        }

        return this.__IRadialControllerMenu.put_IsEnabled(value)
    }

    /**
     * Retrieves the active custom tool from the [RadialController](radialcontroller.md) menu .
     * @returns {RadialControllerMenuItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenu.getselectedmenuitem
     */
    GetSelectedMenuItem() {
        if (!this.HasProp("__IRadialControllerMenu")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenu := IRadialControllerMenu(outPtr)
        }

        return this.__IRadialControllerMenu.GetSelectedMenuItem()
    }

    /**
     * Selects and activates the specified custom tool from the [RadialController](radialcontroller.md) menu.
     * @param {RadialControllerMenuItem} menuItem_ The custom tool to select.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenu.selectmenuitem
     */
    SelectMenuItem(menuItem_) {
        if (!this.HasProp("__IRadialControllerMenu")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenu := IRadialControllerMenu(outPtr)
        }

        return this.__IRadialControllerMenu.SelectMenuItem(menuItem_)
    }

    /**
     * Attempts to select and activate the previously selected tool from the [RadialController](radialcontroller.md) menu.
     * 
     * This method does not differentiate between built-in and custom tools.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenu.tryselectpreviouslyselectedmenuitem
     */
    TrySelectPreviouslySelectedMenuItem() {
        if (!this.HasProp("__IRadialControllerMenu")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenu := IRadialControllerMenu(outPtr)
        }

        return this.__IRadialControllerMenu.TrySelectPreviouslySelectedMenuItem()
    }

;@endregion Instance Methods
}
