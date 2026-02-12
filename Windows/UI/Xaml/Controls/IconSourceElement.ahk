#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconElement.ahk
#Include .\IIconSourceElement.ahk
#Include .\IIconSourceElementFactory.ahk
#Include .\IIconSourceElementStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon that uses an IconSource as its content.
 * @remarks
 * [IconSource](iconsource.md) is similar to [IconElement](iconelement.md). However, because it is not a [FrameworkElement](/uwp/api/windows.ui.xaml.frameworkelement), it can be shared.
 * 
 * `IconSourceElement` provides a wrapper that lets you use an `IconSource` in places that require an `IconElement`. For example, the [AppBarButton.Icon](appbarbutton_icon.md) property takes an `IconElement`. You can use an `IconSource` derived class as the icon like this:
 * 
 * ```xaml
 * <AppBarButton Label="Accept">
 *     <AppBarButton.Icon>
 *         <IconSourceElement>
 *             <IconSourceElement.IconSource>
 *                 <SymbolIconSource Symbol="Accept"/>
 *             </IconSourceElement.IconSource>
 *         </IconSourceElement>
 *     </AppBarButton.Icon>
 * </AppBarButton>
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconsourceelement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IconSourceElement extends IconElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIconSourceElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIconSourceElement.IID

    /**
     * Identifies the IconSource dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconsourceelement.iconsourceproperty
     * @type {DependencyProperty} 
     */
    static IconSourceProperty {
        get => IconSourceElement.get_IconSourceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IconSourceElement} 
     */
    static CreateInstance() {
        if (!IconSourceElement.HasProp("__IIconSourceElementFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.IconSourceElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIconSourceElementFactory.IID)
            IconSourceElement.__IIconSourceElementFactory := IIconSourceElementFactory(factoryPtr)
        }

        return IconSourceElement.__IIconSourceElementFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconSourceProperty() {
        if (!IconSourceElement.HasProp("__IIconSourceElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.IconSourceElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIconSourceElementStatics.IID)
            IconSourceElement.__IIconSourceElementStatics := IIconSourceElementStatics(factoryPtr)
        }

        return IconSourceElement.__IIconSourceElementStatics.get_IconSourceProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the IconSource used as the icon content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iconsourceelement.iconsource
     * @type {IconSource} 
     */
    IconSource {
        get => this.get_IconSource()
        set => this.put_IconSource(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IconSource} 
     */
    get_IconSource() {
        if (!this.HasProp("__IIconSourceElement")) {
            if ((queryResult := this.QueryInterface(IIconSourceElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIconSourceElement := IIconSourceElement(outPtr)
        }

        return this.__IIconSourceElement.get_IconSource()
    }

    /**
     * 
     * @param {IconSource} value 
     * @returns {HRESULT} 
     */
    put_IconSource(value) {
        if (!this.HasProp("__IIconSourceElement")) {
            if ((queryResult := this.QueryInterface(IIconSourceElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIconSourceElement := IIconSourceElement(outPtr)
        }

        return this.__IIconSourceElement.put_IconSource(value)
    }

;@endregion Instance Methods
}
