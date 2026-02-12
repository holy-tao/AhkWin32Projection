#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shape.ahk
#Include .\IPath.ahk
#Include .\IPathStatics.ahk
#Include .\IPathFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws a series of connected lines and curves. The line and curve dimensions are declared through the [Data](path_data.md) property, and can be specified either with [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax), or with an object model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.path
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Path extends Shape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPath

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPath.IID

    /**
     * Identifies the [Data](path_data.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.path.dataproperty
     * @type {DependencyProperty} 
     */
    static DataProperty {
        get => Path.get_DataProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataProperty() {
        if (!Path.HasProp("__IPathStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Path")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathStatics.IID)
            Path.__IPathStatics := IPathStatics(factoryPtr)
        }

        return Path.__IPathStatics.get_DataProperty()
    }

    /**
     * 
     * @returns {Path} 
     */
    static CreateInstance() {
        if (!Path.HasProp("__IPathFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Path")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathFactory.IID)
            Path.__IPathFactory := IPathFactory(factoryPtr)
        }

        return Path.__IPathFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a [Geometry](../windows.ui.xaml.media/geometry.md) that specifies the shape to be drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.path.data
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
        if (!this.HasProp("__IPath")) {
            if ((queryResult := this.QueryInterface(IPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPath := IPath(outPtr)
        }

        return this.__IPath.get_Data()
    }

    /**
     * 
     * @param {Geometry} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IPath")) {
            if ((queryResult := this.QueryInterface(IPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPath := IPath(outPtr)
        }

        return this.__IPath.put_Data(value)
    }

;@endregion Instance Methods
}
