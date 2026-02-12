#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\IAnimationPropertyInfo.ahk
#Include .\IAnimationPropertyInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about a property that can be animated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationpropertyinfo
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationPropertyInfo extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAnimationPropertyInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAnimationPropertyInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies how an animated property can be accessed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationpropertyinfo.accessmode
     * @type {Integer} 
     */
    AccessMode {
        get => this.get_AccessMode()
        set => this.put_AccessMode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccessMode() {
        if (!this.HasProp("__IAnimationPropertyInfo")) {
            if ((queryResult := this.QueryInterface(IAnimationPropertyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationPropertyInfo := IAnimationPropertyInfo(outPtr)
        }

        return this.__IAnimationPropertyInfo.get_AccessMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AccessMode(value) {
        if (!this.HasProp("__IAnimationPropertyInfo")) {
            if ((queryResult := this.QueryInterface(IAnimationPropertyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationPropertyInfo := IAnimationPropertyInfo(outPtr)
        }

        return this.__IAnimationPropertyInfo.put_AccessMode(value)
    }

    /**
     * Retrieves the composition object associated with the `AnimationPropertyInfo`.
     * @returns {CompositionObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationpropertyinfo.getresolvedcompositionobject
     */
    GetResolvedCompositionObject() {
        if (!this.HasProp("__IAnimationPropertyInfo2")) {
            if ((queryResult := this.QueryInterface(IAnimationPropertyInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationPropertyInfo2 := IAnimationPropertyInfo2(outPtr)
        }

        return this.__IAnimationPropertyInfo2.GetResolvedCompositionObject()
    }

    /**
     * Retrieves the animatable property from the composition object associated with the `AnimationPropertyInfo`.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationpropertyinfo.getresolvedcompositionobjectproperty
     */
    GetResolvedCompositionObjectProperty() {
        if (!this.HasProp("__IAnimationPropertyInfo2")) {
            if ((queryResult := this.QueryInterface(IAnimationPropertyInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationPropertyInfo2 := IAnimationPropertyInfo2(outPtr)
        }

        return this.__IAnimationPropertyInfo2.GetResolvedCompositionObjectProperty()
    }

;@endregion Instance Methods
}
