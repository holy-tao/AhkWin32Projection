#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the effective opacity value of a visual is applied to that visual’s content and children.
 * @see https://docs.microsoft.com/windows/win32/api//dcomptypes/ne-dcomptypes-dcomposition_opacity_mode
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_OPACITY_MODE extends Win32Enum{

    /**
     * The target visual defines a logical layer into which its entire sub-tree is composed with a starting effective opacity of 1.0. The original opacity value is then used to blend the layer onto the visual’s background.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_OPACITY_MODE_LAYER => 0

    /**
     * The opacity value is multiplied with the effective opacity of the parent visual and the result is then individually applied to each piece of content in this visual’s sub-tree.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_OPACITY_MODE_MULTIPLY => 1

    /**
     * The opacity mode is the same as that of the target visual’s parent visual.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_OPACITY_MODE_INHERIT => -1
}
