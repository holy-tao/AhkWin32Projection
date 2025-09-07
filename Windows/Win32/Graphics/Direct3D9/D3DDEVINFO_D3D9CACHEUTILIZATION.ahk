#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Measure the cache hit rate performance for textures and indexed vertices.
 * @remarks
 * An efficient cache is typically closer to a 90 percent hit rate, and an inefficient cache is typically closer to a 10 percent hit rate (although a low percentage is not necessarily a problem).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9cacheutilization
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3D9CACHEUTILIZATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The hit rate for finding a texture in the texture cache. This assumes there is a texture cache. Increasing the level-of-detail bias to use the most detailed texture, using many large textures, or producing a near random texture access pattern on large textures with custom shader code can dramatically affect the texture cache hit rate.
     * @type {Float}
     */
    TextureCacheHitRate {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The hit rate for finding transformed vertices in the vertex cache. The GPU is designed to transform indexed vertices and may store them in a vertex cache. If you are using meshes, [**D3DXOptimizeFaces**](d3dxoptimizefaces.md) or [**D3DXOptimizeVertices**](d3dxoptimizevertices.md) may result in better vertex cache utilization.
     * @type {Float}
     */
    PostTransformVertexCacheHitRate {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
