#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the backface visibility to be applied to a visual.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-dcomposition_backface_visibility
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_BACKFACE_VISIBILITY extends Win32Enum{

    /**
     * Surfaces in this visual's sub-tree are visible regardless of transformation.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE => 0

    /**
     * Surfaces in this visual's sub-tree are only visible when facing the observer.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN => 1

    /**
     * The back face visibility is the same as that of the target visual's parent visual.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT => -1
}
