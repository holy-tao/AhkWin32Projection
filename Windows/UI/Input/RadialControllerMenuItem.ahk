#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerMenuItem.ahk
#Include .\IRadialControllerMenuItemStatics2.ahk
#Include .\IRadialControllerMenuItemStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RadialControllerMenuItem.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a single custom tool from the [RadialController](radialcontroller.md) menu.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerMenuItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerMenuItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerMenuItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a custom tool (using the specified text string and font glyph) on the [RadialController](radialcontroller.md) menu.
     * @remarks
     * When using this method overload to reference a font glyph installed with your app's appx package, your app might display a broken image when deployed from Visual Studio. In this case, you should first create an app package (**Project->Store->CreateAppPackage**) and then deploy.
     * 
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), CreateFromFontGlyph, [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * 
     * [UX guidelines](/windows/uwp/input-and-devices/windows-wheel-interactions) for the Surface Dial recommend the following:
     * 
     * + **Text**
     *   + Names should be short to fit inside the central circle of the wheel menu
     *   + Names should clearly identify the primary action (a complementary action can be implied)   
     *   + Scroll indicates the effect of both rotation directions
     *   + Undo specifies a primary action, but redo (the complementary action) can be inferred and easily discovered by the user
     * @param {HSTRING} displayText The text string to display for the custom tool.
     * @param {HSTRING} glyph The font glyph to display for the custom tool.
     * @param {HSTRING} fontFamily_ The font family that contains the glyph to display for the custom tool.
     * @returns {RadialControllerMenuItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem.createfromfontglyph
     */
    static CreateFromFontGlyph(displayText, glyph, fontFamily_) {
        if (!RadialControllerMenuItem.HasProp("__IRadialControllerMenuItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerMenuItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerMenuItemStatics2.IID)
            RadialControllerMenuItem.__IRadialControllerMenuItemStatics2 := IRadialControllerMenuItemStatics2(factoryPtr)
        }

        return RadialControllerMenuItem.__IRadialControllerMenuItemStatics2.CreateFromFontGlyph(displayText, glyph, fontFamily_)
    }

    /**
     * Creates a custom tool (using the specified text string and font glyph) on the [RadialController](radialcontroller.md) menu.
     * @remarks
     * Use this method overload when you referencing a font already installed on the system. Otherwise, use [CreateFromFontGlyph(String displayText, String glyph, String fontFamily, Uri fontUri)](radialcontrollermenuitem_createfromfontglyph_679326837.md).
     * 
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), CreateFromFontGlyph, [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * 
     * [UX guidelines](/windows/uwp/input-and-devices/windows-wheel-interactions) for the Surface Dial recommend the following:
     * 
     * + **Text**
     *   + Names should be short to fit inside the central circle of the wheel menu
     *   + Names should clearly identify the primary action (a complementary action can be implied)   
     *   + Scroll indicates the effect of both rotation directions
     *   + Undo specifies a primary action, but redo (the complementary action) can be inferred and easily discovered by the user
     * @param {HSTRING} displayText The text string to display for the custom tool.
     * @param {HSTRING} glyph The font glyph to display for the custom tool.
     * @param {HSTRING} fontFamily_ The font family that contains the glyph to display for the custom tool.
     * @param {Uri} fontUri 
     * @returns {RadialControllerMenuItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem.createfromfontglyph
     */
    static CreateFromFontGlyphWithUri(displayText, glyph, fontFamily_, fontUri) {
        if (!RadialControllerMenuItem.HasProp("__IRadialControllerMenuItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerMenuItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerMenuItemStatics2.IID)
            RadialControllerMenuItem.__IRadialControllerMenuItemStatics2 := IRadialControllerMenuItemStatics2(factoryPtr)
        }

        return RadialControllerMenuItem.__IRadialControllerMenuItemStatics2.CreateFromFontGlyphWithUri(displayText, glyph, fontFamily_, fontUri)
    }

    /**
     * Creates a custom tool (using the specified text string and custom icon) on the [RadialController](radialcontroller.md) menu.
     * @remarks
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), CreateFromIcon, [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * 
     * [UX guidelines](/windows/uwp/input-and-devices/windows-wheel-interactions) for the Surface Dial recommend the following:
     * 
     * **Text**
     * + Names should be short to fit inside the central circle of the wheel menu
     * + Names should clearly identify the primary action (a complementary action can be implied)   
     * + Scroll indicates the effect of both rotation directions
     * + Undo specifies a primary action, but redo (the complementary action) can be inferred and easily discovered by the user
     * 
     * **Icons**
     * + Provide a high-quality 64 x 64 pixel PNG image (44 x 44 is the smallest supported)
     * + Ensure the background is transparent
     * + The icon should fill most of the image
     * + A white icon should have a black outline to be visible in high contrast mode
     * @param {HSTRING} displayText The text string to display for the custom tool.
     * @param {RandomAccessStreamReference} icon The custom icon to display for the custom tool.
     * @returns {RadialControllerMenuItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem.createfromicon
     */
    static CreateFromIcon(displayText, icon) {
        if (!RadialControllerMenuItem.HasProp("__IRadialControllerMenuItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerMenuItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerMenuItemStatics.IID)
            RadialControllerMenuItem.__IRadialControllerMenuItemStatics := IRadialControllerMenuItemStatics(factoryPtr)
        }

        return RadialControllerMenuItem.__IRadialControllerMenuItemStatics.CreateFromIcon(displayText, icon)
    }

    /**
     * Creates a custom tool (using the specified text string and system icon) on the [RadialController](radialcontroller.md) menu.
     * @remarks
     * [RadialController](radialcontroller.md) menu operations, including CreateFromKnownIcon, [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * 
     * [UX guidelines](/windows/uwp/input-and-devices/windows-wheel-interactions) for the Surface Dial recommend the following:
     * 
     * **Text**
     * + Names should be short to fit inside the central circle of the wheel menu
     * + Names should clearly identify the primary action (a complementary action can be implied)   
     * + Scroll indicates the effect of both rotation directions
     * + Undo specifies a primary action, but redo (the complementary action) can be inferred and easily discovered by the user
     * @param {HSTRING} displayText The text string to display for the custom tool.
     * @param {Integer} value The system icon to display for the custom tool.
     * @returns {RadialControllerMenuItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem.createfromknownicon
     */
    static CreateFromKnownIcon(displayText, value) {
        if (!RadialControllerMenuItem.HasProp("__IRadialControllerMenuItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialControllerMenuItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerMenuItemStatics.IID)
            RadialControllerMenuItem.__IRadialControllerMenuItemStatics := IRadialControllerMenuItemStatics(factoryPtr)
        }

        return RadialControllerMenuItem.__IRadialControllerMenuItemStatics.CreateFromKnownIcon(displayText, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the text string of the custom tool on the [RadialController](radialcontroller.md) menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * Gets or sets an object used to identify custom tools on the [RadialController](radialcontroller.md) menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuitem.tag
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Occurs when a custom tool is selected from the [RadialController](radialcontroller.md) menu.
     * @type {TypedEventHandler<RadialControllerMenuItem, IInspectable>}
    */
    OnInvoked {
        get {
            if(!this.HasProp("__OnInvoked")){
                this.__OnInvoked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5c90d6fb-e4f8-5be2-8544-9de33f82c41a}"),
                    RadialControllerMenuItem,
                    IInspectable
                )
                this.__OnInvokedToken := this.add_Invoked(this.__OnInvoked.iface)
            }
            return this.__OnInvoked
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInvokedToken")) {
            this.remove_Invoked(this.__OnInvokedToken)
            this.__OnInvoked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        if (!this.HasProp("__IRadialControllerMenuItem")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenuItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenuItem := IRadialControllerMenuItem(outPtr)
        }

        return this.__IRadialControllerMenuItem.get_DisplayText()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        if (!this.HasProp("__IRadialControllerMenuItem")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenuItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenuItem := IRadialControllerMenuItem(outPtr)
        }

        return this.__IRadialControllerMenuItem.get_Tag()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IRadialControllerMenuItem")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenuItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenuItem := IRadialControllerMenuItem(outPtr)
        }

        return this.__IRadialControllerMenuItem.put_Tag(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialControllerMenuItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Invoked(handler) {
        if (!this.HasProp("__IRadialControllerMenuItem")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenuItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenuItem := IRadialControllerMenuItem(outPtr)
        }

        return this.__IRadialControllerMenuItem.add_Invoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Invoked(token) {
        if (!this.HasProp("__IRadialControllerMenuItem")) {
            if ((queryResult := this.QueryInterface(IRadialControllerMenuItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerMenuItem := IRadialControllerMenuItem(outPtr)
        }

        return this.__IRadialControllerMenuItem.remove_Invoked(token)
    }

;@endregion Instance Methods
}
