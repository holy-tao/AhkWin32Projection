#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to render gradient mesh edges.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ne-d2d1_3-d2d1_patch_edge_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PATCH_EDGE_MODE extends Win32Enum{

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
