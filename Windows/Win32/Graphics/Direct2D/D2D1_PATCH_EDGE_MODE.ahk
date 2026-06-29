#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to render gradient mesh edges.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_patch_edge_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_PATCH_EDGE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Render this patch edge aliased. Use this value for the internal edges of your gradient mesh.
     * @type {Integer (Int32)}
     */
    static D2D1_PATCH_EDGE_MODE_ALIASED => 0

    /**
     * Render this patch edge antialiased. Use this value for the external (boundary) edges of your mesh.
     * @type {Integer (Int32)}
     */
    static D2D1_PATCH_EDGE_MODE_ANTIALIASED => 1

    /**
     * Render this patch edge aliased and also slightly inflated. Use this for the internal edges of your gradient mesh when there could be t-junctions among patches. 
     *           Inflating the internal edges mitigates seams that can appear along those junctions.
     * @type {Integer (Int32)}
     */
    static D2D1_PATCH_EDGE_MODE_ALIASED_INFLATED => 2
}
