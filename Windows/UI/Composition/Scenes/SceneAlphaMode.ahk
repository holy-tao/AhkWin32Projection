#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the alpha mode for a scene.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenealphamode
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneAlphaMode extends Win32Enum{

    /**
     * Alpha mode is Opaque.
     * @type {Integer (Int32)}
     */
    static Opaque => 0

    /**
     * Alpha mode is AlphaTest.
     * @type {Integer (Int32)}
     */
    static AlphaTest => 1

    /**
     * Alpha mode is Blend.
     * @type {Integer (Int32)}
     */
    static Blend => 2
}
