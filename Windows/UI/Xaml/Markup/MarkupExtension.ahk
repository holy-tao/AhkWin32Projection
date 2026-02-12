#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMarkupExtension.ahk
#Include .\IMarkupExtensionOverrides.ahk
#Include .\IMarkupExtensionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for XAML markup extension implementations.
 * @remarks
 * For examples of custom markup extensions, see the [markup extensions in the Windows Community Toolkit](https://github.com/windows-toolkit/WindowsCommunityToolkit/tree/master/Microsoft.Toolkit.Uwp.UI/Extensions/Markup) repo.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.markupextension
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class MarkupExtension extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMarkupExtension

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMarkupExtension.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MarkupExtension} 
     */
    static CreateInstance() {
        if (!MarkupExtension.HasProp("__IMarkupExtensionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Markup.MarkupExtension")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMarkupExtensionFactory.IID)
            MarkupExtension.__IMarkupExtensionFactory := IMarkupExtensionFactory(factoryPtr)
        }

        return MarkupExtension.__IMarkupExtensionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * When implemented in a derived class, returns an object that is provided as the value of the target property for this markup extension.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.markupextension.providevalue
     */
    ProvideValue() {
        if (!this.HasProp("__IMarkupExtensionOverrides")) {
            if ((queryResult := this.QueryInterface(IMarkupExtensionOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMarkupExtensionOverrides := IMarkupExtensionOverrides(outPtr)
        }

        return this.__IMarkupExtensionOverrides.ProvideValue()
    }

;@endregion Instance Methods
}
