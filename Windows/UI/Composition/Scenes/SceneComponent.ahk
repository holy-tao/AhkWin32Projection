#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneObject.ahk
#Include .\ISceneComponent.ahk
#Include .\ISceneComponentFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a functional part of a scene.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenecomponent
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneComponent extends SceneObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneComponent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneComponent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates what kind of component this is.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenecomponent.componenttype
     * @type {Integer} 
     */
    ComponentType {
        get => this.get_ComponentType()
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
    get_ComponentType() {
        if (!this.HasProp("__ISceneComponent")) {
            if ((queryResult := this.QueryInterface(ISceneComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneComponent := ISceneComponent(outPtr)
        }

        return this.__ISceneComponent.get_ComponentType()
    }

;@endregion Instance Methods
}
