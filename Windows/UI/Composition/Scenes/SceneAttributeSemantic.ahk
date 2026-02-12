#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify scene attribute semantics.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.sceneattributesemantic
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneAttributeSemantic extends Win32Enum{

    /**
     * Index
     * @type {Integer (Int32)}
     */
    static Index => 0

    /**
     * Vertex
     * @type {Integer (Int32)}
     */
    static Vertex => 1

    /**
     * Normal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Texture Coordinate 0
     * @type {Integer (Int32)}
     */
    static TexCoord0 => 3

    /**
     * Texture Coordinate 1
     * @type {Integer (Int32)}
     */
    static TexCoord1 => 4

    /**
     * Color
     * @type {Integer (Int32)}
     */
    static Color => 5

    /**
     * Tangent
     * @type {Integer (Int32)}
     */
    static Tangent => 6
}
