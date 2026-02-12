#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneMaterialInput.ahk
#Include .\ISceneSurfaceMaterialInput.ahk
#Include .\ISceneSurfaceMaterialInputStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an input to a composition surface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenesurfacematerialinput
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneSurfaceMaterialInput extends SceneMaterialInput {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneSurfaceMaterialInput

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneSurfaceMaterialInput.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of SceneSurfaceMaterialInput.
     * @param {Compositor} compositor_ An instance of the [Compositor](../windows.ui.composition/compositor.md) class.
     * @returns {SceneSurfaceMaterialInput} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenesurfacematerialinput.create
     */
    static Create(compositor_) {
        if (!SceneSurfaceMaterialInput.HasProp("__ISceneSurfaceMaterialInputStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Scenes.SceneSurfaceMaterialInput")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISceneSurfaceMaterialInputStatics.IID)
            SceneSurfaceMaterialInput.__ISceneSurfaceMaterialInputStatics := ISceneSurfaceMaterialInputStatics(factoryPtr)
        }

        return SceneSurfaceMaterialInput.__ISceneSurfaceMaterialInputStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the bitmap interpolation mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenesurfacematerialinput.bitmapinterpolationmode
     * @type {Integer} 
     */
    BitmapInterpolationMode {
        get => this.get_BitmapInterpolationMode()
        set => this.put_BitmapInterpolationMode(value)
    }

    /**
     * Gets or sets the composition surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenesurfacematerialinput.surface
     * @type {ICompositionSurface} 
     */
    Surface {
        get => this.get_Surface()
        set => this.put_Surface(value)
    }

    /**
     * Gets or sets a value that indicates how wrapping occurs on the U axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenesurfacematerialinput.wrappingumode
     * @type {Integer} 
     */
    WrappingUMode {
        get => this.get_WrappingUMode()
        set => this.put_WrappingUMode(value)
    }

    /**
     * Gets or sets a value that indicates how wrapping occurs on the V axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenesurfacematerialinput.wrappingvmode
     * @type {Integer} 
     */
    WrappingVMode {
        get => this.get_WrappingVMode()
        set => this.put_WrappingVMode(value)
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
    get_BitmapInterpolationMode() {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.get_BitmapInterpolationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BitmapInterpolationMode(value) {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.put_BitmapInterpolationMode(value)
    }

    /**
     * 
     * @returns {ICompositionSurface} 
     */
    get_Surface() {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.get_Surface()
    }

    /**
     * 
     * @param {ICompositionSurface} value 
     * @returns {HRESULT} 
     */
    put_Surface(value) {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.put_Surface(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WrappingUMode() {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.get_WrappingUMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WrappingUMode(value) {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.put_WrappingUMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WrappingVMode() {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.get_WrappingVMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WrappingVMode(value) {
        if (!this.HasProp("__ISceneSurfaceMaterialInput")) {
            if ((queryResult := this.QueryInterface(ISceneSurfaceMaterialInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneSurfaceMaterialInput := ISceneSurfaceMaterialInput(outPtr)
        }

        return this.__ISceneSurfaceMaterialInput.put_WrappingVMode(value)
    }

;@endregion Instance Methods
}
