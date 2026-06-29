#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the backface visibility to be applied to a visual.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-dcomposition_backface_visibility
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct DCOMPOSITION_BACKFACE_VISIBILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
