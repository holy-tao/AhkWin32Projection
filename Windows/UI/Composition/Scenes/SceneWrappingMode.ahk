#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how wrapping occurs for a scene.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenewrappingmode
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneWrappingMode extends Win32Enum{

    /**
     * Clamp to edge.
     * @type {Integer (Int32)}
     */
    static ClampToEdge => 0

    /**
     * Mirrored repeat.
     * @type {Integer (Int32)}
     */
    static MirroredRepeat => 1

    /**
     * Repeat.
     * @type {Integer (Int32)}
     */
    static Repeat => 2
}
