#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the effective opacity value of a visual is applied to that visual’s content and children.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-dcomposition_opacity_mode
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct DCOMPOSITION_OPACITY_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
