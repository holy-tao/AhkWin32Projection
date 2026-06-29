#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSTATS {
    #StructPack 4

    dwSize : UInt32

    dwTrianglesDrawn : UInt32

    dwLinesDrawn : UInt32

    dwPointsDrawn : UInt32

    dwSpansDrawn : UInt32

    dwVerticesProcessed : UInt32

}
