#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerConfiguration.ahk
#Include .\IRadialControllerConfiguration2.ahk
#Include .\IRadialControllerConfigurationStatics.ahk
#Include .\IRadialControllerConfigurationStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides configuration details for the [RadialController](radialcontroller.md) menu.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerConfiguration.IID

    /**
     * Gets or sets whether the [RadialController](radialcontroller.md) object is bound to the main application process rather than a specific app view (or top-level window). 
     * 
     * If AppController is set, that radial controller (and menu) is used for the top-level window and all views in the application process (overriding any individual view controllers you have defined). 
     * 
     * > [!NOTE]
     * > You must also set [IsAppControllerEnabled](radialcontrollerconfiguration_isappcontrollerenabled.md) to **true**.
     * @remarks
     * We recommend creating an app controller in the [Loaded](/uwp/api/windows.ui.xaml.frameworkelement.Loaded) handler of your app's main page (or equivalent).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.appcontroller
     * @type {RadialController} 
     */
    static AppController {
        get => RadialControllerConfiguration.get_AppController()
        set => RadialControllerConfiguration.put_AppController(value)
    }

    /**
     * Gets or sets whether the [RadialController](radialcontroller.md) object is enabled as an  [AppController](radialcontrollerconfiguration_appcontroller.md) and controller events can be handled by your app.
     * @remarks
     * If [AppController](radialcontrollerconfiguration_appcontroller.md) is set, that radial controller (and menu) is used for all top-level windows in the application process (all individual view controllers are overridden).
     * 
     * We recommend creating an app controller in the [Loaded](/uwp/api/windows.ui.xaml.frameworkelement.Loaded) handler of your app's main page (or equivalent).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.isappcontrollerenabled
     * @type {Boolean} 
     */
    static IsAppControllerEnabled {
        get => RadialControllerConfiguration.get_IsAppControllerEnabled()
        set => RadialControllerConfiguration.put_IsAppControllerEnabled(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [RadialControllerConfiguration](radialcontrollerconfiguration.md) object bound to the active application.
     * @returns {RadialControllerConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.getforcurrentview
     */
    static GetForCurrentView() {
        if (!RadialControllerConfiguration.HasProp("__IRadialControllerConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerConfigurationStatics.IID)
            RadialControllerConfiguration.__IRadialControllerConfigurationStatics := IRadialControllerConfigurationStatics(factoryPtr)
        }

        return RadialControllerConfiguration.__IRadialControllerConfigurationStatics.GetForCurrentView()
    }

    /**
     * 
     * @param {RadialController} value 
     * @returns {HRESULT} 
     */
    static put_AppController(value) {
        if (!RadialControllerConfiguration.HasProp("__IRadialControllerConfigurationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerConfigurationStatics2.IID)
            RadialControllerConfiguration.__IRadialControllerConfigurationStatics2 := IRadialControllerConfigurationStatics2(factoryPtr)
        }

        return RadialControllerConfiguration.__IRadialControllerConfigurationStatics2.put_AppController(value)
    }

    /**
     * 
     * @returns {RadialController} 
     */
    static get_AppController() {
        if (!RadialControllerConfiguration.HasProp("__IRadialControllerConfigurationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerConfigurationStatics2.IID)
            RadialControllerConfiguration.__IRadialControllerConfigurationStatics2 := IRadialControllerConfigurationStatics2(factoryPtr)
        }

        return RadialControllerConfiguration.__IRadialControllerConfigurationStatics2.get_AppController()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_IsAppControllerEnabled(value) {
        if (!RadialControllerConfiguration.HasProp("__IRadialControllerConfigurationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerConfigurationStatics2.IID)
            RadialControllerConfiguration.__IRadialControllerConfigurationStatics2 := IRadialControllerConfigurationStatics2(factoryPtr)
        }

        return RadialControllerConfiguration.__IRadialControllerConfigurationStatics2.put_IsAppControllerEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsAppControllerEnabled() {
        if (!RadialControllerConfiguration.HasProp("__IRadialControllerConfigurationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerConfigurationStatics2.IID)
            RadialControllerConfiguration.__IRadialControllerConfigurationStatics2 := IRadialControllerConfigurationStatics2(factoryPtr)
        }

        return RadialControllerConfiguration.__IRadialControllerConfigurationStatics2.get_IsAppControllerEnabled()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [RadialController](radialcontroller.md) to activate when the [RadialController](radialcontroller.md) menu is suppressed.
     * @remarks
     * When the menu is suppressed, the press-and-hold gesture does not cause it to be displayed.
     * 
     * Listen for the [ButtonHolding](radialcontroller_buttonholding.md) event to implement custom handling of the press-and-hold gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.activecontrollerwhenmenuissuppressed
     * @type {RadialController} 
     */
    ActiveControllerWhenMenuIsSuppressed {
        get => this.get_ActiveControllerWhenMenuIsSuppressed()
        set => this.put_ActiveControllerWhenMenuIsSuppressed(value)
    }

    /**
     * Gets or sets whether the [RadialController](radialcontroller.md) menu can be displayed.
     * @remarks
     * When the menu is suppressed, the press-and-hold gesture does not cause it to be displayed.
     * 
     * Listen for the [ButtonHolding](radialcontroller_buttonholding.md) event to implement custom handling of the press-and-hold gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.ismenusuppressed
     * @type {Boolean} 
     */
    IsMenuSuppressed {
        get => this.get_IsMenuSuppressed()
        set => this.put_IsMenuSuppressed(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Specifies which built-in tools are shown on the [RadialController](radialcontroller.md) menu.
     * 
     * > [!IMPORTANT]
     * > When present, the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) adds two custom tools to the [RadialController](radialcontroller.md) menu (pen and stroke size). These tools are not accessible through [RadialController](radialcontroller.md) APIs such as [Items](radialcontrollermenu_items.md) or SetDefaultMenuItems.
     * @remarks
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), SetDefaultMenuItems, and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * @param {IIterable<Integer>} buttons The default set of commands ([RadialControllerSystemMenuItemKind](radialcontrollersystemmenuitemkind.md)) available on a [RadialController](radialcontroller.md) menu.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.setdefaultmenuitems
     */
    SetDefaultMenuItems(buttons) {
        if (!this.HasProp("__IRadialControllerConfiguration")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration := IRadialControllerConfiguration(outPtr)
        }

        return this.__IRadialControllerConfiguration.SetDefaultMenuItems(buttons)
    }

    /**
     * Restores the [RadialController](radialcontroller.md) menu to the default configuration.
     * @remarks
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), ResetToDefaultMenuItems, [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.resettodefaultmenuitems
     */
    ResetToDefaultMenuItems() {
        if (!this.HasProp("__IRadialControllerConfiguration")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration := IRadialControllerConfiguration(outPtr)
        }

        return this.__IRadialControllerConfiguration.ResetToDefaultMenuItems()
    }

    /**
     * Attempts to select and activate a tool from the collection of built-in [RadialController](radialcontroller.md) tools supported for the current app context.
     * @remarks
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and TrySelectDefaultMenuItem, should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * @param {Integer} type The built-in tool to select and activate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerconfiguration.tryselectdefaultmenuitem
     */
    TrySelectDefaultMenuItem(type) {
        if (!this.HasProp("__IRadialControllerConfiguration")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration := IRadialControllerConfiguration(outPtr)
        }

        return this.__IRadialControllerConfiguration.TrySelectDefaultMenuItem(type)
    }

    /**
     * 
     * @param {RadialController} value 
     * @returns {HRESULT} 
     */
    put_ActiveControllerWhenMenuIsSuppressed(value) {
        if (!this.HasProp("__IRadialControllerConfiguration2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration2 := IRadialControllerConfiguration2(outPtr)
        }

        return this.__IRadialControllerConfiguration2.put_ActiveControllerWhenMenuIsSuppressed(value)
    }

    /**
     * 
     * @returns {RadialController} 
     */
    get_ActiveControllerWhenMenuIsSuppressed() {
        if (!this.HasProp("__IRadialControllerConfiguration2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration2 := IRadialControllerConfiguration2(outPtr)
        }

        return this.__IRadialControllerConfiguration2.get_ActiveControllerWhenMenuIsSuppressed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMenuSuppressed(value) {
        if (!this.HasProp("__IRadialControllerConfiguration2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration2 := IRadialControllerConfiguration2(outPtr)
        }

        return this.__IRadialControllerConfiguration2.put_IsMenuSuppressed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMenuSuppressed() {
        if (!this.HasProp("__IRadialControllerConfiguration2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerConfiguration2 := IRadialControllerConfiguration2(outPtr)
        }

        return this.__IRadialControllerConfiguration2.get_IsMenuSuppressed()
    }

;@endregion Instance Methods
}
