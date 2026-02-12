#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what kind a scene component is.
 * @remarks
 * This enumeration is used by the [SceneComponent.ComponentType](scenecomponent_componenttype.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenecomponenttype
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneComponentType extends Win32Enum{

    /**
     * The component is a mesh renderer.
     * @type {Integer (Int32)}
     */
    static MeshRendererComponent => 0
}
