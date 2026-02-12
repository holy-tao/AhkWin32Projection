#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconSource.ahk
#Include .\IPathIconSource.ahk
#Include .\IPathIconSourceStatics.ahk
#Include .\IPathIconSourceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon source that uses a vector path as its content.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PathIconSource](/windows/winui/api/microsoft.ui.xaml.controls.pathiconsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * **PathIconSource** is similar to [PathIcon](pathicon.md). However, because it is not a [FrameworkElement](../windows.ui.xaml/frameworkelement.md), it can be shared.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pathiconsource
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PathIconSource extends IconSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPathIconSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPathIconSource.IID

    /**
     * Identifies the Data dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PathIconSource.DataProperty](/windows/winui/api/microsoft.ui.xaml.controls.pathiconsource.dataproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pathiconsource.dataproperty
     * @type {DependencyProperty} 
     */
    static DataProperty {
        get => PathIconSource.get_DataProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataProperty() {
        if (!PathIconSource.HasProp("__IPathIconSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PathIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIconSourceStatics.IID)
            PathIconSource.__IPathIconSourceStatics := IPathIconSourceStatics(factoryPtr)
        }

        return PathIconSource.__IPathIconSourceStatics.get_DataProperty()
    }

    /**
     * 
     * @returns {PathIconSource} 
     */
    static CreateInstance() {
        if (!PathIconSource.HasProp("__IPathIconSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PathIconSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIconSourceFactory.IID)
            PathIconSource.__IPathIconSourceFactory := IPathIconSourceFactory(factoryPtr)
        }

        return PathIconSource.__IPathIconSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a [Geometry](../windows.ui.xaml.media/geometry.md) that specifies the shape to be drawn. In XAML. this can also be set using a string that describes [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PathIconSource.Data](/windows/winui/api/microsoft.ui.xaml.controls.pathiconsource.data) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pathiconsource.data
     * @type {Geometry} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geometry} 
     */
    get_Data() {
        if (!this.HasProp("__IPathIconSource")) {
            if ((queryResult := this.QueryInterface(IPathIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathIconSource := IPathIconSource(outPtr)
        }

        return this.__IPathIconSource.get_Data()
    }

    /**
     * 
     * @param {Geometry} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IPathIconSource")) {
            if ((queryResult := this.QueryInterface(IPathIconSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathIconSource := IPathIconSource(outPtr)
        }

        return this.__IPathIconSource.put_Data(value)
    }

;@endregion Instance Methods
}
