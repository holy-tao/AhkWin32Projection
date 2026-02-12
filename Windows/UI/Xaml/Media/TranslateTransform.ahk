#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\ITranslateTransform.ahk
#Include .\ITranslateTransformStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Translates (moves) an object in the two-dimensional x-y coordinate system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.translatetransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class TranslateTransform extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITranslateTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITranslateTransform.IID

    /**
     * Identifies the [X](translatetransform_x.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.translatetransform.xproperty
     * @type {DependencyProperty} 
     */
    static XProperty {
        get => TranslateTransform.get_XProperty()
    }

    /**
     * Identifies the [Y](translatetransform_y.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.translatetransform.yproperty
     * @type {DependencyProperty} 
     */
    static YProperty {
        get => TranslateTransform.get_YProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_XProperty() {
        if (!TranslateTransform.HasProp("__ITranslateTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TranslateTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITranslateTransformStatics.IID)
            TranslateTransform.__ITranslateTransformStatics := ITranslateTransformStatics(factoryPtr)
        }

        return TranslateTransform.__ITranslateTransformStatics.get_XProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_YProperty() {
        if (!TranslateTransform.HasProp("__ITranslateTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TranslateTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITranslateTransformStatics.IID)
            TranslateTransform.__ITranslateTransformStatics := ITranslateTransformStatics(factoryPtr)
        }

        return TranslateTransform.__ITranslateTransformStatics.get_YProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the distance to translate along the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.translatetransform.x
     * @type {Float} 
     */
    X {
        get => this.get_X()
        set => this.put_X(value)
    }

    /**
     * Gets or sets the distance to translate (move) an object along the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.translatetransform.y
     * @type {Float} 
     */
    Y {
        get => this.get_Y()
        set => this.put_Y(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TranslateTransform](translatetransform.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TranslateTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_X() {
        if (!this.HasProp("__ITranslateTransform")) {
            if ((queryResult := this.QueryInterface(ITranslateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITranslateTransform := ITranslateTransform(outPtr)
        }

        return this.__ITranslateTransform.get_X()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_X(value) {
        if (!this.HasProp("__ITranslateTransform")) {
            if ((queryResult := this.QueryInterface(ITranslateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITranslateTransform := ITranslateTransform(outPtr)
        }

        return this.__ITranslateTransform.put_X(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Y() {
        if (!this.HasProp("__ITranslateTransform")) {
            if ((queryResult := this.QueryInterface(ITranslateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITranslateTransform := ITranslateTransform(outPtr)
        }

        return this.__ITranslateTransform.get_Y()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Y(value) {
        if (!this.HasProp("__ITranslateTransform")) {
            if ((queryResult := this.QueryInterface(ITranslateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITranslateTransform := ITranslateTransform(outPtr)
        }

        return this.__ITranslateTransform.put_Y(value)
    }

;@endregion Instance Methods
}
