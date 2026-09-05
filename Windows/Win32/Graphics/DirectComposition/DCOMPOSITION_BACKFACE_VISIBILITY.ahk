#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the backface visibility to be applied to a visual.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-dcomposition_backface_visibility
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
class DCOMPOSITION_BACKFACE_VISIBILITY extends Win32Enum {

    /**
     * Surfaces in this visual's sub-tree are visible regardless of transformation.
     * Native name: DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE
     * @type {Integer (Int32)}
     */
    static VISIBLE => 0

    /**
     * Surfaces in this visual's sub-tree are only visible when facing the observer.
     * Native name: DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN
     * @type {Integer (Int32)}
     */
    static HIDDEN => 1

    /**
     * The back face visibility is the same as that of the target visual's parent visual.
     * Native name: DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT
     * @type {Integer (Int32)}
     */
    static INHERIT => -1
}
