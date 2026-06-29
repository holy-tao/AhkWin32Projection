#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the transformation data for a manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-manipulation_transform
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct MANIPULATION_TRANSFORM {
    #StructPack 4

    /**
     * Translation along the x-axis, in HIMETRIC units.
     */
    translationX : Float32

    /**
     * Translation along the y-axis, in HIMETRIC units.
     */
    translationY : Float32

    /**
     * Change in scale as a percentage, in HIMETRIC units.
     */
    scale : Float32

    /**
     * Expansion in user-defined coordinates, in HIMETRIC units.
     */
    expansion : Float32

    /**
     * Change in rotation, in radians.
     */
    rotation : Float32

}
