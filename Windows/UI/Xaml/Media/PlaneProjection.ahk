#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Projection.ahk
#Include .\IPlaneProjection.ahk
#Include .\IPlaneProjectionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a perspective transform (a 3-D-like effect) on an object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PlaneProjection extends Projection {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaneProjection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaneProjection.IID

    /**
     * Identifies the [LocalOffsetX](planeprojection_localoffsetx.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.localoffsetxproperty
     * @type {DependencyProperty} 
     */
    static LocalOffsetXProperty {
        get => PlaneProjection.get_LocalOffsetXProperty()
    }

    /**
     * Identifies the [LocalOffsetY](planeprojection_localoffsety.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.localoffsetyproperty
     * @type {DependencyProperty} 
     */
    static LocalOffsetYProperty {
        get => PlaneProjection.get_LocalOffsetYProperty()
    }

    /**
     * Identifies the [LocalOffsetZ](planeprojection_localoffsetz.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.localoffsetzproperty
     * @type {DependencyProperty} 
     */
    static LocalOffsetZProperty {
        get => PlaneProjection.get_LocalOffsetZProperty()
    }

    /**
     * Identifies the [RotationX](planeprojection_rotationx.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.rotationxproperty
     * @type {DependencyProperty} 
     */
    static RotationXProperty {
        get => PlaneProjection.get_RotationXProperty()
    }

    /**
     * Identifies the [RotationY](planeprojection_rotationy.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.rotationyproperty
     * @type {DependencyProperty} 
     */
    static RotationYProperty {
        get => PlaneProjection.get_RotationYProperty()
    }

    /**
     * Identifies the [RotationZ](planeprojection_rotationz.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.rotationzproperty
     * @type {DependencyProperty} 
     */
    static RotationZProperty {
        get => PlaneProjection.get_RotationZProperty()
    }

    /**
     * Identifies the [CenterOfRotationX](planeprojection_centerofrotationx.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.centerofrotationxproperty
     * @type {DependencyProperty} 
     */
    static CenterOfRotationXProperty {
        get => PlaneProjection.get_CenterOfRotationXProperty()
    }

    /**
     * Identifies the [CenterOfRotationY](planeprojection_centerofrotationy.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.centerofrotationyproperty
     * @type {DependencyProperty} 
     */
    static CenterOfRotationYProperty {
        get => PlaneProjection.get_CenterOfRotationYProperty()
    }

    /**
     * Identifies the [CenterOfRotationZ](planeprojection_centerofrotationz.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.centerofrotationzproperty
     * @type {DependencyProperty} 
     */
    static CenterOfRotationZProperty {
        get => PlaneProjection.get_CenterOfRotationZProperty()
    }

    /**
     * Identifies the [GlobalOffsetX](planeprojection_globaloffsetx.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.globaloffsetxproperty
     * @type {DependencyProperty} 
     */
    static GlobalOffsetXProperty {
        get => PlaneProjection.get_GlobalOffsetXProperty()
    }

    /**
     * Identifies the [GlobalOffsetY](planeprojection_globaloffsety.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.globaloffsetyproperty
     * @type {DependencyProperty} 
     */
    static GlobalOffsetYProperty {
        get => PlaneProjection.get_GlobalOffsetYProperty()
    }

    /**
     * Identifies the [GlobalOffsetZ](planeprojection_globaloffsetz.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.globaloffsetzproperty
     * @type {DependencyProperty} 
     */
    static GlobalOffsetZProperty {
        get => PlaneProjection.get_GlobalOffsetZProperty()
    }

    /**
     * Identifies the [ProjectionMatrix](planeprojection_projectionmatrix.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.projectionmatrixproperty
     * @type {DependencyProperty} 
     */
    static ProjectionMatrixProperty {
        get => PlaneProjection.get_ProjectionMatrixProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocalOffsetXProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_LocalOffsetXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocalOffsetYProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_LocalOffsetYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocalOffsetZProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_LocalOffsetZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationXProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_RotationXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationYProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_RotationYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationZProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_RotationZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterOfRotationXProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_CenterOfRotationXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterOfRotationYProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_CenterOfRotationYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterOfRotationZProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_CenterOfRotationZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlobalOffsetXProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_GlobalOffsetXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlobalOffsetYProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_GlobalOffsetYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GlobalOffsetZProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_GlobalOffsetZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProjectionMatrixProperty() {
        if (!PlaneProjection.HasProp("__IPlaneProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaneProjectionStatics.IID)
            PlaneProjection.__IPlaneProjectionStatics := IPlaneProjectionStatics(factoryPtr)
        }

        return PlaneProjection.__IPlaneProjectionStatics.get_ProjectionMatrixProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the distance that the object is translated along the x-axis of the plane of the object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.localoffsetx
     * @type {Float} 
     */
    LocalOffsetX {
        get => this.get_LocalOffsetX()
        set => this.put_LocalOffsetX(value)
    }

    /**
     * Gets or sets the distance that the object is translated along the y-axis of the plane of the object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.localoffsety
     * @type {Float} 
     */
    LocalOffsetY {
        get => this.get_LocalOffsetY()
        set => this.put_LocalOffsetY(value)
    }

    /**
     * Gets or sets the distance that the object is translated along the z-axis of the plane of the object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.localoffsetz
     * @type {Float} 
     */
    LocalOffsetZ {
        get => this.get_LocalOffsetZ()
        set => this.put_LocalOffsetZ(value)
    }

    /**
     * Gets or sets the number of degrees to rotate the object around the x-axis of rotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.rotationx
     * @type {Float} 
     */
    RotationX {
        get => this.get_RotationX()
        set => this.put_RotationX(value)
    }

    /**
     * Gets or sets the number of degrees to rotate the object around the y-axis of rotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.rotationy
     * @type {Float} 
     */
    RotationY {
        get => this.get_RotationY()
        set => this.put_RotationY(value)
    }

    /**
     * Gets or sets the number of degrees to rotate the object around the z-axis of rotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.rotationz
     * @type {Float} 
     */
    RotationZ {
        get => this.get_RotationZ()
        set => this.put_RotationZ(value)
    }

    /**
     * Gets or sets the x-coordinate of the center of rotation of the object that you rotate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.centerofrotationx
     * @type {Float} 
     */
    CenterOfRotationX {
        get => this.get_CenterOfRotationX()
        set => this.put_CenterOfRotationX(value)
    }

    /**
     * Gets or sets the y-coordinate of the center of rotation of the object that you rotate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.centerofrotationy
     * @type {Float} 
     */
    CenterOfRotationY {
        get => this.get_CenterOfRotationY()
        set => this.put_CenterOfRotationY(value)
    }

    /**
     * Gets or sets the z-coordinate of the center of rotation of the object that you rotate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.centerofrotationz
     * @type {Float} 
     */
    CenterOfRotationZ {
        get => this.get_CenterOfRotationZ()
        set => this.put_CenterOfRotationZ(value)
    }

    /**
     * Gets or sets the distance that the object is translated along the x-axis of the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.globaloffsetx
     * @type {Float} 
     */
    GlobalOffsetX {
        get => this.get_GlobalOffsetX()
        set => this.put_GlobalOffsetX(value)
    }

    /**
     * Gets or sets the distance that the object is translated along the y-axis of the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.globaloffsety
     * @type {Float} 
     */
    GlobalOffsetY {
        get => this.get_GlobalOffsetY()
        set => this.put_GlobalOffsetY(value)
    }

    /**
     * Gets or sets the distance that the object is translated along the z-axis of the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.globaloffsetz
     * @type {Float} 
     */
    GlobalOffsetZ {
        get => this.get_GlobalOffsetZ()
        set => this.put_GlobalOffsetZ(value)
    }

    /**
     * Gets the projection matrix of the [PlaneProjection](planeprojection.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.planeprojection.projectionmatrix
     * @type {Matrix3D} 
     */
    ProjectionMatrix {
        get => this.get_ProjectionMatrix()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PlaneProjection](planeprojection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PlaneProjection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LocalOffsetX() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_LocalOffsetX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LocalOffsetX(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_LocalOffsetX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LocalOffsetY() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_LocalOffsetY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LocalOffsetY(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_LocalOffsetY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LocalOffsetZ() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_LocalOffsetZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LocalOffsetZ(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_LocalOffsetZ(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationX() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_RotationX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationX(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_RotationX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationY() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_RotationY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationY(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_RotationY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationZ() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_RotationZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationZ(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_RotationZ(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterOfRotationX() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_CenterOfRotationX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterOfRotationX(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_CenterOfRotationX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterOfRotationY() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_CenterOfRotationY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterOfRotationY(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_CenterOfRotationY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterOfRotationZ() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_CenterOfRotationZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterOfRotationZ(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_CenterOfRotationZ(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalOffsetX() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_GlobalOffsetX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlobalOffsetX(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_GlobalOffsetX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalOffsetY() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_GlobalOffsetY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlobalOffsetY(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_GlobalOffsetY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalOffsetZ() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_GlobalOffsetZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlobalOffsetZ(value) {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.put_GlobalOffsetZ(value)
    }

    /**
     * 
     * @returns {Matrix3D} 
     */
    get_ProjectionMatrix() {
        if (!this.HasProp("__IPlaneProjection")) {
            if ((queryResult := this.QueryInterface(IPlaneProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaneProjection := IPlaneProjection(outPtr)
        }

        return this.__IPlaneProjection.get_ProjectionMatrix()
    }

;@endregion Instance Methods
}
