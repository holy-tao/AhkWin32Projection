#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContainerVisual.ahk
#Include .\ISceneVisual.ahk
#Include .\ISceneVisualStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a container visual for the nodes of a 3D scene.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenevisual
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneVisual extends ContainerVisual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneVisual.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of SceneVisual.
     * @param {Compositor} compositor_ An instance of the [Compositor](../windows.ui.composition/compositor.md) class.
     * @returns {SceneVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenevisual.create
     */
    static Create(compositor_) {
        if (!SceneVisual.HasProp("__ISceneVisualStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Scenes.SceneVisual")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISceneVisualStatics.IID)
            SceneVisual.__ISceneVisualStatics := ISceneVisualStatics(factoryPtr)
        }

        return SceneVisual.__ISceneVisualStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the root node for scene.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenevisual.root
     * @type {SceneNode} 
     */
    Root {
        get => this.get_Root()
        set => this.put_Root(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SceneNode} 
     */
    get_Root() {
        if (!this.HasProp("__ISceneVisual")) {
            if ((queryResult := this.QueryInterface(ISceneVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneVisual := ISceneVisual(outPtr)
        }

        return this.__ISceneVisual.get_Root()
    }

    /**
     * 
     * @param {SceneNode} value 
     * @returns {HRESULT} 
     */
    put_Root(value) {
        if (!this.HasProp("__ISceneVisual")) {
            if ((queryResult := this.QueryInterface(ISceneVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneVisual := ISceneVisual(outPtr)
        }

        return this.__ISceneVisual.put_Root(value)
    }

;@endregion Instance Methods
}
