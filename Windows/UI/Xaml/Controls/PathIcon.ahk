#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IconElement.ahk
#Include .\IPathIcon.ahk
#Include .\IPathIconStatics.ahk
#Include .\IPathIconFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an icon that uses a vector path as its content.
 * @remarks
 * > [!NOTE]
 * > You can set the **Foreground** property on the [AppBarButton](appbarbutton.md) or on the PathIcon. If you set the [Foreground](control_foreground.md) on the [AppBarButton](appbarbutton.md), it's applied only to the default visual state. It's not applied to the other visual states defined in the [AppBarButton](appbarbutton.md) template, like `MouseOver`. If you set the [Foreground](iconelement_foreground.md) on the PathIcon, the color is applied to all visual states.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pathicon
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PathIcon extends IconElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPathIcon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPathIcon.IID

    /**
     * Identifies the [Data](pathicon_data.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pathicon.dataproperty
     * @type {DependencyProperty} 
     */
    static DataProperty {
        get => PathIcon.get_DataProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataProperty() {
        if (!PathIcon.HasProp("__IPathIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PathIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIconStatics.IID)
            PathIcon.__IPathIconStatics := IPathIconStatics(factoryPtr)
        }

        return PathIcon.__IPathIconStatics.get_DataProperty()
    }

    /**
     * 
     * @returns {PathIcon} 
     */
    static CreateInstance() {
        if (!PathIcon.HasProp("__IPathIconFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PathIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIconFactory.IID)
            PathIcon.__IPathIconFactory := IPathIconFactory(factoryPtr)
        }

        return PathIcon.__IPathIconFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a [Geometry](../windows.ui.xaml.media/geometry.md) that specifies the shape to be drawn. In XAML. this can also be set using a string that describes [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pathicon.data
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
        if (!this.HasProp("__IPathIcon")) {
            if ((queryResult := this.QueryInterface(IPathIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathIcon := IPathIcon(outPtr)
        }

        return this.__IPathIcon.get_Data()
    }

    /**
     * 
     * @param {Geometry} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IPathIcon")) {
            if ((queryResult := this.QueryInterface(IPathIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathIcon := IPathIcon(outPtr)
        }

        return this.__IPathIcon.put_Data(value)
    }

;@endregion Instance Methods
}
