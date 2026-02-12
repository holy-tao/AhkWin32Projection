#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapModel3D.ahk
#Include .\IMapModel3DFactory.ahk
#Include .\IMapModel3DStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a 3D object to show on a map.  A MapModel3D is primarily used in conjunction with [MapElement3D](mapelement3d.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapmodel3d
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapModel3D extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapModel3D

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapModel3D.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MapModel3D} 
     */
    static CreateInstance() {
        if (!MapModel3D.HasProp("__IMapModel3DFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapModel3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapModel3DFactory.IID)
            MapModel3D.__IMapModel3DFactory := IMapModel3DFactory(factoryPtr)
        }

        return MapModel3D.__IMapModel3DFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * Creates an instance of a [MapModel3D](mapmodel3d.md) by importing a 3D object from a [3D Manufacturing Format (3MF)](https://3mf.io/spec/) file.
     * @remarks
     * Set the [Model](mapelement3d_model.md) property of the [MapElement3D](mapelement3d.md) to this object.
     * @param {IRandomAccessStreamReference} source A [3D Manufacturing Format (3MF) file](https://3mf.io/spec/) file that describes a 3D object.
     * @returns {IAsyncOperation<MapModel3D>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapmodel3d.createfrom3mfasync
     */
    static CreateFrom3MFAsync(source) {
        if (!MapModel3D.HasProp("__IMapModel3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapModel3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapModel3DStatics.IID)
            MapModel3D.__IMapModel3DStatics := IMapModel3DStatics(factoryPtr)
        }

        return MapModel3D.__IMapModel3DStatics.CreateFrom3MFAsync(source)
    }

    /**
     * Creates an instance of a [MapModel3D](mapmodel3d.md) by importing a 3D object from a [3D Manufacturing Format (3MF)](https://3mf.io/spec/) file.
     * @remarks
     * Set the [Model](mapelement3d_model.md) property of the [MapElement3D](mapelement3d.md) to this object.
     * @param {IRandomAccessStreamReference} source A [3D Manufacturing Format (3MF) file](https://3mf.io/spec/) file that describes a 3D object.
     * @param {Integer} shadingOption 
     * @returns {IAsyncOperation<MapModel3D>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapmodel3d.createfrom3mfasync
     */
    static CreateFrom3MFWithShadingOptionAsync(source, shadingOption) {
        if (!MapModel3D.HasProp("__IMapModel3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapModel3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapModel3DStatics.IID)
            MapModel3D.__IMapModel3DStatics := IMapModel3DStatics(factoryPtr)
        }

        return MapModel3D.__IMapModel3DStatics.CreateFrom3MFWithShadingOptionAsync(source, shadingOption)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
