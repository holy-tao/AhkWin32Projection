#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTabIcon.ahk
#Include .\IWindowTabIconStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the icon that the system displays for a window tab.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabicon
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabIcon extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabIcon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabIcon.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an icon from the provided glyph, font family, and font URI.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {HSTRING} glyph The character code that identifies the icon glyph.
     * @param {HSTRING} fontFamily_ The font used to display the icon glyph.
     * @returns {WindowTabIcon} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabicon.createfromfontglyph
     */
    static CreateFromFontGlyph(glyph, fontFamily_) {
        if (!WindowTabIcon.HasProp("__IWindowTabIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowTabIconStatics.IID)
            WindowTabIcon.__IWindowTabIconStatics := IWindowTabIconStatics(factoryPtr)
        }

        return WindowTabIcon.__IWindowTabIconStatics.CreateFromFontGlyph(glyph, fontFamily_)
    }

    /**
     * Creates an icon from the provided glyph and font family.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {HSTRING} glyph The character code that identifies the icon glyph.
     * @param {HSTRING} fontFamily_ The font used to display the icon glyph.
     * @param {Uri} fontUri 
     * @returns {WindowTabIcon} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabicon.createfromfontglyph
     */
    static CreateFromFontGlyphWithUri(glyph, fontFamily_, fontUri) {
        if (!WindowTabIcon.HasProp("__IWindowTabIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowTabIconStatics.IID)
            WindowTabIcon.__IWindowTabIconStatics := IWindowTabIconStatics(factoryPtr)
        }

        return WindowTabIcon.__IWindowTabIconStatics.CreateFromFontGlyphWithUri(glyph, fontFamily_, fontUri)
    }

    /**
     * Creates the icon from the provided image stream.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @param {IRandomAccessStreamReference} image_ The image stream from which to create the icon.
     * @returns {WindowTabIcon} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabicon.createfromimage
     */
    static CreateFromImage(image_) {
        if (!WindowTabIcon.HasProp("__IWindowTabIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowTabIconStatics.IID)
            WindowTabIcon.__IWindowTabIconStatics := IWindowTabIconStatics(factoryPtr)
        }

        return WindowTabIcon.__IWindowTabIconStatics.CreateFromImage(image_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
